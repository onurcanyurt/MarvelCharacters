//
//  SceneDelegate.swift
//  MarvelSwiftUI-MVVM
//
//  Created by Onurcan Yurt on 10.05.2020.
//  Copyright © 2020 Onurcan Yurt. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                
            guard let windowScene = scene as? UIWindowScene else { return }
            app.router.start(scene: windowScene)
        }


}

