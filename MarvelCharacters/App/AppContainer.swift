//
//  AppContainer.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 10.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import MarvelAPI


let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = MarvelAPI()
}
