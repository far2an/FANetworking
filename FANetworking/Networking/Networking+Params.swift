//
//  Networking+Params.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

extension Networking {
    
    enum RequestType: String {
        case get = "GET", post = "POST", put = "PUT", patch = "PATCH", delete = "DELETE"
    }
    
    enum SessionTaskType: String {
        case data, upload, download
    }
    
    public enum ParameterType {
        case none, json, formURLEncoded, multipartFormData, custom(String)
        
        func contentType(_ boundary: String) -> String? {
            switch self {
            case .none:
                return nil
            case .json:
                return "application/json"
            case .formURLEncoded:
                return "application/x-www-form-urlencoded"
            case .multipartFormData:
                return "multipart/form-data; boundary=\(boundary)"
            case let .custom(value):
                return value
            }
        }
    }
    
    enum ResponseType {
        case json
        case data
        case image
        
        var accept: String? {
            switch self {
            case .json:
                return "application/json"
            default:
                return nil
            }
        }
    }
    
    /// Categorizes a status code.
    ///
    /// - informational: This class of status code indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.
    /// - successful: This class of status code indicates that the client's request was successfully received, understood, and accepted.
    /// - redirection: This class of status code indicates that further action needs to be taken by the user agent in order to fulfill the request.
    /// - clientError: The 4xx class of status code is intended for cases in which the client seems to have erred.
    /// - serverError: Response status codes beginning with the digit "5" indicate cases in which the server is aware that it has erred or is incapable of performing the request.
    /// - cancelled: When a request gets cancelled
    /// - unknown: This response status code could be used by Foundation for other types of states.
    public enum StatusCodeType {
        case informational, successful, redirection, clientError, serverError, cancelled, unknown
    }
    
}
