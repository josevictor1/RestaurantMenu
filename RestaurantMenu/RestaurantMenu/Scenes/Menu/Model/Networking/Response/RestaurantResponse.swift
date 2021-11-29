//
//  RestaurantResponse.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Foundation

// MARK: - Activity
struct Activity: Decodable {
    let result: RestaurantResponse
}

// MARK: - Result
struct RestaurantResponse {
    let restaurantName: String
    let menus: [Menu]
}

extension RestaurantResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case restaurantName = "restaurant_name"
        case menus
    }
}
