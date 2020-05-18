//
//  HeroesListView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 11.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

struct HeroesListView: View {
     @ObservedObject var heroesListViewModel: HeroesListViewModel
        var body: some View {
                NavigationView {
                    VStack(alignment: .center,spacing: 0) {
                        FavoriteHeroesView(favoritesViewModel: .init()).padding(.leading, 4)
                        LoadingView(isShowing: .constant(self.heroesListViewModel.isLoading), title: "") {
                            
                            List(self.heroesListViewModel.heroes, id: \.id) { hero in
                                HeroListCellView(hero: hero, isFavorite: hero.isFavorite())
                                    .onAppear{
                                        //son cell e gelmismiyiz onu kontrol edip eger gelmissek yeni herolari fetch ediyoruz
                                        if (self.shouldLoadNextPage(currentItem: hero)) {
                                            self.heroesListViewModel.fetchHeroes()
                                        }
                                }
                            }
                        }
                        
                    }.navigationBarTitle(Text(""), displayMode: .inline)
                    .navigationBarItems(leading:
                            HStack {
                                Image("marvel")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 35, alignment: .center)
                                .padding(UIScreen.main.bounds.size.width/2-35)
                            }
                        
                    )
                }
            
        }
        
        //son cell e gelmismiyiz onu kontrol ediyor (eger gelmissek yeni herolari fetch edicez)
        private func shouldLoadNextPage(currentItem item: HeroPresentation) -> Bool {
            let currentIndex = self.heroesListViewModel.heroes.lastIndex(where: { $0.id == item.id } )
            let lastIndex = self.heroesListViewModel.heroes.count - 1
            let offset = 1
            return currentIndex == lastIndex - offset
        }
    }



struct NavLogo: View {

    var body: some View {
            VStack {
                Image("marvel")
                    .resizable()
                    .aspectRatio(2, contentMode: .fit)
                    .imageScale(.large)
            }
            .frame(width: 200)
            .background(Color.clear)
    }
}
