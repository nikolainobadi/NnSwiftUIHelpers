//
//  NavigationStackViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
public struct NavigationStackViewModifier<Header: View>: ViewModifier {
    @Binding var path: NavigationPath
    
    public enum NavTitle {
        case text(String)
        case header(Header)
    }

    let title: NavTitle

    public func body(content: Content) -> some View {
        NavigationStack(path: $path) {
            switch title {
            case .text(let string):
                content
                    .navigationTitle(string)
            case .header(let header):
                content
                    .withNavTitle(header)
            }
        }
    }
}

@available(iOS 16.0, *)
public extension View {
    func withNavStack<Header: View>(path: Binding<NavigationPath> = .constant(NavigationPath()), title: NavigationStackViewModifier<Header>.NavTitle) -> some View {
        self.modifier(NavigationStackViewModifier(path: path, title: title))
    }
}
