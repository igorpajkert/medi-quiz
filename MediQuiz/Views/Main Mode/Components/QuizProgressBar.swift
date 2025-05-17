//
//  QuizProgressBar.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/05/2025.
//

import SwiftUI

struct QuizProgressBar: View {
    
    var current: Int
    var total: Int
    
    private var progress: Double {
        guard total >= 0 else { return 0 }
        return Double(current) / Double(total)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(current, format: .number)
                Spacer()
                Text(total, format: .number)
            }
            ProgressView(value: progress)
                .progressViewStyle(.linear)
        }
        .foregroundStyle(.accent)
        .padding()
    }
}

#Preview {
    QuizProgressBar(current: 5, total: 10)
}
