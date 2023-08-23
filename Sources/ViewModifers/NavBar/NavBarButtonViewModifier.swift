//
//  NavBarButtonViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct NavBarButtonViewModifier: ViewModifier {
    let placement: ToolbarItemPlacement
    let buttonContent: NavBarButtonContent
    let action: () -> Void
    
    public enum NavBarButtonContent {
        case image(String)
        case text(String)
    }
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: placement) {
                    Button(action: action) {
                        switch buttonContent {
                        case .image(let imageName):
                            Image(systemName: imageName)
                        case .text(let buttonText):
                            Text(buttonText)
                        }
                    }
                }
            }
    }
}

public extension View {
    func withNavBarButton(placement: ToolbarItemPlacement = .navigationBarTrailing, buttonContent: NavBarButtonViewModifier.NavBarButtonContent, action: @escaping () -> Void) -> some View {
        modifier(NavBarButtonViewModifier(placement: placement, buttonContent: buttonContent, action: action))
    }
}
