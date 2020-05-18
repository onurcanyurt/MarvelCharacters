//
//  FavoriteHeroesView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 11.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

import SwiftUI

struct FavoriteHeroesView: View {
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       ScrollView (.horizontal, showsIndicators: false) {
        Spacer().frame(height:10)
        HStack{
            ForEach(favoritesViewModel.heroes, id: \.id ) { hero in
                HeroFavoriteCellView(hero: hero, isFavorite: hero.isFavorite())
            }
        }
    }
    }
}
