//
//  QuizView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 19/11/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var category: QuestionsCategory
    
    @State private var currentQuestion: Int = 0
    @State private var isAnswered: Bool = false
    @State private var selectedAnswer: UUID = UUID()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            QuizHeaderView(
                question: category.questions[currentQuestion],
                currentQuestion: currentQuestion,
                totalQuestions: category.questionsCount)
            ForEach(category.questions[currentQuestion].answers) { answer in
                Button(
                    action: {
                        guard !isAnswered else { return }
                        selectedAnswer = answer.id
                        isAnswered = true
                    },
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 2)
                                .aspectRatio(3 / 1, contentMode: .fit)
                                .foregroundColor(answerColor(for: answer))
                            Text(answer.text)
                                .font(.headline)
                                .foregroundStyle(
                                    colorScheme == .dark ? .white : .black)
                        }
                    })
                .disabled(isAnswered)
            }
            Button("Next", action: nextQuestion)
                .disabled(!isAnswered)
                .padding()
        }
        .navigationTitle(category.title)
        .padding()
    }
    
    private func answerColor(for answer: Question.Answer) -> Color {
        guard isAnswered else { return .main }
        guard selectedAnswer == answer.id else { return .main }
        return answer.isCorrect ? .green : .red
    }
    
    private func nextQuestion() {
        currentQuestion += 1
        isAnswered = false
    }
}

#Preview {
    QuizView(category: .constant(QuestionsCategory.sampleData[0]))
}
