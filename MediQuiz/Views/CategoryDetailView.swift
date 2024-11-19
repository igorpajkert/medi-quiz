//
//  CategoryDetailView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 18/11/2024.
//

import SwiftUI

struct CategoryDetailView: View {
    
    @Binding var category: QuestionsCategory
    
    var body: some View {
        VStack(alignment: .center) {
            Label("\(category.questionsCount) questions", systemImage: "rectangle.stack")
                .font(.headline)
                .padding(.top)
            Divider()
            Text(category.subtitle ?? "")
                .multilineTextAlignment(.center)
            Spacer()
            NavigationLink(destination: QuizView(category: $category)) {
                ZStack {
                    Circle()
                        .stroke(.main, lineWidth: 5)
                    VStack {
                        Image(systemName: "play.fill")
                            .font(.largeTitle)
                        Text("Start Quiz")
                            .font(.headline)
                    }
                    .foregroundStyle(.main)
                }
            }
            .aspectRatio(1/2, contentMode: .fit)
            Spacer()
            
        }
        .navigationTitle(category.title)
        .padding()
    }
}

#Preview {
    CategoryDetailView(category: .constant(QuestionsCategory.sampleData[5]))
}
