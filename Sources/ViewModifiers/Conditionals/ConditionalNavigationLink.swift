//
//  ConditionalNavigationLink.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct ConditionalNavigationLink<D: Hashable>: ViewModifier {
    let data: D
    let isActive: Bool
    
    func body(content: Content) -> some View {
        if isActive {
            NavigationLink(value: data) {
                content
            }
        } else {
            content
        }
    }
}

@available(iOS 16.0, *)
public extension View {
    func asNavLink<D: Hashable>(_ data: D, isActive: Bool = true) -> some View {
        modifier(ConditionalNavigationLink(data: data, isActive: isActive))
    }
}
