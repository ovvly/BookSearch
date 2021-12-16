//
//  SceneDelegate.swift
//  BooksSearch
//
//  Created by Jakub Sowa on 16/12/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let flowController = FlowController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = flowController.rootViewController()
        window?.makeKeyAndVisible()
    }
}

