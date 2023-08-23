//
//  String+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import Foundation

public extension String {
    func removingExtraWhitespace() -> String {
        return self.split(separator: " ")
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
