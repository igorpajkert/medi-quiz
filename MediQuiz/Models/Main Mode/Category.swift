//
//  Category.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation

struct Category: Identifiable, Hashable, Codable {
    
    let id: Int
    let title: String
    let subtitle: String?
    let questions: [Int]
    let isFree: Bool?
    
    init(
        id: Int = Int.randomID(),
        title: String,
        subtitle: String?,
        questions: [Int],
        isFree: Bool
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.questions = questions
        self.isFree = isFree
    }
    
    init(
        id: Int = Int.randomID(),
        title: String = "",
        subtitle: String? = nil,
        questions: [Question] = [],
        isFree: Bool = false
    ) {
        self.init(
            id: id,
            title: title,
            subtitle: subtitle,
            questions: questions.map { $0.id },
            isFree: isFree
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case subtitle = "subtitle"
        case questions = "questionIDs"
        case isFree = "isFree"
    }
}
