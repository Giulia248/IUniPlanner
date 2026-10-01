//
//  RotatingImages.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

struct RotatingImages: View {
    var images: [String]
    @State private var rotation: Double = 0
    var body: some View {
        ForEach(Array(images.enumerated()), id: \.offset) { index, symbol in
            Image(systemName: symbol)
                .font(.system(size: 35))
                .foregroundStyle(Color.darkBlue)
                .symbolEffect(
                    .breathe.pulse.byLayer,
                    options: .repeat(
                        .periodic(
                            delay: Double(index) * 0.5
                        )
                    )
                )
                .offset(y: -30)
                .rotationEffect(
                    .degrees(Double(index) * 90)
                )
                .rotationEffect(
                    .degrees(rotation)
                )
                .onAppear {
                    withAnimation(
                        .linear(duration: 8)
                        .repeatForever(autoreverses: false)
                    ) {
                        rotation = 360
                    }
                }
        }
    }
}

#Preview {
    RotatingImages(images: [
        "book.pages",
        "book.and.wrench.fill",
        "apple.books.pages",
        "cpu"
    ])
}
