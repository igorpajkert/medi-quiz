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
        .init(text: "What is the primary function of red blood cells?", answers: [.init(text: "Transport oxygen", isCorrect: true), .init(text: "Fight infections", isCorrect: false), .init(text: "Regulate body temperature", isCorrect: false)]),
        .init(text: "What is the name of the largest bone in the human body?", answers: [.init(text: "Femur", isCorrect: true), .init(text: "Humerus", isCorrect: false), .init(text: "Tibia", isCorrect: false)]),
        .init(text: "Which organ is primarily responsible for filtering blood?", answers: [.init(text: "Kidney", isCorrect: true), .init(text: "Liver", isCorrect: false), .init(text: "Heart", isCorrect: false)]),
        .init(text: "What is the term for the process of cell division in humans?", answers: [.init(text: "Mitosis", isCorrect: true), .init(text: "Meiosis", isCorrect: false), .init(text: "Binary fission", isCorrect: false)]),
        .init(text: "Which vitamin is essential for blood clotting?", answers: [.init(text: "Vitamin K", isCorrect: true), .init(text: "Vitamin D", isCorrect: false), .init(text: "Vitamin C", isCorrect: false)]),
        .init(text: "What is the name of the condition characterized by high blood sugar levels?", answers: [.init(text: "Diabetes", isCorrect: true), .init(text: "Anemia", isCorrect: false), .init(text: "Hypertension", isCorrect: false)]),
        .init(text: "What part of the brain controls balance and coordination?", answers: [.init(text: "Cerebellum", isCorrect: true), .init(text: "Cerebrum", isCorrect: false), .init(text: "Medulla oblongata", isCorrect: false)]),
        .init(text: "Which type of blood vessel carries oxygenated blood away from the heart?", answers: [.init(text: "Arteries", isCorrect: true), .init(text: "Veins", isCorrect: false), .init(text: "Capillaries", isCorrect: false)]),
        .init(text: "What is the term for inflammation of the joints?", answers: [.init(text: "Arthritis", isCorrect: true), .init(text: "Osteoporosis", isCorrect: false), .init(text: "Bursitis", isCorrect: false)]),
        .init(text: "Which organ produces insulin?", answers: [.init(text: "Pancreas", isCorrect: true), .init(text: "Liver", isCorrect: false), .init(text: "Gallbladder", isCorrect: false)])
    ]
    
    static func generateSampleData(of count: Int) -> [Question] {
        
        var sampleDataArray: [Question] = []
        
        for _ in 0..<count {
            sampleDataArray.append(sampleData.randomElement() ?? sampleData[0])
        }
        
        return sampleDataArray
    }
}
