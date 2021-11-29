//
//  MenuDataSourceMock.swift
//  RestaurantMenuTests
//
//  Created by Jose Victor Pereira Costa on 29/11/21.
//

import Networking
@testable import RestaurantMenu

final class MenuDataSourceMock: MenuDataSourceProtocol {
    
    var error: NetworkingError?
    
    func fetchRestaurantData(with request: RestaurantRequest, completion: @escaping FetchRestaurantDataCompletion) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(.restaurantResponseMock))
        }
    }
}
