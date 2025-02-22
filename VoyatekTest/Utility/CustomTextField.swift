//
//  CustomTextField.swift
//  VoyatekTest
//
//  Created by Bakare Waris on 22/02/2025.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    let height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.themeFont(fontStyle: .satoshiMedium, size: .size12))
                .foregroundColor(Color(hex: "#1D2433"))
            
            TextField(placeholder, text: $text)
                .padding()
                .frame(height: height)
                .background(Color.white)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
        }
    }
}
