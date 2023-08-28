//
//  ItemModelViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct ItemModelViewModifier<Item: Identifiable & Hashable, Modal: View>: ViewModifier {
    @Binding var item: Item?
    
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
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
                .frame(width: width, height: height)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
            }
        }
    }
}

public extension View {
    func modal<Item: Identifiable & Hashable, Modal: View>(item: Binding<Item?>, width: CGFloat = 300, height: CGFloat = 500, backgroundColor: Color = Color(uiColor: .systemBackground), cornerRadius: CGFloat = 20, @ViewBuilder modal: @escaping (Item) -> Modal) -> some View {
        
        self.modifier(ItemModelViewModifier(item: item, width: width, height: height, backgroundColor: backgroundColor, cornerRadius: cornerRadius, modal: modal))
    }
}
