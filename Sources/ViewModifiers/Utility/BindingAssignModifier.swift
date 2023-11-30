//
//  BindingAssignModifier.swift
//  
//
//  Created by Nikolai Nobadi on 11/29/23.
//

import SwiftUI

struct BindingAssignModifier<Value>: ViewModifier where Value: Equatable {
    var inputBinding: Binding<Value>
    var outputBinding: Binding<Value>

    func body(content: Content) -> some View {
        content
            .onAppear {
                outputBinding.wrappedValue = inputBinding.wrappedValue
            }
            .onChange(of: inputBinding.wrappedValue) { newValue in
                outputBinding.wrappedValue = newValue
            }
    }
}

public extension View {
    func bindValue<Value>(from inputBinding: Binding<Value>, to outputBinding: Binding<Value>) -> some View where Value: Equatable {
        self.modifier(BindingAssignModifier(inputBinding: inputBinding, outputBinding: outputBinding))
    }
}
