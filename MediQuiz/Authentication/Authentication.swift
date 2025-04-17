//
//  Authentication.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation
import FirebaseAuth

@Observable
final class Authentication {
    
    var user: User?
    var userData: UserData?
    
    var email = ""
    var password = ""
    var newAccount = Account()
    var errorWrapper: ErrorWrapper?
    var signUpSuccess = false
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    var isSignIn: Bool {
        user != nil
    }
    
    init() {
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

extension Authentication {
    
    enum AuthError: Error, LocalizedError {
        
        case noUserFound
        case authenticationRequired
        
        var errorDescription: String? {
            switch self {
            case .noUserFound:
                return String(localized: "error.noUserFound")
            case .authenticationRequired:
                return String(localized: "error.authenticationRequired")
            }
        }
    }
}
