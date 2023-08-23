//
//  ItemModelViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct ItemModelViewModifier<Item: Identifiable & Hashable, Modal: View>: ViewModifier {
    @Binding var item: Item?
    let modal: (Item) -> Modal

    public func body(content: Content) -> some View {
        ZStack {
            content

            if let item = item {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        self.item = nil
                    }

                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        Button(action: { self.item = nil }) {
                            Image(systemName: "xmark")
                                .padding()
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }

                    modal(item)
                }
                .background(Color(uiColor: .systemBackground))
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
    }
}

public extension View {
    func modal<Item: Identifiable & Hashable, Modal: View>(item: Binding<Item?>, @ViewBuilder modal: @escaping (Item) -> Modal) -> some View {
        self.modifier(ItemModelViewModifier(item: item, modal: modal))
    }
}
