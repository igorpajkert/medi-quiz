//
//  Category+SampleData.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation

extension Category {
    
    static let sampleData: [Category] = [
        .init(
            title: "Anatomy",
            subtitle: "The structure of the human body",
            questions: Question.generateSampleData(of: 72),
            isFree: true
        ),
        .init(
            title: "Physiology",
            subtitle: "How body systems function",
            questions: Question.generateSampleData(of: 95),
            isFree: false
        ),
        .init(
            title: "Pathology",
            subtitle: "Understanding diseases and their causes",
            questions: Question.generateSampleData(of: 110),
            isFree: true
        ),
        .init(
            title: "Pharmacology",
            subtitle: "Medicinal drugs and their effects",
            questions: Question.generateSampleData(of: 85),
            isFree: false
        ),
        .init(
            title: "Microbiology",
            subtitle: "Microorganisms in health and disease",
            questions: Question.generateSampleData(of: 98),
            isFree: true
        ),
        .init(
            title: "Surgery",
            subtitle: "Surgical procedures and techniques",
            questions: Question.generateSampleData(of: 60),
            isFree: true
        ),
        .init(
            title: "Radiology",
            subtitle: "Medical imaging and diagnostic techniques",
            questions: Question.generateSampleData(of: 100),
            isFree: false
        ),
        .init(
            title: "Neurology",
            subtitle: "Nervous system and disorders",
            questions: Question.generateSampleData(of: 92),
            isFree: true
        ),
        .init(
            title: "Pediatrics",
            subtitle: "Health care for infants and children",
            questions: Question.generateSampleData(of: 115),
            isFree: true
        ),
        .init(
            title: "Obstetrics & Gynecology",
            subtitle: "Women's reproductive health",
            questions: Question.generateSampleData(of: 88),
            isFree: false
        )
    ]
}
