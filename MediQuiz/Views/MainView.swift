//
//  MainView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.auth) var auth
    
    var body: some View {
        NavigationStack {
            SignInView()
        }
    }
}

#Preview {
    MainView()
}
