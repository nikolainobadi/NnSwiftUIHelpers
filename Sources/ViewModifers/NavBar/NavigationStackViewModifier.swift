//
//  NavigationStackViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct NavigationStackViewModifier<Header: View>: ViewModifier {
    @Binding var path: NavigationPath

    let title: Either<String, Header>

    func body(content: Content) -> some View {
        NavigationStack(path: $path) {
            switch title {
            case .left(let string):
                content
                    .navigationTitle(string)
            case .right(let header):
                content
                    .withNavTitle(header)
            }
        }
    }
}

@available(iOS 16.0, *)
extension View {
    func withNavStack<Header: View>(path: Binding<NavigationPath> = .constant(NavigationPath()), title: Either<String, Header>) -> some View {
        modifier(NavigationStackViewModifier(path: path, title: title))
    }
}

