//
//  Publisher+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import Combine
import Foundation

public extension Publisher {
    func dispatchOnMainQueue() -> AnyPublisher<Output, Failure> {
        receive(on: DispatchQueue.customScheduler).eraseToAnyPublisher()
    }
}
