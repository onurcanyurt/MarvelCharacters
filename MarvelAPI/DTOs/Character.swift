//
//  Character.swift
//  MarvelAPI
//
//  Created by Onurcan Yurt on 16.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation


public struct CharacterItems: Decodable {
    
    public let data: CharactersDataResponse
    
    public struct CharactersDataResponse: Decodable {
        let results: [Character]
        let offset: Int
        let limit: Int
        let total: Int  //The total number of resources available given the current filter set.
    }
}


public struct Character: Codable, Hashable, Identifiable {
    
    public static let wikiUrlType = "detail"
    
    public let id: Int
    public let name: String
    public let details: String
    public let thumbnail: CharacterThumbnail
    public let resourceURI: String
    
    public let urls: [CharacterUrl]
    public let comics: ComicsItems
    public let series: ComicsItems
    public let events: ComicsItems
    public let stories: StoriesItems
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case details = "description"
        case thumbnail
        case resourceURI
        case urls
        case comics
        case series
        case events
        case stories
    }
}

public struct CharacterUrl: Codable, Hashable {
    public let type: String
    public let url: URL
}

public struct CharacterThumbnail: Codable, Hashable {
    public let path: String
    public let ext: String
    
    var completeURL: URL? {
        return URL(string: path + "." + self.ext)
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}


