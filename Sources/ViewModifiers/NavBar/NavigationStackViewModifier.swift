//
//  NavigationStackViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
public struct NavigationStackViewModifier: ViewModifier {
    @Binding var path: NavigationPath
    
    let title: String?

    public func body(content: Content) -> some View {
        NavigationStack(path: $path) {
            if let title = title {
                content
                    .navigationTitle(title)
            } else {
                content
            }
        }
    }
}

@available(iOS 16.0, *)
public extension View {
    func withNavStack(path: Binding<NavigationPath> = .constant(NavigationPath()), title: String? = nil) -> some View {
        self.modifier(NavigationStackViewModifier(path: path, title: title))
    }
}
