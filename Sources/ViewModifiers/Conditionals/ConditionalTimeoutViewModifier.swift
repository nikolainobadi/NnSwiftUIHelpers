//
//  ConditionalTimeoutViewModifier.swift
//  
//
//  Created by Nikolai Nobadi on 9/26/23.
//

import SwiftUI

struct ConditionalTimeoutViewModifier: ViewModifier {
    @Binding var isActive: Bool
    @Binding var timerFinished: Bool
    @State private var timer: Timer? = nil
    
    let timeLimit: TimeInterval
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeLimit, repeats: false) { _ in
            isActive = false
            timerFinished = true
        }
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isActive {
                    startTimer()
                }
            }
            .onDisappear {
                timer?.invalidate()
            }
            .onChange(of: isActive) { newValue in
                if newValue {
                    startTimer()
                } else {
                    timer?.invalidate()
                }
            }
    }
}

public extension View {
    func withTimer(timerFinished: Binding<Bool>, isActive: Binding<Bool>, timeLimit: TimeInterval = 5.0) -> some View {
        self.modifier(ConditionalTimeoutViewModifier(isActive: isActive, timerFinished: timerFinished, timeLimit: timeLimit))
    }
}

