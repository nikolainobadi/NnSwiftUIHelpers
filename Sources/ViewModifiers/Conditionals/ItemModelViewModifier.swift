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

                modal(item)
                    .frame(width: width, height: height)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
                    .overlay(alignment: .topTrailing) {
                        Button(action: { self.item = nil }) {
                            Image(systemName: "xmark")
                                .padding()
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
            }
        }
    }
}

public extension View {
    func modal<Item: Identifiable & Hashable, Modal: View>(item: Binding<Item?>, width: CGFloat? = nil, height: CGFloat? = nil, backgroundColor: Color = Color(uiColor: .systemBackground), cornerRadius: CGFloat = 20, @ViewBuilder modal: @escaping (Item) -> Modal) -> some View {
        
        self.modifier(ItemModelViewModifier(item: item, width: width ?? getWidthPercent(90), height: height ?? getHeightPercent(50), backgroundColor: backgroundColor, cornerRadius: cornerRadius, modal: modal))
    }
}
