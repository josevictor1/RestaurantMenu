//
//  RestaurantResponse+Mock.swift
//  RestaurantMenuTests
//
//  Created by Jose Victor Pereira Costa on 29/11/21.
//

import Foundation
@testable import RestaurantMenu

extension RestaurantResponse {
    
    static var restaurantResponseMock: RestaurantResponse {
        RestaurantResponse(restaurantName: "Test",
                           menus: [menuMock])
    }
    
    static var menuMock: Menu {
        Menu(menuName: "",
             menuSections: menuSectionsMock)
    }
    
    static var menuSectionsMock: [MenuSectionResponse] {
        (0...10).map { index in
            MenuSectionResponse(sectionName: "\(index)",
                                menuItems: menuItemsMock)
        }
    }
    
    static var menuItemsMock: [MenuItemResponse] {
        (0...10).map { index in
            MenuItemResponse(name: "\(index)",
                             description: "\(index)",
                             pricing: [Pricing(price: Double(index),
                                               currency: "USD",
                                               priceString: "$\(index)")],
                             price: Double(index))
        }
    }
    
}
