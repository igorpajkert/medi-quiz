//
//  Answer.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation

struct Answer: Identifiable, Codable {
    
    let id: Int
    let text: String
    let isCorrect: Bool
    
    init(
        id: Int = Int.randomID(),
        text: String,
        isCorrect: Bool
    ) {
        self.id = id
        self.text = text
        self.isCorrect = isCorrect
    }
}
