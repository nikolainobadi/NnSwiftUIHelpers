//
//  DispatchQueue+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import Combine
import Foundation

public extension DispatchQueue {
    static var customScheduler: ImmediateWhenOnMain { ImmediateWhenOnMain( ) }
    
    struct ImmediateWhenOnMain: Scheduler {
        public typealias SchedulerOptions = DispatchQueue.SchedulerOptions
        public typealias SchedulerTimeType = DispatchQueue.SchedulerTimeType
        
        public var now: DispatchQueue.SchedulerTimeType { DispatchQueue.main.now }
        public var minimumTolerance: DispatchQueue.SchedulerTimeType.Stride { DispatchQueue.main.minimumTolerance }
        
        public func schedule(options: DispatchQueue.SchedulerOptions?, _ action: @escaping () -> Void) {
            guard Thread.isMainThread else {
                return DispatchQueue.main.schedule(options: options, action)
            }
            
            action()
        }
        
        public func schedule(after date: DispatchQueue.SchedulerTimeType, tolerance: DispatchQueue.SchedulerTimeType.Stride, options: DispatchQueue.SchedulerOptions?, _ action: @escaping () -> Void) {
            
            DispatchQueue.main.schedule(after: date, tolerance: tolerance, options: options, action)
        }
        
        public func schedule(after date: DispatchQueue.SchedulerTimeType, interval: DispatchQueue.SchedulerTimeType.Stride, tolerance: DispatchQueue.SchedulerTimeType.Stride, options: DispatchQueue.SchedulerOptions?, _ action: @escaping () -> Void) -> Cancellable {
            
            DispatchQueue.main.schedule(after: date, interval: interval, tolerance: tolerance, action)
        }
    }
}
