//
//  MenuViewControllerMock.swift
//  RestaurantMenuTests
//
//  Created by Jose Victor Pereira Costa on 29/11/21.
//

import Foundation
@testable import RestaurantMenu

final class MenuViewControllerMock: MenuViewModelDelegate {
    
    var onRestaurantNameFetched: ((String) -> Void)?
    var onMenuItemsChange: (([MenuItem]) -> Void)?
    var onMenuSctionsChange: (([MenuSection]) -> Void)?
    var onFailedLoadRestaurantData: (() -> Void)?
    
    func didFetchRestaurantName(_ restaurantName: String) {
        onRestaurantNameFetched?(restaurantName)
    }
    
    func didChangeMenuItems(_ menuItems: [MenuItem]) {
        onMenuItemsChange?(menuItems)
    }
    
    func didChangeMenuSections(_ menuSections: [MenuSection]) {
        onMenuSctionsChange?(menuSections)
    }
    
    func didFailedOnLoadRestaurantData() {
        onFailedLoadRestaurantData?()
    }
}
