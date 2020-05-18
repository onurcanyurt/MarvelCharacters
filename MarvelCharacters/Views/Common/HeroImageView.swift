//
//  HeroImageView.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 11.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import SwiftUI

struct HeroImageView: View {
    
    @ObservedObject var imageDataLoader:ImageDataLoader
    @State var image: UIImage = UIImage(named: "image-not-available")!
    @State var isImageLoaded:Bool = false
    var width: Double
    var height: Double
    
    init(withThumbnail thumbnail: ThumbnailPresentation?,
        width: Double = 100.0,
        height: Double = 100.0) {
           
        imageDataLoader = ImageDataLoader(thumbnail: thumbnail)
           self.width = width
           self.height = height
       }
    
    var body: some View {

        LoadingView(isShowing: .constant(!isImageLoaded), title: "") {
            VStack{
                Image(uiImage: self.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: CGFloat(self.width), height: CGFloat(self.height), alignment: .center)
            }.onReceive(self.imageDataLoader.didChange) { data in
                // onReceive, imageDataLoader didChange.send calisir calismaz calisir
                self.isImageLoaded = true
                self.image = UIImage(data: data) ?? UIImage(named: "image-not-available")!
            }
        }
    }
}

