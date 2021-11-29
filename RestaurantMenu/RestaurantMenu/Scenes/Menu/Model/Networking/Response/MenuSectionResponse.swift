//
//  MenuSectionResponse.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

// MARK: - MenuSection
struct MenuSectionResponse {
    let sectionName: String
    let menuItems: [MenuItemResponse]
}

extension MenuSectionResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case sectionName = "section_name"
        case menuItems = "menu_items"
    }
}
