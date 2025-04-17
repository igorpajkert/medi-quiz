//
//  TextFields.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

// MARK: - TextField
struct TextFieldPrimary: View {
    
    var label: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        TextField(label, text: $text)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 2)
            }
    }
}

#Preview("Text Field Primary") {
    TextFieldPrimary(label: "Test", text: .constant(""))
}

// MARK: - SecureField
struct SecureFieldPrimary: View {
    
    var label: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        SecureField(label, text: $text)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 2)
            }
    }
}

#Preview("Secure Field Primary") {
    SecureFieldPrimary(label: "Test", text: .constant(""))
}
