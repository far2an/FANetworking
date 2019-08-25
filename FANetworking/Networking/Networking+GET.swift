//
//  Networking+HTTPRequests.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

public extension Networking {
    
    /// GET request to the specified path.
    ///
    /// - Parameters:
    ///   - path: The path for the GET request.
    ///   - parameters: The parameters to be used, they will be serialized using Percent-encoding and appended to the URL.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func get(_ path: String, parameters: Any? = nil, cachingLevel: CachingLevel = .none, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        let parameterType: ParameterType = parameters != nil ? .formURLEncoded : .none
        
        return handleJSONRequest(.get, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: cachingLevel, completion: completion)
    }
    
    /// Cancels the GET request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled GET request
    func cancelGET(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .get, url: url)
    }
}
