//
//  CategoryCardView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 18/11/2024.
//

import SwiftUI

struct CategoryCardView: View {
    
    @Binding var category: Category
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.accent, lineWidth: 2)
            VStack(alignment: .leading) {
                Text(category.title)
                    .font(.title)
                Text(category.subtitle ?? "")
                    .font(.subheadline)
                Spacer()
                HStack {
                    Label("\(category.questions.count) questions", systemImage: "rectangle.stack")
                    Spacer()
                    if !category.isFree { Label("Locked", systemImage: "lock").labelStyle(.trailingIcon) }
                }
                .font(.callout)
            }
            .padding()            
            NavigationLink(destination: CategoryDetailView(category: $category), label: {}).padding()
        }
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 140)) {
    CategoryCardView(category: .constant(Category.sampleData[3]))
}
