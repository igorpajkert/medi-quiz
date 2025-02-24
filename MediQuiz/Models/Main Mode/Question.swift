//
//  Question.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 19/11/2024.
//

import Foundation

struct Question: Identifiable, Codable {
    
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
}
