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
    var correctAnswersCount = 0
    
    private var isFetched = false
    
    var currentQuestion: Question {
        quizQuestions.indices.contains(currentQuestionIndex) ?
        quizQuestions[currentQuestionIndex] : Question()
    }
    
    init(categories: [Category] = [], questions: [Question] = []) {
        self.categories = categories
        self.questions = questions
    }
    
    // MARK: Setup
    func fetchData() async throws {
        guard !isFetched else { return }
        
        let db = DatabaseController()
        categories = try await db.getAllDocuments(from: Constants.categories)
        questions = try await db.getAllDocuments(from: Constants.questions)
    }
    
    func setupQuiz(for category: Int) {
        quizQuestions = questions.filter { $0.categories.contains(category) }.shuffled()
        
        currentQuestionIndex = 0
        correctAnswersCount = 0
        isQuizFinished = false
        isSubmitted = false
        setupAnswers()
    }
    
    private func setupAnswers() {
        correctAnswers = currentQuestion.answers.filter { $0.isCorrect }
        selectedAnswers.removeAll()
        isCorrectlyAnswered = false
        isAnswered = false
    }
    
    // MARK: Intents
    func nextQuestion() {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == quizQuestions.indices.endIndex {

            withAnimation(.easeOut) {
                isQuizFinished = true
            }
        }
        
        setupAnswers()
        
        withAnimation(.easeOut) {
            isSubmitted = false
        }
    }
    
    func submit() {
        isCorrectlyAnswered = correctAnswers.contains(selectedAnswers)
        
        if isCorrectlyAnswered {
            correctAnswersCount += 1
        }

        withAnimation(.bouncy) {
            isSubmitted = true
        }
    }
    
    func selectAnswer(_ answer: Answer) {
        selectedAnswers.append(answer)
        
        if selectedAnswers.count == correctAnswers.count {
            isAnswered = true
        }
    }
    
    func isSelected(_ answer: Answer) -> Bool {
        selectedAnswers.contains(answer)
    }
    
    private struct Constants {
        static let categories = "development_categories"
        static let questions = "development_questions"
    }
}
