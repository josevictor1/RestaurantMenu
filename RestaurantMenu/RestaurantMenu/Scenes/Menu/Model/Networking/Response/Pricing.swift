//
//  Pricing.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

// MARK: - Pricing
struct Pricing {
    let price: Double
    let currency: String
    let priceString: String
}

extension Pricing: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case price = "price"
        case currency = "currency"
        case priceString = "priceString"
    }
}
