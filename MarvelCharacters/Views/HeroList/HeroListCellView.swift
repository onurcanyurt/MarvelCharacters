//
//  HeroListCellView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 11.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

struct HeroListCellView: View {
    
    @State var hero: HeroPresentation
    @State var isFavorite: Bool
    let screenBound = UIScreen.main.bounds
    
    
    var body: some View {
        
        ZStack (alignment: Alignment.bottomLeading){
            NavigationLink(destination: HeroDetailsView(heroDetailsViewModel: .init(hero: self.hero))) {
            EmptyView()
        }
            HeroImageView(withThumbnail: self.hero.thumbnail, width: Double(self.screenBound.width) * 0.92, height: Double(self.screenBound.height) * 0.6).cornerRadius(20)
           // Text(self.hero.formatedName()[0]).font(.headline).padding(.all, CGFloat(self.screenBound.width * 0.05))
        }
    }
}





#if DEBUG
struct HeroListCellView_Previews : PreviewProvider {
    static var previews: some View {
        HeroListCellView(hero: HeroPresentation(id: 1, name: "ali", description: "", thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil), isFavorite: false)
    }
}
#endif
