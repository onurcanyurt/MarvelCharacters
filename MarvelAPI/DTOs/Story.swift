//
//  Story.swift
//  MarvelAPI
//
//  Created by Onurcan Yurt on 17.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation

public struct StoriesItems: Codable, Hashable {
    public let available: Int
    public let collectionURI: String
    public let items: [Story]
    public let returned: Int
}

public struct Story: Codable, Hashable {
    public let resourceURI: String
    public let name: String
    public let type: String
}

