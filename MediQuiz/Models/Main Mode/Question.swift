//
//  Question.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation

struct Question: Identifiable, Hashable, Codable {
    
    let id: Int
    let text: String
    let answers: [Answer]
    let categories: [Int]
    
    init(
        id: Int = Int.randomID(),
        text: String,
        answers: [Answer],
        categories: [Int]
    ) {
        self.id = id
        self.text = text
        self.answers = answers
        self.categories = categories
    }
    
    init(
        id: Int = Int.randomID(),
        text: String = "",
        answers: [Answer] = [],
        categories: [Category] = []
    ) {
        self.init(
            id: id,
            text: text,
            answers: answers,
            categories: categories.map { $0.id }
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case text = "questionText"
        case answers = "answers"
        case categories = "categoryIDs"
    }
}
