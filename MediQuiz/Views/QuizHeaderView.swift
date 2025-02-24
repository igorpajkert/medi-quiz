//
//  QuizHeaderView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 19/11/2024.
//

import SwiftUI

struct QuizHeaderView: View {
    
    var text: String
    var currentQuestion: Int
    var totalQuestions: Int
    
    private var progress: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(currentQuestion) / Double(totalQuestions)
    }
    
    var body: some View {
        VStack {            
            HStack {
                Text("\(currentQuestion)")
                Spacer()
                Text("\(totalQuestions)")
            }
            .font(.footnote)
            .foregroundStyle(.main)
            ProgressView(value: progress)
                .tint(.main)
                .progressViewStyle(.linear)
            Text(text)
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    QuizHeaderView(text: Question.sampleData[0].text, currentQuestion: 5, totalQuestions: 10)
}
