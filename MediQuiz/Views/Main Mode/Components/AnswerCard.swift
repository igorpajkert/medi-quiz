//
//  AnswerCard.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/05/2025.
//

import SwiftUI

struct AnswerCard: View {
    
    @Environment(\.colorScheme) private var scheme
    
    let action: () -> Void
    let text: String
    var isSelected: Bool
    
    private var textColor: Color {
        scheme == .dark ? .white : .black
    }
    
    private var backgroundColor: Color {
        scheme == .dark ? .darkLavender : .lightLavender
    }
    
    private var fillColor: Color {
        isSelected ? .lavender : backgroundColor
    }
    
    private var borderColor: Color {
        isSelected ? .lavender : Color.accent
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .stroke(borderColor, lineWidth: 4)
                    .fill(fillColor)
                Text(text)
                    .font(.headline)
                    .foregroundStyle(textColor)
                    .padding()
            }
        }
    }
}

#Preview {
    AnswerCard(action: {}, text: "Test", isSelected: true)
}
