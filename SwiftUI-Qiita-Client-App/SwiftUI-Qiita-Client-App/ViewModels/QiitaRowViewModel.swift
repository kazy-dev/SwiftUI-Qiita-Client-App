//
//  QiitaRowViewModel.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import Foundation
import SwiftUI

struct QiitaRowViewModel: Identifiable {
  private let item: QiitaData
  
  var id: String {
    title + name
  }
  
  var title: String {
    item.title
  }
  
  var name: String {
    item.user.name
  }
  
  var url: URL? {
    guard !item.urlString.isEmpty else {
      return nil
    }
    return URL(string: item.urlString)
  }
  
  init(item: QiitaData) {
    self.item = item
  }
}

extension QiitaRowViewModel: Hashable {
  static func == (lhs: QiitaRowViewModel, rhs: QiitaRowViewModel) -> Bool {
    return lhs.title == rhs.title
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.title)
  }
}
