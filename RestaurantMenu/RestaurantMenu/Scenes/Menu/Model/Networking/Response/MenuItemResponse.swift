//
//  MenuItemResponse.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

// MARK: - MenuItem
struct MenuItemResponse {
    let name: String
    let description: String
    let pricing: [Pricing]
    let price: Double
}

extension MenuItemResponse {
    
    var priceFormmated: String {
        if pricing.isEmpty {
            return price.toDolarCurrencyFormat()
        } else {
            return pricing.first!.priceString
        }
    }
}

extension MenuItemResponse: Decodable { }
