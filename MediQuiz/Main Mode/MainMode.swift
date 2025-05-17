//
//  MainMode.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 07/05/2025.
//

import SwiftUI

@Observable
class MainMode {
    
    private(set) var categories = [Category]()
    private(set) var questions = [Question]()
    
    var selectedCategory: Category?
    var quizQuestions = [Question]()
    var currentQuestionIndex = 0
    var isQuizFinished = false
    var isSubmitted = false
    
    var isAnswered = false
    var isCorrectlyAnswered = false
    var selectedAnswers = [Answer]()
    var correctAnswers = [Answer]()
    var correctAnswerCount = 0
    
    private var isFetched = false
    
    var currentQuestion: Question {
        quizQuestions.indices.contains(currentQuestionIndex) ?
        quizQuestions[currentQuestionIndex] : Question()
    }
    
    init(categories: [Category] = [], questions: [Question] = []) {
        self.categories = categories
        self.questions = questions
    }
    
    func fetchData() async throws {
        guard !isFetched else { return }
        
        let db = DatabaseController()
        categories = try await db.getAllDocuments(from: Constants.categories)
        questions = try await db.getAllDocuments(from: Constants.questions)
    }
    
    func prepareQuizQuestions(for category: Int) {
        quizQuestions = questions.filter { $0.categories.contains(category) }.shuffled()
        resetQuiz()
    }
    
    func nextQuestion() {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == quizQuestions.indices.endIndex {
            isQuizFinished = true
        }
        
        prepareAnswers()
        
        withAnimation(.easeOut) {
            isSubmitted = false
        }
    }
    
    func submit() {
        isCorrectlyAnswered = correctAnswers.contains(selectedAnswers)
        
        withAnimation(.bouncy) {
            isSubmitted = true
        }
    }
    
    func selectAnswer(_ answer: Answer) {
        selectedAnswers.append(answer)
        
        if selectedAnswers.count == correctAnswerCount {
            isAnswered = true
        }
    }
    
    func isSelected(_ answer: Answer) -> Bool {
        selectedAnswers.contains(answer)
    }
    
    private func resetQuiz() {
        currentQuestionIndex = 0
        isQuizFinished = false
        prepareAnswers()
        isSubmitted = false
    }
    
    private func prepareAnswers() {
        isAnswered = false
        correctAnswers = currentQuestion.answers.filter { $0.isCorrect }
        correctAnswerCount = correctAnswers.count
        selectedAnswers.removeAll()
        isCorrectlyAnswered = false
    }
    
    private struct Constants {
        static let categories = "development_categories"
        static let questions = "development_questions"
    }
}
