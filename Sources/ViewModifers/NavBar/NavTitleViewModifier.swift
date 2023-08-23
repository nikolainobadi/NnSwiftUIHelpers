//
//  NavTitleViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

struct NavTitleViewModifier<TitleView: View>: ViewModifier {
    let titleView: TitleView

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) { titleView }
            }
    }
}

extension View {
    func withNavTitle<TitleView: View>(_ titleView: TitleView) -> some View {
        self.modifier(NavTitleViewModifier(titleView: titleView))
    }
}
