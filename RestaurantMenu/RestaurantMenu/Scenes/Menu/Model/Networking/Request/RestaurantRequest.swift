//
//  RestaurantRequest.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Networking

struct RestaurantRequest: Request {
    let restaurantID: String
    var method: HTTPMethod { .get }
    var scheme: URIScheme { .https }
    var host: String { "api.documenu.com" }
    var path: String { "/v2/restaurant/\(restaurantID)" }
    var body: Encodable?
    var queryString: QueryString?
    var header: Header? {
        ["X-API-KEY": "3ab5f321227ecea62d874335836de228"]
    }
}
