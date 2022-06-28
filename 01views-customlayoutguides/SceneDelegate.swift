//
//  SceneDelegate.swift
//  01views-customlayoutguides
//
//  Created by Glenn Adams on 6/28/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let ws = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: ws)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
    }



}

