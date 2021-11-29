//
//  MenuViewModel.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

protocol MenuViewModelProtocol: AnyObject {
    func loadRestaurantData()
    func selectMenuSection(atIndex index: Int)
}

protocol MenuViewModelDelegate: AnyObject {
    func didFetchRestaurantName(_ restaurantName: String)
    func didChangeMenuItems(_ menuItems: [MenuItem])
    func didChangeMenuSections(_ menuSections: [MenuSection])
    func didFailedOnLoadRestaurantData()
}

final class MenuViewModel: MenuViewModelProtocol {
    
    private let dataSource: MenuDataSourceProtocol
    private weak var delegate: MenuViewModelDelegate?
    private var enabledSectionIndex = 0
    private var menuSections = [MenuSection]()
    private var menuItems = [Int: [MenuItem]]()
    
    init(delegate: MenuViewModelDelegate, dataSource: MenuDataSourceProtocol) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func loadRestaurantData() {
        let request = RestaurantRequest(restaurantID: "4072702673999819")
        dataSource.fetchRestaurantData(with: request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleSuccessOnLoadRestaurantData(response)
            case .failure:
                self?.failedOnLoadMenuData()
            }
        }
    }
    
    private func handleSuccessOnLoadRestaurantData(_ response: RestaurantResponse) {
        updateRestaurantName(response.restaurantName)
        if let menu = validMenu(from: response) {
            updateRestaurantMenu(menu)
        } else {
            failedOnLoadMenuData()
        }
    }
    
    private func validMenu(from response: RestaurantResponse) -> Menu? {
        response.menus.first(where: { !$0.menuSections.isEmpty })
    }
    
    private func updateRestaurantName(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.didFetchRestaurantName(name)
        }
    }
    
    private func updateRestaurantMenu(_ menu: Menu) {
        extractMenuInformation(menu)
        DispatchQueue.main.async { [weak self] in
            self?.updateDelegateWithSectionChange()
        }
    }
    
    private func extractMenuInformation(_ menu: Menu) {
        menu.menuSections.enumerated().forEach { (index, element) in
            menuSections.append(MenuSection(response: element))
            menuItems[index] = element.menuItems.map(MenuItem.init)
        }
        enableFirstSection()
    }
    
    private func enableFirstSection() {
        guard !menuSections.isEmpty else { return }
        menuSections[0].isEnabled = true
    }
    
    private func failedOnLoadMenuData() {
        DispatchQueue.main.async { [weak self] in
            self?.delegate?.didFailedOnLoadRestaurantData()
        }
    }
    
    func selectMenuSection(atIndex index: Int) {
        guard menuSections.count > index else { return }
        disablePreviousSelectedSection()
        updateSelectedSection(atIndex: index)
        updateDelegateWithSectionChange()
    }
    
    private func disablePreviousSelectedSection() {
        toggleSection(atIndex: enabledSectionIndex)
    }
    
    private func updateSelectedSection(atIndex index: Int) {
        enabledSectionIndex = index
        toggleSection(atIndex: index)
    }
    
    private func toggleSection(atIndex index: Int) {
        menuSections[index].isEnabled.toggle()
    }
    
    private func updateDelegateWithSectionChange() {
        delegate?.didChangeMenuItems(menuItems[enabledSectionIndex]!)
        delegate?.didChangeMenuSections(menuSections)
    }
}
