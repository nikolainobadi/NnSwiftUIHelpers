//
//  ConditionalEmptyListViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

struct ConditionalEmptyListViewModifier: ViewModifier {
    let listEmpty: Bool
    let title: String
    let message: String
    
    func body(content: Content) -> some View {
        if listEmpty {
            VStack {
                VStack(spacing: 15) {
                    Spacer()
                    Image(systemName: "tray")
                        .font(.largeTitle)
                    Text(title)
                        .font(.largeTitle)
                    Text(message)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            content
        }
    }
}

public extension View {
    func withEmptyListView(listEmpty: Bool, title: String = "No results found", message: String) -> some View {
        modifier(ConditionalEmptyListViewModifier(listEmpty: listEmpty, title: title, message: message))
    }
}
