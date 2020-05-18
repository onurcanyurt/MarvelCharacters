//
//  ImageDataLoader.swift
//  MarvelHeroes_SwiftUI
//
//  Created by Onurcan Yurt on 10/05/20.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import Combine



//Thumbnail datasindan image elde ederken ImageDataLoader kullaniyoruz
class ImageDataLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
           didChange.send(data) //burasi calisir calismaz onReceive calisir
        }
    }
    
    init(thumbnail: ThumbnailPresentation?) {
        guard let thumbnailExtension = thumbnail?.thumbnailExtension else { return }
        guard let thumbnailPath = thumbnail?.path else { return }
        guard let url = URL(string: (thumbnailPath.replacingOccurrences(of: "http", with: "https")).appending("."+thumbnailExtension)) else { return }
 
        let codeImage: String = url.pathComponents[url.pathComponents.count-2]+url.pathComponents[url.pathComponents.count-1]
        let cachedImage = loadCachedImage(key: codeImage)
        if (cachedImage != nil) {
            DispatchQueue.main.async {
                self.data = cachedImage!
            }
        }
        else if (!codeImage.contains("image_not_available") && cachedImage == nil) {
            loadImage(key: codeImage, url: url)
        }
    }
    
    private func filePath(forKey key: String) -> URL? {
        guard let documentURL = FileManager.default.urls(for: .documentDirectory,
                                                         in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        
        return documentURL.appendingPathComponent(key + ".png")
    }
    
    private func loadCachedImage(key: String) -> Data? {
        if let filePath = self.filePath(forKey: key),
            let fileData = FileManager.default.contents(atPath: filePath.path) {
            return fileData
        }
        return nil
    }
    
    private func saveImageData(key: String, fileData: Data) {
        if let filePath = filePath(forKey: key) {
            do  {
                try fileData.write(to: filePath, options: .atomic)
            } catch let err {
                print("Saving file resulted in error: ", err)
            }
        }
    }
    
    private func loadImage(key: String, url: URL) {

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            self.saveImageData(key: key, fileData: data)
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
