//
//  QuestionsCategory.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 18/11/2024.
//

import Foundation

struct QuestionsCategory: Identifiable, Codable {
    
    let id: UUID
    var title: String
    var subtitle: String?
    var questionsCount: Int
    var isUnlocked: Bool
    
    init(id: UUID = UUID(), title: String, subtitle: String? = nil, questionsCount: Int, isUnlocked: Bool) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.questionsCount = questionsCount
        self.isUnlocked = isUnlocked
    }
}

extension QuestionsCategory {
    
    static let sampleData: [QuestionsCategory] =
    [
        QuestionsCategory(title: "General Knowledge", subtitle: "Everything you need to know!", questionsCount: 250, isUnlocked: true),
        QuestionsCategory(title: "First Aid", subtitle: "Quick actions, saved lives.", questionsCount: 150, isUnlocked: true),
        QuestionsCategory(title: "Infectious Diseases", subtitle: "Learn to prevent and protect.", questionsCount: 80, isUnlocked: false),
        QuestionsCategory(title: "Obesity", subtitle: "Understanding health and lifestyle.", questionsCount: 100, isUnlocked: false),
        QuestionsCategory(title: "Sexual Life", subtitle: "Empowering intimacy and wellness.", questionsCount: 50, isUnlocked: false),
        QuestionsCategory(title: "Mental Wellness", subtitle: "Understanding mental health and stress management.", questionsCount: 120, isUnlocked: true),
        QuestionsCategory(title: "Anatomy Made Easy", subtitle: "Learn how the human body works step by step.", questionsCount: 130, isUnlocked: false),
        QuestionsCategory(title: "Pharmacology Basics", subtitle: "Understand medicines and their effects.", questionsCount: 65, isUnlocked: false)
    ]
}
