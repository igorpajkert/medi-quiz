//
//  Authentication.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 25/02/2025.
//

import Foundation
import FirebaseCore
import FirebaseAuth

@Observable
final class Authentication {
    
    static let shared = Authentication()
    
    var user: User?
    var userData: UserData?
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    private init() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            self.user = user
            
            Task {
                do {
                    self.userData = try await self.fetchUserData()
                } catch {
                    print("Error fetching user data: \(error.localizedDescription)")
                }
            }
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
