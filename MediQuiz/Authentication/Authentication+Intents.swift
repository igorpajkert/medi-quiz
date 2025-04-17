//
//  Authentication+Intents.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation
import FirebaseAuth

extension Authentication {
    
    // MARK: - Signing
    /// Creates a new user account with the provided email and password.
    func signUp(with email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    /// Signs in an existing user with the provided email and password.
    func signIn(with email: String, password: String) {
        Task {
            do {
                try await Auth.auth().signIn(withEmail: email, password: password)
            } catch {
                errorWrapper = .init(
                    error: error,
                    guidance: "guidance.signIn.failed",
                    action: .init(
                        title: "action.tryAgain",
                        action: clearCredentials
                    )
                )
            }
        }
    }
    
    /// Signs out the currently authenticated user.
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            errorWrapper = .init(
                error: error,
                guidance: "guidance.signOut.failed"
            )
        }
    }
    
    // MARK: - Authentication
    /// Sends a verification email to the currently authenticated user.
    func sendVerificationEmail() async throws {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.noUserFound
        }
        
        try await user.sendEmailVerification()
    }
    
    /// Sends a password reset email to the specified email address.
    func sendPasswordResetEmail(to email: String) {
        Task {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
            } catch {
                errorWrapper = .init(error: error, guidance: "guidance.passwordReset.failed")
            }
        }
    }
    
    /// Re-authenticates the current user using the provided email and password.
    func reauthenticateUser(with email: String, password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.noUserFound
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        try await user.reauthenticate(with: credential)
    }
    
    // MARK: - Updating Credentials
    /// Updates the password of the currently authenticated user.
    func updatePassword(to password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw AuthError.noUserFound
        }
        
        do {
            try await user.updatePassword(to: password)
        } catch AuthErrorCode.requiresRecentLogin {
            throw AuthError.authenticationRequired
        } catch {
            throw error
        }
    }
    
    // MARK: - Fetching User Data
    func fetchUserData() async throws -> UserData? {
        guard let user = user else { throw AuthError.noUserFound }
        return try await DatabaseController()
            .getDocument(user.uid, within: "user_data")
    }
    
    func setUserName(for user: UserData) throws {
        try DatabaseController().set(user, in: user.id, within: "user_data")
    }
    
    // MARK: - Register
    func register(account: Account) {
        Task {
            do {
                try await signUp(with: newAccount.email, password: newAccount.password)
                
                if let user = Auth.auth().currentUser {
                    try setUserName(for: .init(id: user.uid, name: account.name))
                }
                
                signIn(with: newAccount.email, password: newAccount.password)
                
                newAccount.clear()
                signUpSuccess = true
            } catch {
                errorWrapper = .init(error: error, guidance: "guidance.register.failed")
            }
        }
    }
    
    // MARK: - Common
    func clearCredentials() {
        email.clear()
        password.clear()
    }
}
