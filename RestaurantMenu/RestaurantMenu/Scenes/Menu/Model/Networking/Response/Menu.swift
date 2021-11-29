//
//  Menu.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

// MARK: - Menu
struct Menu {
    let menuName: String
    let menuSections: [MenuSectionResponse]
}

extension Menu: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case menuName = "menu_name"
        case menuSections = "menu_sections"
    }
}
