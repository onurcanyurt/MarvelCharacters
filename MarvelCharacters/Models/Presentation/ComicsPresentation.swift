//
//  Comics.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import MarvelAPI


struct ComicsPresentation: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItemPresentation]
    let returned: Int
}


extension ComicsPresentation {
    init(comic: ComicsItems) {
        self.available = comic.available
        self.collectionURI = comic.collectionURI
        self.returned = comic.returned
        self.items = comic.items.map{element in ComicsItemPresentation(resourceURI: element.resourceURI, name: element.name)}
    }
}


struct ComicsItemPresentation: Codable {
    let resourceURI: String
    let name: String
}
