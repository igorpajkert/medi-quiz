//
//  CategoryCardView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 18/11/2024.
//

import SwiftUI

struct CategoryCardView: View {
    
    @Binding var category: QuestionsCategory
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.main, lineWidth: 2)
            VStack(alignment: .leading) {
                Text(category.title)
                    .font(.title)
                Text(category.subtitle ?? "")
                    .font(.subheadline)
                Spacer()
                HStack {
                    Label("\(category.questionsCount) questions", systemImage: "rectangle.stack")
                    Spacer()
                    if !category.isUnlocked { Label("Locked", systemImage: "lock").labelStyle(.trailingIcon) }
                }
                .font(.callout)
            }
            .padding()
            NavigationLink(destination: CategoryDetailView(category: $category), label: {}).padding()
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 120)) {
    CategoryCardView(category: .constant(QuestionsCategory.sampleData[3]))
}
