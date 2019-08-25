//
//  Data+Extension.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

extension Data {
    
    /// Serializes Data into a JSON object.
    ///
    /// - Returns: A JSON object, it can be either a Dictionary or an Array.
    /// - Throws: An error if it couldn't serialize the data into json.
    public func toJSON() throws -> Any? {
        var json: Any?
        do {
            json = try JSONSerialization.jsonObject(with: self, options: [])
        } catch {
            throw ParsingError.failed
        }
        
        return json
    }
}
