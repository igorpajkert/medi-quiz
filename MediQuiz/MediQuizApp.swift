//
//  MediQuizApp.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 16/11/2024.
//

import SwiftUI

@main
struct MediQuizApp: App {
    
    @State private var categories: [Category] = Category.sampleData
    
    var body: some Scene {
        WindowGroup {
            CategoriesView(categories: $categories)
        }
    }
}
