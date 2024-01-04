//
//  UIAlertController+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

#if canImport(UIKit)
import UIKit

public extension UIAlertController {
    func presentInMainThread(animated: Bool = true, completion: (() -> Void)? = nil) {
        if var topController = UIApplication.shared.getTopViewController() {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            DispatchQueue.main.async {
                topController.present(self, animated: animated, completion: completion)
            }
        }
    }
}
#endif
