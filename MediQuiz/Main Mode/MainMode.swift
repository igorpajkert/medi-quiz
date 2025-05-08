//
//  MainMode.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 07/05/2025.
//

import Foundation

@Observable
class MainMode {
    
    private(set) var categories: [Category] = []
    private(set) var questions: [Question] = []
    
    var selectedCategory: Category?
    
    private var isFetched = false
    
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
    
    private struct Constants {
        static let categories = "development_categories"
        static let questions = "development_questions"
    }
}
