//
//  MainQuizView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/05/2025.
//

import SwiftUI

struct MainQuizView: View {
    
    @Environment(\.mainMode) private var mainMode
    
    var categoryId: Int
    var categoryTitle: String
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    progressBar
                    questionText
                    Divider().padding(.vertical, 50)
                    answers
                }
            }
            if mainMode.isSubmitted {
                AnswerPopup(
                    correctAnswers: mainMode.correctAnswers,
                    isCorrectlyAnswered: mainMode.isCorrectlyAnswered
                )
                buttonNext
            } else {
                buttonSubmit
            }
        }
        .navigationTitle(categoryTitle)
        .task {
            mainMode.prepareQuizQuestions(for: categoryId)
        }
    }
    
    private var progressBar: some View {
        QuizProgressBar(
            current: mainMode.currentQuestionIndex,
            total: mainMode.quizQuestions.count
        )
    }
    
    private var questionText: some View {
        Text(mainMode.currentQuestion.text)
            .font(.title)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
    
    private var answers: some View {
        ForEach(mainMode.currentQuestion.answers) { answer in
            AnswerCard(
                action: { mainMode.selectAnswer(answer) },
                text: answer.text,
                isSelected: mainMode.isSelected(answer)
            )
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        .disabled(mainMode.isAnswered)
    }
    
    private var buttonSubmit: some View {
        ButtonPrimary(title: "button.submit", action: mainMode.submit)
            .padding()
            .disabled(!mainMode.isAnswered)
    }
    
    private var buttonNext: some View {
        ButtonPrimary(title: "button.next", action: mainMode.nextQuestion)
            .padding()
    }
}

#Preview {
    NavigationStack {
        MainQuizView(categoryId: 0, categoryTitle: "Test")
            .environment(
                \.mainMode, MainMode(
                    categories: Category.sampleData,
                    questions: Question.sampleData
                )
            )
    }
}
