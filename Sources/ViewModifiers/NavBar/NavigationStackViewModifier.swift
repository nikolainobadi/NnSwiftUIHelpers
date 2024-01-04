//
//  NavigationStackViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
@available(macOS 13.0, *)
struct NavigationStackViewModifier: ViewModifier {
    var path: Binding<NavigationPath>?
    
    let title: String?

    func body(content: Content) -> some View {
        if let pathBinding = path {
            NavigationStack(path: pathBinding) {
                if let title = title {
                    content
                        .navigationTitle(title)
                } else {
                    content
                }
            }
        } else {
            NavigationStack {
                if let title = title {
                    content
                        .navigationTitle(title)
                } else {
                    content
                }
            }
        }
    }
}

@available(iOS 16.0, *)
@available(macOS 13.0, *)
public extension View {
    func withNavStack(path: Binding<NavigationPath>? = nil, title: String? = nil) -> some View {
        self.modifier(NavigationStackViewModifier(path: path, title: title))
    }
}
