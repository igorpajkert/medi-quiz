//
//  MediQuizApp.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import SwiftUI
import FirebaseCore

@main
struct MediQuizApp: App {
    
    @State private var authentication = Authentication()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .auth(authentication)
        }
    }
}
