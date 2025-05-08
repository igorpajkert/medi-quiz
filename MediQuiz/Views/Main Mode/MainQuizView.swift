//
//  MainQuizView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/05/2025.
//

import SwiftUI

struct MainQuizView: View {
    
    var category: Category
    
    var body: some View {
        Text(category.title)
    }
}

#Preview {
    MainQuizView(category: Category.sampleData[0])
}
