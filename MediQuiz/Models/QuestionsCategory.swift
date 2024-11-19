//
//  QuestionsCategory.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 18/11/2024.
//

import Foundation

struct QuestionsCategory: Identifiable, Codable {
    
    let id: UUID
    let title: String
    let subtitle: String?
    var questionsCount: Int { questions.count }
    var isUnlocked: Bool
    var questions: [Question]
    
    init(id: UUID = UUID(), title: String, subtitle: String? = nil, isUnlocked: Bool = false, questions: [Question] = []) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.isUnlocked = isUnlocked
        self.questions = questions
    }
}

extension QuestionsCategory {
    
    static let sampleData: [QuestionsCategory] =
    [
        QuestionsCategory(title: "General Knowledge", subtitle: "Everything you need to know!", isUnlocked: true, questions: Question.generateSampleData(of: 250)),
        QuestionsCategory(title: "First Aid", subtitle: "Quick actions, saved lives.", isUnlocked: true, questions: Question.generateSampleData(of: 150)),
        QuestionsCategory(title: "Infectious Diseases", subtitle: "Learn to prevent and protect.", isUnlocked: false, questions: Question.generateSampleData(of: 80)),
        QuestionsCategory(title: "Obesity", subtitle: "Understanding health and lifestyle.", isUnlocked: false, questions: Question.generateSampleData(of: 120)),
        QuestionsCategory(title: "Sexual Life", subtitle: "Empowering intimacy and wellness.", isUnlocked: false, questions: Question.generateSampleData(of: 100)),
        QuestionsCategory(title: "Mental Wellness", subtitle: "Understanding mental health and stress management.", isUnlocked: true, questions: Question.generateSampleData(of: 65)),
        QuestionsCategory(title: "Anatomy Made Easy", subtitle: "Learn how the human body works step by step.", isUnlocked: false, questions: Question.generateSampleData(of: 175)),
        QuestionsCategory(title: "Pharmacology Basics", subtitle: "Understand medicines and their effects.", isUnlocked: false, questions: Question.generateSampleData(of: 50))
    ]
}
