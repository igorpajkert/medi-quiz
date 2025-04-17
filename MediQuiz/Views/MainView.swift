//
//  MainView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.auth) private var auth
    
    var body: some View {
        TabView {
            Tab("tab.account", systemImage: "person.crop.circle") {
                AccountView()
            }
        }
    }
}

#Preview {
    MainView()
}
