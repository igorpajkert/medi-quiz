//
//  SignInView+ViewModel.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 04/03/2025.
//

import Foundation

extension SignInView {
    
    @Observable
    class ViewModel {
        
        var email = ""
        var password = ""
        
        var isPresentingPasswordResetSheet = false
        var isPresentingSignUpView = false
        
        var errorWrapper: ErrorWrapper?
        
        var isButtonSignInDisabled: Bool {
            email.isEmpty || password.isEmpty
        }
        
        // MARK: - Intents
        private func presentPasswordResetSheet() {
            isPresentingPasswordResetSheet = true
        }
        
        private func dismissPasswordResetSheet() {
            isPresentingPasswordResetSheet = false
        }
        
        private func presentSignUpView() {
            isPresentingSignUpView = true
        }
        
        private func clearCredentials() {
            email.clear()
            password.clear()
        }
        
        private func signIn() {
            Task {
                do {
                    try await Authentication.shared.signIn(
                        with: email,
                        password: password
                    )
                } catch {
                    errorWrapper = .init(
                        error: error,
                        guidance: "guidance.signInFailed",
                        dismissAction: .init(
                            title: "action.tryAgain",
                            action: clearCredentials
                        )
                    )
                }
            }
        }
        
        // MARK: - Events
        func onTapPasswordReset() {
            presentPasswordResetSheet()
        }
        
        func onDismissPasswordReset() {
            dismissPasswordResetSheet()
        }
        
        func onTapSignIn() {
            signIn()
        }
        
        func onTapSignUp() {
            presentSignUpView()
        }
    }
}
