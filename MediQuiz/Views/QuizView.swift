//
//  QuizView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 19/11/2024.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var category: Category
    
    @State private var currentQuestion: Int = 0
    @State private var isAnswered: Bool = false
    @State private var selectedAnswer: Int? = nil
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            let question = getCurrentQuestion()
            QuizHeaderView(
                text: question.text,
                currentQuestion: currentQuestion,
                totalQuestions: category.questions.count)
            ForEach(question.answers) { answer in
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
                                .aspectRatio(
                                    CGFloat(question.answers.count),
                                    contentMode: .fit
                                )
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
        .padding()
    }
    
    private func answerColor(for answer: Answer) -> Color {
        guard isAnswered else { return .accent }
        guard selectedAnswer == answer.id else { return .accent }
        return answer.isCorrect ? .green : .red
    }
    
    private func nextQuestion() {
        currentQuestion += 1
        isAnswered = false
    }
    
    private func getCurrentQuestion() -> Question {
        Question.sampleData.first {
            $0.id == category.questions[currentQuestion]
        } ?? Question.sampleData[0]
    }
}

#Preview {
    QuizView(category: .constant(Category.sampleData[0]))
}
