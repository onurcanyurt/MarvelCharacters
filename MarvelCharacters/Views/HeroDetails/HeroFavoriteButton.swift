//
//  HeroAddFavoriteButton.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 14.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import SwiftUI

struct HeroFavoriteButton: View {
    
    @Binding var isFavved: Bool
    
    let btnColor: Color = Color.init(red: 204, green: 0, blue: 0)
    let action: () -> Void
    
    var body: some View {
        VStack{
        isFavved ? Button(action: action, label: {
            Text("👎  Remove Hero from Squad")
                .padding()
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.size.width * 0.9, height: 50)
                
        }): Button(action: action, label: {
            Text("💪  Add Hero to The Squad")
                .padding()
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.size.width * 0.9, height: 50)
                
        })
        }
            .background(isFavved ? Color.clear : btnColor)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(btnColor, lineWidth: 2))
        
    }
}
