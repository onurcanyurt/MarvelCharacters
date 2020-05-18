//
//  Thumbnail.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import MarvelAPI


struct ThumbnailPresentation: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

extension ThumbnailPresentation {
    init(thumb: CharacterThumbnail) {
        self.path = thumb.path
        self.thumbnailExtension = thumb.ext
    }
}
