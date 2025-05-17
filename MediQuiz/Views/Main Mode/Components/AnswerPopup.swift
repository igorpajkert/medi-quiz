//
//  AnswerPopup.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 15/05/2025.
//

import SwiftUI

struct AnswerPopup: View {
    
    let correctAnswers: [Answer]
    let isCorrectlyAnswered: Bool
    
    private var feedbackText: LocalizedStringKey {
        isCorrectlyAnswered ? "text.feedback.correct" : "text.feedback.incorrect"
    }
    
    private var feedbackIcon: String {
        isCorrectlyAnswered ? "checkmark.circle" : "xmark.circle"
    }
    
    private var feedbackColor: Color {
        isCorrectlyAnswered ? .green : .red
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            labelFeedback
            Divider()
            textCorrectAnswers
            listCorrectAnswers
        }
        .padding()
    }
    
    private var labelFeedback: some View {
        Label(feedbackText, systemImage: feedbackIcon)
            .font(.title)
            .foregroundStyle(feedbackColor)
    }
    
    private var textCorrectAnswers: some View {
        Text("text.correctAsnwers")
            .foregroundColor(.secondary)
    }
    
    private var listCorrectAnswers: some View {
        ScrollView(.horizontal) {
            ForEach(correctAnswers) { answer in
                Text(answer.text)
                    .font(.headline)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.green, lineWidth: 3)
                    }
                    .padding()
            }
        }
    }
}

#Preview {
    AnswerPopup(correctAnswers: [.init(text: "Test", isCorrect: true)], isCorrectlyAnswered: true)
}
