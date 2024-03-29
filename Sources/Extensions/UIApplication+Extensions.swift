//
//  UIApplication+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

#if canImport(UIKit)
import UIKit

public extension UIApplication {
    func getTopViewController() -> UIViewController? {
        return connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first?.rootViewController
    }
}
#endif
