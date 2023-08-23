//
//  Either.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import Foundation

enum Either<L, R> {
    case left(L)
    case right(R)
}
