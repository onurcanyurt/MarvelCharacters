//
//  HeroDetailsViewModel.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation

class HeroDetailsViewModel: ObservableObject {
    let hero: HeroPresentation
    let comics: [ComicsItemPresentation]
    let series: [ComicsItemPresentation]
    let stories: [StoriesItemPresentation]
    let events: [ComicsItemPresentation]
    @Published var isFavorite: Bool = false
    
    init(hero: HeroPresentation) {
        self.hero = hero
        self.comics = self.hero.comics?.items ?? []
        self.series = self.hero.series?.items ?? []
        self.stories = self.hero.stories?.items ?? []
        self.events = self.hero.events?.items ?? []
        
        UserDefaultsService.shared.loadHeroes { heroes in
            self.isFavorite = heroes.contains(self.hero)
        }
    }
    
    func toggleFavorite() {
        
        self.isFavorite = !self.isFavorite
        
        UserDefaultsService.shared.loadHeroes { heroes in
            if heroes.contains(self.hero) {
                UserDefaultsService.shared.removeHero(heroToRemove: self.hero)
            } else {
                UserDefaultsService.shared.saveHeroes(hero: heroes+[self.hero])
            }
        }
        
    }
}
