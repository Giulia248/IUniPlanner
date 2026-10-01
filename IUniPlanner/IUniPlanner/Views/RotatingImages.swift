//
//  RotatingImages.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

//struct RotatingImages: View {
//    var images: [String]
//    @State private var rotation: Double = 0
//    var body: some View {
//        ForEach(Array(images.enumerated()), id: \.offset) { index, symbol in
//            Image(systemName: symbol)
//                .font(.system(size: 35))
//                .foregroundStyle(Color.darkBlue)
//                .symbolEffect(
//                    .breathe.pulse.byLayer,
//                    options: .repeat(
//                        .periodic(
//                            delay: Double(index) * 0.5
//                        )
//                    )
//                )
//                .offset(y: -80)
//                .rotationEffect(
//                    .degrees(Double(index) * 90)
//                )
//                .rotationEffect(
//                    .degrees(rotation)
//                )
//                .onAppear {
//                    withAnimation(
//                        .linear(duration: 8)
//                        .repeatForever(autoreverses: false)
//                    ) {
//                        rotation = 360
//                    }
//                }
//        }
//    }
//}

struct RotatingImages: View {

    
    init(images: [String]) {
        self.images = images
        self.positions = Array(repeating: CGPoint.zero, count: images.count)
    }
    
    // MARK: - Customizable area

    var areaWidth: CGFloat = screenSize.width / 2
    var areaHeight: CGFloat = screenSize.height / 4

    // MARK: - Customizable appearance

    var iconSize: CGFloat = 35
    var iconColor: Color = Color.darkBlue

    // MARK: - Symbols

    let images: [String]

    // Each icon gets its own position
    @State private var positions: [CGPoint]
    

    var body: some View {
        ZStack {
            ForEach(Array(images.enumerated()), id: \.offset) { index, symbol in

                Image(systemName: symbol)
                    .font(.system(size: iconSize))
                    .foregroundStyle(iconColor)
                    .symbolEffect(
                        .breathe.pulse.byLayer,
                        options: .repeat(
                            .periodic(
                                delay: Double(index) * 0.7
                            )
                        )
                    )
                    .position(positions[index])
            }
        }
        .frame(width: areaWidth, height: areaHeight)
        .clipped()
        .onAppear {
            startAnimations()
        }
    }

    // MARK: - Animation

    private func startAnimations() {

        // Initial positions
        for index in positions.indices {
            positions[index] = randomPosition()
        }

        // Start each icon independently
        for index in images.indices {

            Task {
                // Different initial delay for every icon
                try? await Task.sleep(
                    for: .seconds(Double(index) * 0.6)
                )

                while !Task.isCancelled {

                    let newPosition = randomPosition()

                    withAnimation(
                        .spring(
                            response: 0.7,
                            dampingFraction: 0.65
                        )
                    ) {
                        positions[index] = newPosition
                    }

                    // Different waiting time for every icon
                    let delay =
                        1.0 +
                        Double(index) * 0.35 +
                        Double.random(in: 0...0.8)

                    try? await Task.sleep(
                        for: .seconds(delay)
                    )
                }
            }
        }
    }

    // MARK: - Random position

    private func randomPosition() -> CGPoint {

        let horizontalPadding = iconSize / 2
        let verticalPadding = iconSize / 2

        let x = CGFloat.random(
            in: horizontalPadding...(areaWidth - horizontalPadding)
        )

        let y = CGFloat.random(
            in: verticalPadding...(areaHeight - verticalPadding)
        )

        return CGPoint(x: x, y: y)
    }
}




#Preview {
    RotatingImages(images: [
        "book.pages",
        "book.and.wrench.fill",
        "apple.books.pages",
        "apple.books.pages",
        "cpu"
    ])
}
