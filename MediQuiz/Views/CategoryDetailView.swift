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
        VStack {
            Text("placeholder for \(category.title)")
        }
        .navigationTitle(category.title)
    }
}

#Preview {
    CategoryDetailView(category: .constant(QuestionsCategory.sampleData[0]))
}
