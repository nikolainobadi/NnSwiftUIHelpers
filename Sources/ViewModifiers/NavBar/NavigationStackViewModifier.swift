//
//  NavigationStackViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct NavigationStackViewModifier: ViewModifier {
    var path: Binding<NavigationPath>?
    
    let title: String?
    let tint: Color
    let backgroundColor: Color?

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
            .tint(tint)
            .toolbarBackground(backgroundColor == nil ? .automatic : .visible, for: .navigationBar)
            .toolbarBackground(backgroundColor == nil ? Color.clear : backgroundColor!, for: .navigationBar)
        } else {
            NavigationStack {
                if let title = title {
                    content
                        .navigationTitle(title)
                } else {
                    content
                }
            }
            .tint(tint)
            .toolbarBackground(backgroundColor == nil ? .automatic : .visible, for: .navigationBar)
            .toolbarBackground(backgroundColor == nil ? Color.clear : backgroundColor!, for: .navigationBar)
        }
    }
}

@available(iOS 16.0, *)
public extension View {
    func withNavStack(path: Binding<NavigationPath>? = nil, title: String? = nil, tint: Color = .blue, backgroundColor: Color? = nil) -> some View {
        self.modifier(NavigationStackViewModifier(path: path, title: title, tint: tint, backgroundColor: backgroundColor))
    }
}
