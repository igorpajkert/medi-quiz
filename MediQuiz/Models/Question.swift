//
//  Question.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 19/11/2024.
//

import Foundation

struct Question: Identifiable, Codable {
    
    let id: UUID
    let text: String
    let answers: [Answer]
    
    init(id: UUID = UUID(), text: String, answers: [Answer]) {
        self.id = id
        self.text = text
        self.answers = answers
    }
}

extension Question {
    
    struct Answer: Identifiable, Codable {
        
        let id: UUID
        let text: String
        let isCorrect: Bool
        
        init(id: UUID = UUID(), text: String, isCorrect: Bool) {
            self.id = id
            self.text = text
            self.isCorrect = isCorrect
        }
    }
}

extension Question {
    
    static let sampleData: [Question] =
    [
        .init(text: "Which organ filters blood in the human body?", answers: [.init(text: "Liver", isCorrect: false), .init(text: "Kidneys", isCorrect: true), .init(text: "Lungs", isCorrect: false), .init(text: "Stomach", isCorrect: false)]),
        .init(text: "What is the name of the hormone that regulates blood sugar levels?", answers: [.init(text: "Insulin", isCorrect: true), .init(text: "Adrenaline", isCorrect: false), .init(text: "Thyroxine", isCorrect: false), .init(text: "Glucagon", isCorrect: false)]),
        .init(text: "What is the primary function of red blood cells?", answers: [.init(text: "Fight infections", isCorrect: false), .init(text: "Regulate hormones", isCorrect: false), .init(text: "Transport oxygen", isCorrect: true), .init(text: "Filter waste", isCorrect: false)]),
        .init(text: "Which part of the brain is responsible for balance and coordination?", answers: [.init(text: "Cerebrum", isCorrect: false), .init(text: "Thalamus", isCorrect: false), .init(text: "Cerebellum", isCorrect: true), .init(text: "Medulla", isCorrect: false)]),
        .init(text: "What is the largest organ in the human body?", answers: [.init(text: "Liver", isCorrect: false), .init(text: "Skin", isCorrect: true), .init(text: "Heart", isCorrect: false), .init(text: "Brain", isCorrect: false)]),
        .init(text: "What type of blood vessel carries oxygenated blood away from the heart?", answers: [.init(text: "Capillaries", isCorrect: false), .init(text: "Veins", isCorrect: false), .init(text: "Lymph vessels", isCorrect: false), .init(text: "Arteries", isCorrect: true)]),
        .init(text: "Which vitamin is essential for blood clotting?", answers: [.init(text: "Vitamin D", isCorrect: false), .init(text: "Vitamin K", isCorrect: true), .init(text: "Vitamin A", isCorrect: false), .init(text: "Vitamin C", isCorrect: false)]),
        .init(text: "What is the normal pH range of human blood?", answers: [.init(text: "7.35-7.45", isCorrect: true), .init(text: "6.0-6.5", isCorrect: false), .init(text: "6.5-7.0", isCorrect: false), .init(text: "7.8-8.2", isCorrect: false)]),
        .init(text: "What is the primary function of the pancreas?", answers: [.init(text: "Produce insulin", isCorrect: true), .init(text: "Regulate blood pressure", isCorrect: false), .init(text: "Filter toxins", isCorrect: false), .init(text: "Store bile", isCorrect: false)]),
        .init(text: "Which type of cell is responsible for fighting infections in the body?", answers: [.init(text: "Nerve cells", isCorrect: false), .init(text: "Red blood cells", isCorrect: false), .init(text: "White blood cells", isCorrect: true), .init(text: "Platelets", isCorrect: false)])
    ]
    
    static func generateSampleData(of count: Int) -> [Question] {
        
        var sampleDataArray: [Question] = []
        
        for _ in 0..<count {
            sampleDataArray.append(sampleData.randomElement() ?? sampleData[0])
        }
        
        return sampleDataArray
    }
}
