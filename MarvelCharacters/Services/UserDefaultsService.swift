//
//  UserDefaultsService.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation

class UserDefaultsService {
    public static let shared = UserDefaultsService()
    private init () {}
    
    func saveHeroes(hero: [HeroPresentation]){
        let heroData = try! JSONEncoder().encode(hero)
        UserDefaults.standard.set(heroData, forKey: "heroes")
    }
    
    func loadHeroes(result: @escaping ([HeroPresentation]) -> Void) {
        if let heroData = UserDefaults.standard.data(forKey: "heroes") {
            let heroes = try! JSONDecoder().decode([HeroPresentation].self, from: heroData)
            result(heroes)
        } else {
            result([])
        }
    }
    
    func removeHero(heroToRemove: HeroPresentation) {
        if let heroData = UserDefaults.standard.data(forKey: "heroes") {
            let heroes = try! JSONDecoder().decode([HeroPresentation].self, from: heroData)
            saveHeroes(hero: heroes.filter({ (hero) -> Bool in
                hero != heroToRemove
            }))
        }
    }
    
    func removeAllFavorites() {
        UserDefaults.standard.set([], forKey: "heroes")
    }
    
    func isFavorite(hero: HeroPresentation) -> Bool {
        var isFavorite: Bool = false
        loadHeroes { heroes in
            if heroes.contains(hero) {
                isFavorite = true
            }
        }
        return isFavorite
    }
}
