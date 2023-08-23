//
//  ConditionalDisplayViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct ConditionalDisplayViewModifier: ViewModifier {
    let conditional: Bool

    public func body(content: Content) -> some View {
        if conditional {
            content
        }
    }
}

public extension View {
    func onlyShow(when conditional: Bool) -> some View {
        modifier(ConditionalDisplayViewModifier(conditional: conditional))
    }
}
