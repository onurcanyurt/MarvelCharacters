//
//  MarvelAPI.swift
//  MarvelAPI
//
//  Created by Onurcan Yurt on 16.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//


import Foundation
import CryptoSwift
import Combine


// MARK: - MarvelFetchable

public protocol MarvelFetchable {
  func fetch(offset: Int) -> AnyPublisher<[Character], MarvelError>
}

// MARK: - MarvelAPI

public class MarvelAPI {
      private let session: URLSession
        
      public  init(session: URLSession = .shared) {
        self.session = session
      }
}

extension MarvelAPI: MarvelFetchable {
   
         public func fetch(offset: Int) -> AnyPublisher<[Character], MarvelError> {
             return forecast(with: makeForecastComponents(offset: offset))
         }


        public func forecast(with components: URLComponents) -> AnyPublisher<[Character], MarvelError>  {
            guard let url = components.url else {
                return Fail(error: MarvelError.network).eraseToAnyPublisher()
            }
        
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
                
            return session.dataTaskPublisher(for: URLRequest(url: url))
                  .mapError { MarvelError.url(error: $0) }
                  .map { $0.data }
                  .decode(type: CharacterItems.self, decoder: decoder)
                  .mapError { error in
                      return MarvelError.decoder(error: error)
                    }
                  .map { $0.data.results }
                  .eraseToAnyPublisher()
        }
}


 extension MarvelAPI {
    
         struct OpenMarvelMap {
             static let scheme = "https"
             static let host = "gateway.marvel.com"
             static let path = "/v1/public"
             static let publicKey = "d15e60bdeba26495261713412a157a0a"
             static let privateKey = "c804c09a7cb570733264cd458266bda45452ea21"
             static let ts = Date().timeIntervalSince1970.description
             static let hash = "\(ts)\(privateKey)\(publicKey)".md5()
             static let limit = 30
        }
         
         private func baseQueryItems(offset:Int) -> [URLQueryItem] {
             return [
                URLQueryItem(name: "limit", value: String(OpenMarvelMap.limit)),
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "apikey", value: OpenMarvelMap.publicKey),
                URLQueryItem(name: "hash", value: OpenMarvelMap.hash),
                URLQueryItem(name: "ts", value: OpenMarvelMap.ts)
             ]
         }

         public func makeForecastComponents(offset:Int) -> URLComponents {
             var components = URLComponents()
             components.scheme = OpenMarvelMap.scheme
             components.host = OpenMarvelMap.host
             components.path = OpenMarvelMap.path + "/characters"
             components.queryItems = baseQueryItems(offset: offset)
             return components
       }
}
