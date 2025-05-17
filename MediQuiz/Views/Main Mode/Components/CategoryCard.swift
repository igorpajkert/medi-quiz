//
//  CategoryCard.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/05/2025.
//

import SwiftUI

struct CategoryCard: View {
    
    @State private var isExpanded = false
    
    @Environment(\.mainMode) private var mainMode
    @Environment(\.colorScheme) private var scheme
    
    var category: Category
    
    private var isFree: Bool {
        category.isFree ?? false
    }
    
    private var backgroundColor: Color {
        scheme == .light ? .lightLavender : .darkLavender
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            title
            subtitle
            Divider()
            HStack {
                labelCount
                Spacer()
                if !isFree {
                    labelLock
                }
            }
            .font(.callout)
            if isExpanded {
                if isFree {
                    buttonStart
                } else {
                    buttonBuy
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.accent, lineWidth: 4)
                .fill(backgroundColor)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.bouncy) {
                isExpanded.toggle()
            }
        }
    }
    
    private var title: some View {
        Text(category.title)
            .font(.title)
    }
    
    private var subtitle: some View {
        Text(category.subtitle ?? "")
            .lineLimit(2, reservesSpace: true)
            .font(.subheadline)
    }
    
    private var labelCount: some View {
        Label(String(category.questions.count), systemImage: "rectangle.stack")
    }
    
    private var labelLock: some View {
        Label("label.locked", systemImage: "lock")
            .labelStyle(.trailingIcon)
    }
    
    private var buttonBuy: some View {
        ButtonPrimary(title: "button.buy", action: selectCategory)
            .padding(.top)
    }
    
    private var buttonStart: some View {
        ButtonPrimary(title: "button.start", action: selectCategory)
            .padding(.top)
    }
    
    // MARK: - Intents
    private func selectCategory() {
        mainMode.selectedCategory = category
    }
}

#Preview("Paid") {
    CategoryCard(category: Category.sampleData[1])
}

#Preview("Free") {
    CategoryCard(category: Category.sampleData[0])
}
