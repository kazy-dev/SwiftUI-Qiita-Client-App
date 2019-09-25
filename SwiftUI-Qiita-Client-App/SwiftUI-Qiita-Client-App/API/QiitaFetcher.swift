//
//  QiitaFetcher.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import Foundation
import Combine


class QiitaFetcher {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}

// MARK: - QiitaFetchable

extension QiitaFetcher: QiitaFetchable {
  func fetchQiita(tag: String) -> AnyPublisher<[QiitaData], QiitaError> {
    return fetchQiitaData(with: qiitaComponents(tag: tag))
  }
  
  private func fetchQiitaData<T>(with components: URLComponents) -> AnyPublisher<T, QiitaError> where T: Decodable {
    guard let url = components.url else {
      let error = QiitaError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }
    return session.dataTaskPublisher(for: URLRequest(url: url))
      .mapError { error in
        .network(description: error.localizedDescription)
    }
    .flatMap(maxPublishers: .max(1)) { pair in
      decode(pair.data)
    }
    .eraseToAnyPublisher()
  }
}

// MARK: - Qiita API

private extension QiitaFetcher {
  struct QiitaAPI {
    static let scheme = "https"
    static let host = "qiita.com"
    static let path = "/api/v2"
  }
  
  func qiitaComponents(tag: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = QiitaAPI.scheme
    components.host = QiitaAPI.host
    components.path = QiitaAPI.path + "/items"
    
    components.queryItems = [
      URLQueryItem(name: "per_page", value: "50"),
      URLQueryItem(name: "query", value: "tag:" + tag),
    ]
    print(components.url?.absoluteString ?? "nil")
    return components
  }
}

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, QiitaError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970
  
  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
  }
  .eraseToAnyPublisher()
}
