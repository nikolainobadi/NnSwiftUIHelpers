//
//  NavTitleViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct NavTitleViewModifier<TitleView: View>: ViewModifier {
    let titleView: TitleView

    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) { titleView }
            }
    }
}

public extension View {
    func withNavTitle<TitleView: View>(_ titleView: TitleView) -> some View {
        self.modifier(NavTitleViewModifier(titleView: titleView))
    }
}
