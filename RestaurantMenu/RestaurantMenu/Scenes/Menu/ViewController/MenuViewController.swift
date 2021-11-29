//
//  MenuViewController.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 27/11/21.
//

import Core
import UIKit

final class MenuViewController: UIViewController {
    
    private let menuView = MenuView()
    var viewModel: MenuViewModelProtocol?
    
    override func loadView() {
        view = menuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        setUpNavigationBarAppearence()
        setUpMenuViewActions()
    }
    
    private func setUpMenuViewActions() {
        menuView.onSectionTapped = { [weak self] section in
            self?.viewModel?.selectMenuSection(atIndex: section)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRestaurantData()
    }
    
    private func loadRestaurantData() {
        startLoading()
        viewModel?.loadRestaurantData()
    }
    
    private func setUpNavigationBarAppearence() {
        navigationController?.navigationBar.standardAppearance = .montserratNavigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = .montserratNavigationBarAppearance
    }
}

extension MenuViewController: MenuViewModelDelegate {
  
    func didFetchRestaurantName(_ restaurantName: String) {
        title = restaurantName
        stopLoading()
    }

    func didChangeMenuItems(_ menuItems: [MenuItem]) {
        menuView.set(menuItems: menuItems)
    }
    
    func didChangeMenuSections(_ menuSections: [MenuSection]) {
        menuView.set(menuSections: menuSections)
    }
    
    func didFailedOnLoadRestaurantData() {
        stopLoading()
    }
}
