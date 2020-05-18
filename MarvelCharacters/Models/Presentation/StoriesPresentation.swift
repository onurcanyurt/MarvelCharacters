//
//  Stories.swift
//  MarvelHeroes_SwiftUI
//
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import MarvelAPI

struct StoriesPresentation: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemPresentation]
    let returned: Int
}

extension StoriesPresentation {
    init(story: StoriesItems) {
        self.available = story.available
        self.collectionURI = story.collectionURI
        self.returned = story.returned
        self.items = story.items.map{element in StoriesItemPresentation(resourceURI: element.resourceURI, name: element.name, type: element.type)}
    }
}

struct StoriesItemPresentation: Codable {
    let resourceURI: String
    let name: String
    let type: String
}
