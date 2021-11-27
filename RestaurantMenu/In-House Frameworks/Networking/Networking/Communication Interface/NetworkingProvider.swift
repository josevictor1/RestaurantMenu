//
//  File.swift
//  Networking
//
//  Created by José Victor Pereira Costa on 31/03/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import Foundation

/// Closure to be executed when a request has completed.
public typealias ResponseCompletion = (_ result: Result<NetworkingResponse, NetworkingError>) -> Void

/// Networking interface that provides.
public final class NetworkingProvider {

    private let service: NetworkingServiceProtocol = NetworkingService()

    /// Creates an object of the type `NetworkigProvider`.
    public init() { }

    /// Performs a networking request executing a completion call back at the end of this.
    /// - Parameters:
    ///   - url: The `URL` addres to request the data.
    ///   - completion: The call back completion .
    @discardableResult
    public func requestData(fromURL url: String, completion: @escaping ResponseCompletion) -> URLSessionDataTask? {
        return service.sendRequest(with: url, completion: completion)
    }

    /// Performs a networking request executing a completion call back at the end of this.
    /// - Parameters:
    ///   - request: The request data.
    ///   - completion: The call back completion .
    @discardableResult
    public func performRequest(_ request: Request, completion: @escaping ResponseCompletion) -> URLSessionDataTask? {
        return service.send(request, completion: completion)
    }

    /// Performs a networking request executing a copletion call back at the end of this.
    /// The copletion has a generic `Decodable` parameter.
    /// - Parameters:
    ///   - request: The request data.
    ///   - completion: The call back completion with a `Decodable` parameter.
    @discardableResult
    public func performRequestWithDecodable<D: Decodable>(_ request: Request,
                                                          completion: @escaping (Result<D, NetworkingError>) -> Void) -> URLSessionDataTask? {
        return service.send(request) { result in
            switch result {
            case .success(let response):
                do {
                    debugPrint(response)
                    let result = try response.map(D.self)
                    completion(.success(result))
                } catch {
                    debugPrint(error)
                    completion(.failure(.decoding(error)))
                }
            case .failure(let error):
                debugPrint(error)
                completion(.failure(error))
            }
        }
    }
}
