//
//  HeroesListViewModel.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import MarvelAPI
import Combine

class HeroesListViewModel: ObservableObject {
    
    @Published var heroes: [HeroPresentation] = []
    @Published var allHeroes: [HeroPresentation] = []
    @Published var isLoading: Bool = false
    

    private var disposables = Set<AnyCancellable>()
    var marvelAPI: MarvelAPI
    
    init(apiService: MarvelAPI) {
        self.marvelAPI = apiService
        fetchHeroes()
    }
    
    func fetchHeroes() {
        
        if(heroes.count > 100){ return } //100 hero'dan fazla yuklenmesine izin vermiyoruz

        self.isLoading = true
       
        marvelAPI.fetch(offset: heroes.count)
             .map{ return HeroListPresentation(heroList: $0) }
             .receive(on: DispatchQueue.main)
             .sink(receiveCompletion: { [weak self] value in
               guard let self = self else { return }
               switch value {
               case .failure:
                 self.isLoading = false
                 self.heroes = []
               case .finished:
                 self.isLoading = false
                 break
               }
             }, receiveValue: { [weak self] weather in
                 guard let self = self else { return }
                self.heroes.append(contentsOf: weather.heroList.ignoreNotAvailableImages)
             })
             .store(in: &disposables)
    }
}

