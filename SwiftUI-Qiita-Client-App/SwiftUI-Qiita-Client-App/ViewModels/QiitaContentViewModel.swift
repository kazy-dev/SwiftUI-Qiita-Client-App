//
//  QiitaContentViewModel.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class QiitaContentViewModel: ObservableObject {
  @Published var tag: String = ""
  @Published var dataSource: [QiitaRowViewModel] = []

  private let qiitaFetcher: QiitaFetchable
  private var disposables = Set<AnyCancellable>()

  init(
    qiitaFetcher: QiitaFetchable,
    scheduler: DispatchQueue = DispatchQueue(label: "qiitaContentViewModel")
  ) {
    self.qiitaFetcher = qiitaFetcher
    _ = $tag
      .dropFirst(1)
      .debounce(for: .seconds(0.5), scheduler: scheduler)
      .sink(receiveValue: {_ in self.fetchQiita(tag: self.tag)})
  }

  func fetchQiita(tag: String) {
    qiitaFetcher.fetchQiita(tag: tag)
      .map { response in
        response.map(QiitaRowViewModel.init)
      }
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { [weak self] value in
          guard let self = self else { return }
          switch value {
          case .failure:
            self.dataSource = []
          case .finished:
            break
          }
        },
        receiveValue: { [weak self] list in
          guard let self = self else { return }
          self.dataSource = list
          print(list)
      })
      .store(in: &disposables)
  }
}
