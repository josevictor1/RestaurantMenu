//
//  MenuDataSource.swift
//  RestaurantMenu
//
//  Created by Jose Victor Pereira Costa on 28/11/21.
//

import Networking

typealias FetchRestaurantDataCompletion = ((Result<RestaurantResponse, NetworkingError>) -> Void)

protocol MenuDataSourceProtocol {
    func fetchRestaurantData(with request: RestaurantRequest, completion: @escaping FetchRestaurantDataCompletion)
}

final class MenuDataSource: MenuDataSourceProtocol {
    
    private let networkingProvider: NetworkingProvider
    
    init(networkingProvider: NetworkingProvider = NetworkingProvider()) {
        self.networkingProvider = networkingProvider
    }
    
    func fetchRestaurantData(with request: RestaurantRequest, completion: @escaping FetchRestaurantDataCompletion) {
        networkingProvider.performRequestWithDecodable(request) { (result: Result<Activity, NetworkingError>) in
            switch result {
            case .success(let response):
                completion(.success(response.result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
