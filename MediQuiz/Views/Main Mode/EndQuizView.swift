//
//  EndQuizView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 17/05/2025.
//

import SwiftUI

struct EndQuizView: View {
    
    @Environment(\.mainMode) private var mainMode
    
    var onBack: () -> Void
    var onRestart: () -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            title
            Divider()
            textCorrectAnswers
            buttonBack
            buttonRestart
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 32)
                .fill(.ultraThickMaterial)
        }
        .padding()
        .shadow(radius: 4)
    }
    
    private var title: some View {
        Text("Quiz is over!")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    private var textCorrectAnswers: some View {
        HStack {
            Text("text.correctlyAnswered")
            Spacer()
            Text(mainMode.correctAnswersCount, format: .number)
        }
        .padding()
    }
    
    private var buttonBack: some View {
        ButtonPrimary(title: "text.back", action: onBack)
            .padding(.vertical)
    }
    
    private var buttonRestart: some View {
        ButtonTertiary(title: "text.restart", action: onRestart)
            .padding(.bottom)
    }
}

#Preview {
    EndQuizView(onBack: {}, onRestart: {})
}
