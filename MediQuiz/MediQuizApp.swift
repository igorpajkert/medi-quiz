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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
