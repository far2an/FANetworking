//
//  Networking+Image.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

public extension Networking {
    
    /// Retrieves an image from the cache or from the filesystem.
    ///
    /// - Parameters:
    ///   - path: The path where the image is located.
    ///   - cacheName: The cache name used to identify the downloaded image, by default the path is used.
    /// - Returns: The cached image.
    func imageFromCache(_ path: String, cacheName: String? = nil) -> Image? {
        let object = objectFromCache(for: path, cacheName: cacheName, cachingLevel: .memoryAndFile, responseType: .image)
        
        return object as? Image
    }
    
    /// Downloads an image using the specified path.
    ///
    /// - Parameters:
    ///   - path: The path where the image is located.
    ///   - cacheName: The cache name used to identify the downloaded image, by default the path is used.
    ///   - cachingLevel: Enum to control the caching level: .memory, .memoryAndFile, .none
    ///   - completion: The result of the operation, it's an enum with two cases: success and failure.
    /// - Returns: The request identifier.
    @discardableResult
    func downloadImage(_ path: String, cacheName: String? = nil, cachingLevel: CachingLevel = .memoryAndFile, completion: @escaping (_ result: ImageResult) -> Void) -> String {
        return handleImageRequest(.get, path: path, cacheName: cacheName, cachingLevel: cachingLevel, responseType: .image, completion: completion)
    }
    
    /// Cancels the image download request for the specified path. This causes the request to complete with error code URLError.cancelled.
    ///
    /// - Parameter path: The path for the cancelled image download request.
    func cancelImageDownload(_ path: String) {
        let url = try! composedURL(with: path)
        cancelRequest(.data, requestType: .get, url: url)
    }
    
    /// Downloads data from a URL, caching the result.
    ///
    /// - Parameters:
    ///   - path: The path used to download the resource.
    ///   - cacheName: The cache name used to identify the downloaded data, by default the path is used.
    ///   - cachingLevel: Enum to control the caching level: .memory, .memoryAndFile, .none
    ///   - completion: A closure that gets called when the download request is completed, it contains  a `data` object and an `NSError`.
    @discardableResult
    func downloadData(_ path: String, cacheName: String? = nil, cachingLevel: CachingLevel = .memoryAndFile, completion: @escaping (_ result: DataResult) -> Void) -> String {
        return handleDataRequest(.get, path: path, cacheName: cacheName, cachingLevel: cachingLevel, responseType: .data, completion: completion)
    }
    
    /// Retrieves data from the cache or from the filesystem.
    ///
    /// - Parameters:
    ///   - path: The path where the image is located.
    ///   - cacheName: The cache name used to identify the downloaded data, by default the path is used.
    /// - Returns: The cached data.
    func dataFromCache(_ path: String, cacheName: String? = nil) -> Data? {
        let object = objectFromCache(for: path, cacheName: cacheName, cachingLevel: .memoryAndFile, responseType: .data)
        
        return object as? Data
    }
}
