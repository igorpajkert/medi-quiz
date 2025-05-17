//
//  Question+SampleData.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation

extension Question {
    
    static let sampleData: [Question] = [
        // Question 1: Single correct answer
        .init(
            text: "Which organ filters blood in the human body?",
            answers: [
                .init(text: "Liver", isCorrect: false),
                .init(text: "Kidneys", isCorrect: true),
                .init(text: "Lungs", isCorrect: false),
                .init(text: "Stomach", isCorrect: false)
            ],
            categories: [0, 1]
        ),
        // Question 2: Single correct answer
        .init(
            text: "What is the normal human body temperature in Celsius?",
            answers: [
                .init(text: "36.5°C", isCorrect: false),
                .init(text: "37°C", isCorrect: true),
                .init(text: "38°C", isCorrect: false),
                .init(text: "35°C", isCorrect: false)
            ],
            categories: [0]
        ),
        // Question 3: Multiple correct answers
        .init(
            text: "Which of the following are components of the central nervous system?",
            answers: [
                .init(text: "Brain", isCorrect: true),
                .init(text: "Spinal Cord", isCorrect: true),
                .init(text: "Peripheral Nerves", isCorrect: false),
                .init(text: "Heart", isCorrect: false)
            ]
        ),
        // Question 4: Single correct answer
        .init(
            text: "Which vitamin is produced when sunlight hits the skin?",
            answers: [
                .init(text: "Vitamin D", isCorrect: true),
                .init(text: "Vitamin C", isCorrect: false),
                .init(text: "Vitamin A", isCorrect: false),
                .init(text: "Vitamin B12", isCorrect: false)
            ]
        ),
        // Question 5: Single correct answer
        .init(
            text: "What is the largest bone in the human body?",
            answers: [
                .init(text: "Femur", isCorrect: true),
                .init(text: "Tibia", isCorrect: false),
                .init(text: "Humerus", isCorrect: false)
            ]
        ),
        // Question 6: Single correct answer
        .init(
            text: "Which system in the human body is responsible for fighting infections?",
            answers: [
                .init(text: "Immune system", isCorrect: true),
                .init(text: "Nervous system", isCorrect: false),
                .init(text: "Digestive system", isCorrect: false)
            ]
        ),
        // Question 7: Single correct answer
        .init(
            text: "What is the medical term for high blood pressure?",
            answers: [
                .init(text: "Hypertension", isCorrect: true),
                .init(text: "Hypotension", isCorrect: false),
                .init(text: "Hyperglycemia", isCorrect: false)
            ]
        ),
        // Question 8: Single correct answer
        .init(
            text: "Which type of cell is primarily responsible for carrying oxygen in the blood?",
            answers: [
                .init(text: "Red blood cells", isCorrect: true),
                .init(text: "White blood cells", isCorrect: false),
                .init(text: "Platelets", isCorrect: false)
            ]
        ),
        // Question 9: Single correct answer
        .init(
            text: "What is the common term for myocardial infarction?",
            answers: [
                .init(text: "Heart attack", isCorrect: true),
                .init(text: "Stroke", isCorrect: false),
                .init(text: "Angina", isCorrect: false)
            ]
        ),
        // Question 10: Multiple correct answers
        .init(
            text: "Which of the following diseases are associated with high blood sugar levels?",
            answers: [
                .init(text: "Type 1 Diabetes", isCorrect: true),
                .init(text: "Type 2 Diabetes", isCorrect: true),
                .init(text: "Hypertension", isCorrect: false),
                .init(text: "Hyperthyroidism", isCorrect: false)
            ]
        )
    ]
    
    static func generateSampleData(of count: Int) -> [Question] {
        (0..<count).map { _ in sampleData.randomElement() ?? sampleData[0] }
    }
    
    static let sampleQuestion = Question(
        text: "This is a sample question!",
        answers: [
            .init(text: "First sample answer", isCorrect: false),
            .init(text: "Second sample answer", isCorrect: true),
            .init(text: "Third sample answer", isCorrect: false)
        ], categories: [0, 1, 2]
    )
}
