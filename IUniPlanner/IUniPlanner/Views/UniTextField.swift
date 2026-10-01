//
//  UniTextField.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

struct UniTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var textColor: Color = Color.black
    var placeholderColor: Color = Color.black.opacity(0.8)
    var lineColor: Color = Color.darkBlue
    var focusedLineColor: Color = Color.simpleBlue
    
    var font: Font = .body
    var lineHeight: CGFloat = 1
    var spacing: CGFloat = 6
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(placeholderColor)
            )
            .font(font)
            .foregroundStyle(textColor)
            .focused($isFocused)
            
            Rectangle()
                .fill(isFocused ? focusedLineColor : lineColor)
                .frame(height: lineHeight)
                .animation(.easeInOut(duration: 0.15), value: isFocused)
        }
    }
}

#Preview {
    @Previewable @State var text = "etce"
    UniTextField(placeholder: "placeholder", text: $text)
}
