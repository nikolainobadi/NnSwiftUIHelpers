//
//  Array+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import Foundation

extension Array where Element: Equatable {
    func removingDuplicates() -> [Element] {
        return reduce(into: [Element]()) { (result, value) in
            if !result.contains(value) {
                result.append(value)
            }
        }
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        return Array(Set(self))
    }
}

