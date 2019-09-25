//
//  QiitaFetchable.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import Foundation
import Combine

protocol QiitaFetchable {
  func fetchQiita(tag: String) -> AnyPublisher<[QiitaData], QiitaError>
}
