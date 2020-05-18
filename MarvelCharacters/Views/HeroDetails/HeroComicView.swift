//
//  HeroComicView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 11.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

struct HeroComicView: View {
    var comics: [ComicsItemPresentation]
    
    init (items: [ComicsItemPresentation]) {
        comics = items
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Comics")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(self.comics, id:\.name){ item in
                        VStack {
                            Text("\(item.name)").foregroundColor(Color.white)
                
                                .frame(width: 120, height: 80)
                                .padding(.all)
                                .font(.system(size: 14, weight: .bold, design: .default))
                                .multilineTextAlignment(.center)
                                
                        }.background(Color.black)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 2))
                        
                    }
                }
            } .padding(.bottom)
        }
    }
}
