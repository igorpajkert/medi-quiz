//
//  Buttons.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

// MARK: - Primary
struct ButtonPrimary: View {
    
    let title: LocalizedStringKey
    let action: () -> Void
    let width: CGFloat?
    
    init(
        title: LocalizedStringKey,
        action: @escaping () -> Void,
        width: CGFloat? = nil
    ) {
        self.title = title
        self.action = action
        self.width = width
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                Text(title)
                    .foregroundStyle(.accent.adaptedTextColor())
                    .padding()
            }
        }
        .frame(width: width)
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview("Primary") {
    ButtonPrimary(title: "Primary Button", action: {})
}

// MARK: - Secondary
struct ButtonSecondary: View {
    
    let title: LocalizedStringKey
    let action: () -> Void
    let width: CGFloat?
    
    init(
        title: LocalizedStringKey,
        action: @escaping () -> Void,
        width: CGFloat? = nil
    ) {
        self.title = title
        self.action = action
        self.width = width
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 2)
                Text(title)
                    .padding()
            }
        }
        .frame(width: width)
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview("Secondary") {
    ButtonSecondary(title: "Secondary Button", action: {})
}

// MARK: - Tertiary
struct ButtonTertiary: View {
    
    let title: LocalizedStringKey
    let action: () -> Void
    
    init(
        title: LocalizedStringKey,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(title, action: action)
    }
}

#Preview("Tertiary") {
    ButtonTertiary(title: "Tertiary Button", action: {})
}
