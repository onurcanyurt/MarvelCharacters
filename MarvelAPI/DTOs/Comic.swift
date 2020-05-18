//
//  Comic.swift
//  MarvelAPI
//
//  Created by Onurcan Yurt on 17.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation


public struct ComicsItems: Codable, Hashable {
    public let items: [Comic]
    public let available: Int
    public let collectionURI: String
    public let returned: Int
}

public struct Comic: Codable, Hashable {
    public let name: String
    public let resourceURI: String
}
