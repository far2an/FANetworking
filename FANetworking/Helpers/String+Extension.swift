//
//  String+Extension.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import Foundation

extension String {
    
    func encodeUTF8() -> String? {
        if let _ = URL(string: self) {
            return self
        }
        
        var components = self.components(separatedBy: "/")
        guard let lastComponent = components.popLast(),
            let endcodedLastComponent = lastComponent.addingPercentEncoding(withAllowedCharacters: .urlQueryParametersAllowed) else {
                return nil
        }
        
        return (components + [endcodedLastComponent]).joined(separator: "/")
    }
    
    mutating func removeFirstLetterIfDash() {
        let initialCharacter = String(self[..<index(after: startIndex)])
        if initialCharacter == "/" {
            if count > 1 {
                remove(at: startIndex)
            } else {
                self = ""
            }
        }
    }
    
    mutating func removeLastLetterIfDash() {
        let initialCharacter: String
        if count > 1 {
            initialCharacter = String(self[index(endIndex, offsetBy: -1)...])
        } else {
            initialCharacter = String(self[..<endIndex])
        }
        
        if initialCharacter == "/" {
            if count > 1 {
                remove(at: index(endIndex, offsetBy: -1))
            } else {
                self = ""
            }
        }
    }
}
