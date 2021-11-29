//
//  MenuSection+MenuSectionResponse.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

extension MenuSection {
    
    init(response: MenuSectionResponse) {
        self.init(title: response.sectionName,
                  isEnabled: false)
    }
}
