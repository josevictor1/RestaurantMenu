//
//  MenuItem.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

struct MenuItem {
    let uuid = UUID()
    let title: String
    let ingredients: String
    let value: String
}

extension MenuItem: Hashable { }
