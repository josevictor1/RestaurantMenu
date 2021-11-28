//
//  SceneDelegate.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setWindow(with: scene)
        setUpNavigationFlow()
    }
    
    private func setWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
    }
    
    private func setUpNavigationFlow() {
        let navigationController = UINavigationController()
        setRootNavigationViewController(navigationController)
        setUpMainCoordinator(with: navigationController)
    }
    
    private func setRootNavigationViewController(_ navigationController: UINavigationController) {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func setUpMainCoordinator(with navigationController: UINavigationController) {
        mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator?.start()
    }
}

