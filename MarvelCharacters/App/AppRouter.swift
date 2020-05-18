//
//  AppRouter.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 10.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

final class AppRouter {
    var window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        makeUIDark()
    }
  
    func start(scene:UIWindowScene){
        let heroesListView = HeroesListView(heroesListViewModel: .init(apiService: app.service))
        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: heroesListView.environment(\.colorScheme, .dark))
        window.makeKeyAndVisible()
        self.window = window
    }
    

    func makeUIDark(){
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
}
