//
//  Int+Extension.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Categorizes a status code.
    ///
    /// - Returns: The NetworkingStatusCodeType of the status code.
    var statusCodeType: Networking.StatusCodeType {
        switch self {
        case URLError.cancelled.rawValue:
            return .cancelled
        case 100 ..< 200:
            return .informational
        case 200 ..< 300:
            return .successful
        case 300 ..< 400:
            return .redirection
        case 400 ..< 500:
            return .clientError
        case 500 ..< 600:
            return .serverError
        default:
            return .unknown
        }
    }
}
