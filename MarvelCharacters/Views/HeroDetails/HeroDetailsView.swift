//
//  HeroDetailsView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 11.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

struct HeroDetailsView: View {
    @ObservedObject var heroDetailsViewModel: HeroDetailsViewModel
    
    let screenBound = UIScreen.main.bounds
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                VStack {
                    HeroImageView(withThumbnail: heroDetailsViewModel.hero.thumbnail, width: Double(self.screenBound.width), height: Double(self.screenBound.height) * 0.6)
                }
                Spacer().frame(height: 24)
                //self.heroDetailsViewModel.isFavorite
                HeroFavoriteButton(isFavved: $heroDetailsViewModel.isFavorite,action: {
                    self.heroDetailsViewModel.toggleFavorite()
                    NotificationCenter.default.post(name: NSNotification.UpdateFavList,
                    object: nil, userInfo: nil)
                })
                
                Spacer().frame(height: 24)
                
                VStack {
                    HeroComicView(items: heroDetailsViewModel.comics)
                    HeroStoryView(items: heroDetailsViewModel.stories)
                    HeroSerieView(items: heroDetailsViewModel.series)
                    HeroEventView(items: heroDetailsViewModel.events)
                }
                 
                               
            }
            .navigationBarTitle(heroDetailsViewModel.hero.formatedName()[0])
        }
    }
}
