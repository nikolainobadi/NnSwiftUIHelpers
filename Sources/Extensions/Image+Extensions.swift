//
//  Image+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public extension Image {
    init(name: String, isSystem: Bool) {
        if isSystem {
            self.init(systemName: name)
        } else {
            self.init(name)
        }
    }
}
