//
//  Networking+POST.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

public extension Networking {

    /// POST request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the POST request.
    ///   - parameterType: The parameters type to be used, by default is JSON.
    ///   - parameters: The parameters to be used, they will be serialized using the ParameterType, by default this is JSON.
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func post(_ path: String, parameterType: ParameterType = .json, parameters: Any? = nil, completion: @escaping (_ result: JSONResult) -> Void) -> String {
        return handleJSONRequest(.post, path: path, cacheName: nil, parameterType: parameterType, parameters: parameters, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    /// POST request to the specified path, using the provided parameters.
    ///
    /// - Parameters:
    ///   - path: The path for the POST request.
    ///   - parameters: The parameters to be used, they will be serialized using the ParameterType, by default this is JSON.
    ///   - parts: The list of form data parts that will be sent in the request.
    ///   - completion: A closure that gets called when the POST request is completed, it contains a `JSON` object and an `NSError`.
    /// - Returns: The request identifier.
    @discardableResult
    func post(_ path: String, parameters: Any? = nil, parts: [FormDataPart], completion: @escaping (_ result: JSONResult) -> Void) -> String {
        return handleJSONRequest(.post, path: path, cacheName: nil, parameterType: .multipartFormData, parameters: parameters, parts: parts, responseType: .json, cachingLevel: .none, completion: completion)
    }
    
    
    /// Cancels the POST request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled POST request.
    func cancelPOST(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .post, url: url)
    }
    
}
