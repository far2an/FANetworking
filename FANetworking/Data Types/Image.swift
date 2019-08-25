//
//  Networking.swift
//  FANetworking
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import UIKit.UIImage
public typealias Image = UIImage

extension Image {
    static func find(named name: String, inBundle bundle: Bundle) -> Image {
        return UIImage(named: name, in: bundle, compatibleWith: nil)!
    }

    func jpgData() -> Data? {
        return self.jpegData(compressionQuality: 1)
    }
}
