//
//  Array+Ext.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 16.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation

extension Array where Element == HeroPresentation {
    
    public var ignoreNotAvailableImages: [HeroPresentation] {
        return self.filter({
            if let thumb = $0.thumbnail, let path = thumb.path {
                if(!path.contains("image_not_available")){
                    return true
                }
            }
            return false
        })
    }
}
