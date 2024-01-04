//
//  ConditionalModalViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

#if canImport(UIKit)
import SwiftUI

@available(iOS 15.0, *)
struct ConditionalModalViewModifier<Modal: View>: ViewModifier {
    @Binding var isPresented: Bool
    
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let modal: Modal

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }

                modal
                    .frame(width: width, height: height)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
                    .overlay(alignment: .topTrailing) {
                        Button(action: { isPresented = false }) {
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


@available(iOS 15.0, *)
public extension View {
    func modal<Modal: View>(isPresented: Binding<Bool>, width: CGFloat? = nil, height: CGFloat? = nil, backgroundColor: Color = Color(uiColor: .systemBackground), cornerRadius: CGFloat = 20, @ViewBuilder modal: () -> Modal) -> some View {
        
        self.modifier(ConditionalModalViewModifier(isPresented: isPresented, width: width ?? getWidthPercent(90), height: height ?? getHeightPercent(50), backgroundColor: backgroundColor, cornerRadius: cornerRadius, modal: modal()))
    }
}
#endif
