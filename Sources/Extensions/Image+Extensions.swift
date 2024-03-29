//
//  Image+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public extension Image {
    enum ImageType {
        case system(String)
        case media(String, Bundle?)
    }
    
    init(imageType: ImageType) {
        switch imageType {
        case .system(let imageName):
            self.init(systemName: imageName)
        case .media(let imageName, let bundle):
            self.init(imageName, bundle: bundle)
        }
    }
}
