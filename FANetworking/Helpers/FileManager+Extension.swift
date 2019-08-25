//
//  FileManager+Extension.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation


public extension FileManager {
    /// Returns a JSON object from a file.
    ///
    /// - Parameters:
    ///   - fileName: The name of the file, the expected extension is `.json`.
    ///   - bundle: The Bundle where the file is located, by default is the main bundle.
    /// - Returns: A JSON object, it can be either a Dictionary or an Array.
    /// - Throws: An error if it wasn't able to process the file.
    static func json(from fileName: String, bundle: Bundle = Bundle.main) throws -> Any? {
        var json: Any?
        
        guard let url = URL(string: fileName), let filePath = bundle.path(forResource: url.deletingPathExtension().absoluteString, ofType: url.pathExtension) else { throw ParsingError.notFound }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else { throw ParsingError.failed }
        
        json = try data.toJSON()
        
        return json
    }
}

extension FileManager {
    
    public func exists(at url: URL) -> Bool {
        let path = url.path
        
        return fileExists(atPath: path)
    }
    
    public func remove(at url: URL) throws {
        let path = url.path
        guard FileManager.default.isDeletableFile(atPath: url.path) else { return }
        
        try FileManager.default.removeItem(atPath: path)
    }
}


