//
//  Hero.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import MarvelAPI

struct HeroListPresentation: Codable {
    let heroList: [HeroPresentation]
    
    init(heroList: [Character]) {
        self.heroList = heroList.map{ HeroPresentation(item: $0) }
    }
}


public struct HeroPresentation: Codable, Equatable {
    let id: Int
    var name: String
    let description: String
    let thumbnail: ThumbnailPresentation? //thumbnail modeli icinde icinde sadece hero foto url si oluyordu
    let resourceURI: String?
    let comics, series: ComicsPresentation?
    let stories: StoriesPresentation?
    let events: ComicsPresentation?
    let urls: [URLElement]?
}


extension HeroPresentation {
    
    func formatedName() -> [String] {
        let splitedName = self.name.split(separator: "(", maxSplits: 1)
        return splitedName.count > 1 ? [String(splitedName[0]),String(splitedName[1]).replacingOccurrences(of: ")", with: "")] : [String(splitedName[0]), ""]
    }
    
    public static func ==(lhs:HeroPresentation, rhs:HeroPresentation) -> Bool {
        return lhs.id == rhs.id
    }
    
    func isFavorite() -> Bool {
        return UserDefaultsService.shared.isFavorite(hero: self)
    }
}

extension HeroPresentation {

  init(item: Character){
      self.id = item.id
      self.name = item.name
      self.description = item.details
      self.thumbnail = ThumbnailPresentation(thumb: item.thumbnail)
      self.resourceURI = item.resourceURI
      self.comics = ComicsPresentation(comic: item.comics)
      self.series = ComicsPresentation(comic: item.series)
      self.stories = StoriesPresentation(story: item.stories)
      self.events = ComicsPresentation(comic: item.events)
       
      self.urls = item.urls.map{ element in
          return URLElement(type: element.type, url: String(describing: element.url))
      }
  }
}


struct URLElement: Codable {
    let type: String
    let url: String
}

