//
//  MainView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct MainView: View {
    
    @State private var isShowingAccountView = false
    
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationDestination(isPresented: $isShowingAccountView) {
                    AccountHost()
                }
                .toolbar {
                    toolbarButtonAccount
                }
        }
    }
    
    private var toolbarButtonAccount: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: { isShowingAccountView = true}) {
                Image(systemName: "person.crop.circle")
            }
        }
    }
}

#Preview {
    MainView()
}
