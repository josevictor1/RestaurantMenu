//
//  MainCoordinator.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import Core
import UIKit

final class MainCoordinator: NavigationCoordinator {
 
    var parent: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController?.setViewControllers([makeMenuViewController()], animated: true)
    }
    
    private func makeMenuViewController() -> MenuViewController {
        let menuViewController = MenuViewController()
        return menuViewController
    }
}
