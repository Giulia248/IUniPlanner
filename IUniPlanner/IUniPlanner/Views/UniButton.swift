//
//  UniButton.swift
//  IUniPlanner
//
//  Created by giulia.floris on 01/10/2026.
//

import SwiftUI

struct UniButton: View {
    let title: String
    let action: () -> Void
    let icon: String
    
    @Binding var isEnabled: Bool
    
    var enabledColor: Color = Color.darkBlue
    var disabledColor: Color = Color.darkBlue.opacity(0.3)
    var textColor: Color = .black
    var disabledTextColor: Color = Color.darkBlue.opacity(0.3)
    
    var cornerRadius: CGFloat = 12
    var borderWidth: CGFloat = 1
    var height: CGFloat = 50
    var width: CGFloat = screenSize.width / 2
    
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 2){
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(
                        isEnabled
                        ? textColor
                        : disabledTextColor
                    )
                //                    .frame(maxWidth: .infinity)
                Image(systemName: icon)
                    .foregroundStyle(
                        isEnabled
                        ? textColor
                        : disabledTextColor
                    )
                //                    .frame(maxWidth: .infinity)
            }
            .padding(8)
            .padding(.horizontal, 30)
            .frame(width: width, height: height)
            
            .background(
                Color.clear
            )
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        isEnabled
                        ? enabledColor
                        : disabledColor,
                        lineWidth: borderWidth
                    )
            }
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            
            
            
        }
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.5)
    }
}
