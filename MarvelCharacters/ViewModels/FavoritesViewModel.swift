//
//  FavoritesViewModel.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var heroes: [HeroPresentation] = []
    
    init() {
       fetchFavorites()
       NotificationCenter.default.addObserver(self,
                      selector: #selector(fetchFavorites),
                      name: NSNotification.UpdateFavList,object: nil)
    }
    
    //observerda da kullanilacagi icin @objc sekline yaptik
    @objc func fetchFavorites() {
       UserDefaultsService.shared.loadHeroes { heroes in
           self.heroes = heroes
       }
    }
    
    
    
    deinit { NotificationCenter.default.removeObserver(self, name:  NSNotification.UpdateFavList, object: nil) }
}
