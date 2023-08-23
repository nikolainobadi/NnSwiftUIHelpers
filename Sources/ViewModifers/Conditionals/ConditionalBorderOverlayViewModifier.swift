//
//  ConditionalBorderOverlayViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct ConditionalBorderOverlayViewModifier: ViewModifier {
    let color: Color
    let showOverlay: Bool
    let cornerRadius: CGFloat
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                VStack {
                    if showOverlay {
                        RoundedRectangle(cornerRadius: cornerRadius).stroke(color)
                    }
                }
            )
    }
}

public extension View {
    func withBorderOverlay(_ showOverlay: Bool, color: Color = .red, cornerRadius: CGFloat = 10) -> some View {
        modifier(ConditionalBorderOverlayViewModifier(color: color, showOverlay: showOverlay, cornerRadius: cornerRadius))
    }
}

