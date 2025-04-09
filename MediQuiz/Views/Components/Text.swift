//
//  Text.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct TextPrimary: View {
    let text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .font(.headline)
    }
}

#Preview("Primary") {
    TextPrimary(text: "Test")
}

struct TextSecondary: View {
    let text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .font(.body)
    }
}

#Preview("Secondary") {
    TextSecondary(text: "Test")
}

struct TextTertiary: View {
    let text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

#Preview("Tertiary") {
    TextTertiary(text: "Test")
}
