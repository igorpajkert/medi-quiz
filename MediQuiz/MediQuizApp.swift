//
//  MediQuizApp.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 16/11/2024.
//

import SwiftUI
import FirebaseCore

@main
struct MediQuizApp: App {
    
    @State private var categories: [Category] = Category.sampleData
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            CategoriesView(categories: $categories)
        }
    }
}
