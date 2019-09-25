//
//  QiitaError.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import Foundation

enum QiitaError: Error {
  case parsing(description: String)
  case network(description: String)
}
