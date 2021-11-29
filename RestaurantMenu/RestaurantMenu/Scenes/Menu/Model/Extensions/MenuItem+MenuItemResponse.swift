//
//  MenuItem+MenuItemResponse.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

extension MenuItem {
    
    init(response: MenuItemResponse) {
        self.init(title: response.name,
                  ingredients: response.description,
                  value: response.priceFormmated)
    }
}
