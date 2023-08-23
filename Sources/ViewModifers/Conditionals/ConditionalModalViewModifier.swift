//
//  ConditionalModalViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import SwiftUI

public struct ConditionalModalViewModifier<Modal: View>: ViewModifier {
    @Binding var isPresented: Bool
    
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let modal: Modal

    public func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }

                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        Button(action: { isPresented = false }) {
                            Image(systemName: "xmark")
                                .padding()
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                    
                    modal
                }
                .frame(width: width, height: height)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
            }
        }
    }
}

public extension View {
    func modal<Modal: View>(isPresented: Binding<Bool>, width: CGFloat = 300, height: CGFloat = 500, backgroundColor: Color = Color(uiColor: .systemBackground), cornerRadius: CGFloat = 20, @ViewBuilder modal: () -> Modal) -> some View {
        
        self.modifier(ConditionalModalViewModifier(isPresented: isPresented, width: width, height: height, backgroundColor: backgroundColor, cornerRadius: cornerRadius, modal: modal()))
    }
}



