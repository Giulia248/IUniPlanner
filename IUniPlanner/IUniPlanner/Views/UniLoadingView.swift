//
//  UniLoadingView.swift
//  IUniPlanner
//
//  Created by giulia.floris on 02/10/2026.
//

import SwiftUI

private struct LoadingModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    SpinningArc()
                }
            }
    }
}


extension View {
    func loading(_ isLoading: Bool) -> some View {
        modifier(LoadingModifier(isLoading: isLoading))
    }
}

struct SpinningArc: View {
    @State private var rotate = false
    
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(
                Color.darkBlue,
                style: StrokeStyle(
                    lineWidth: 4,
                    lineCap: .round
                )
            )
            .frame(width: 40, height: 40)
            .rotationEffect(.degrees(rotate ? 360 : 0))
            .animation(
                .linear(duration: 1)
                .repeatForever(autoreverses: false),
                value: rotate
            )
            .onAppear {
                rotate = true
            }
    }
}
