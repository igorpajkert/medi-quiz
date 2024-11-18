//
//  ContentView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 16/11/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var categories: [QuestionsCategory]
    
    var body: some View {
        NavigationStack {
            List($categories) { $category in
                CategoryCardView(category: $category)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listItemTint(.main)
                    .aspectRatio(2/1, contentMode: .fill)
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView(categories: .constant(QuestionsCategory.sampleData))
}
