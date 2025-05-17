//
//  CategoriesView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 07/05/2025.
//

import SwiftUI

struct CategoriesView: View {
    
    @Environment(\.mainMode) private var mainMode
    
    var body: some View {
        @Bindable var mainMode = mainMode
        
        ScrollView {
            ForEach(mainMode.categories) { category in
                CategoryCard(category: category)
            }
        }
        .navigationTitle("title.categoriesView")
        .navigationDestination(item: $mainMode.selectedCategory) { category in
            MainQuizView(
                categoryId: category.id,
                categoryTitle: category.title
            )
        }
    }
}

#Preview {
    NavigationStack {
        CategoriesView()
            .environment(\.mainMode, MainMode(categories: Category.sampleData))
    }
}
