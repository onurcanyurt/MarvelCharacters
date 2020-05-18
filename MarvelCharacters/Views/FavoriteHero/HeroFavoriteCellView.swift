//
//  HeroFavoriteCellView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 14.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

struct HeroFavoriteCellView: View {
    
    @State var hero: HeroPresentation
    @State var isFavorite: Bool
    let screenBound = UIScreen.main.bounds
    
    var body: some View {
        
        NavigationLink(destination: HeroDetailsView(heroDetailsViewModel: .init(hero: self.hero))) {
            VStack(alignment: .leading, spacing: 8) {
                
                Spacer().frame(height: 3)
                
                HeroImageView(withThumbnail: self.hero.thumbnail,
                              width: Double(self.screenBound.width) * 0.2,
                              height: Double(self.screenBound.height) * 0.1)
                    .clipShape(Circle())
                
                Text(self.hero.formatedName()[0])
                    .font(.system(size: 13, weight: .bold, design: .default))
                    .frame(width: self.screenBound.width * 0.22, height: self.screenBound.height * 0.06, alignment: .top)
                    .multilineTextAlignment(.center)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}




#if DEBUG
struct HeroFavoriteCellViewPreviews : PreviewProvider {
    static var previews: some View {
        HeroListCellView(hero: HeroPresentation(id: 1, name: "ali", description: "", thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil), isFavorite: false)
    }
}
#endif
