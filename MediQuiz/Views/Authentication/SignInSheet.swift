//
//  SignInSheet.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct SignInSheet: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var isShowingPasswordResetSheet = false
    @State private var isShowingSignUpView = false
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.auth) private var auth
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    SampleImage(image: .account)
                    headline
                    Credentials(
                        email: $email,
                        password: $password
                    )
                    buttonPasswordReset
                    buttonSignIn
                    buttonSignUp
                }
                .navigationTitle("title.signIn")
                .padding()
                .sheet(item: $errorWrapper) { wrapper in
                    ErrorSheet(wrapper: wrapper)
                }
                .sheet(
                    isPresented: $isShowingPasswordResetSheet
                ) {
                    PasswordResetSheet()
                }
                .navigationDestination(
                    isPresented: $isShowingSignUpView
                ) {
                    SignUpView()
                }
            }
            .scrollIndicators(.never)
        }
    }
    
    private var headline: some View {
        Group {
            TextPrimary(text: "text.signIn")
            TextTertiary(text: "text.accountSupport")
        }
        .multilineTextAlignment(.center)
    }
    
    private var buttonPasswordReset: some View {
        ButtonTertiary(title: "button.passwordReset") {
            isShowingPasswordResetSheet = true
        }
        .font(.callout)
        .padding(.bottom)
    }
    
    private var buttonSignIn: some View {
        ButtonPrimary(title: "button.signIn", action: onSignIn)
            .bold()
            .disabled(email.isEmpty || password.isEmpty)
    }
    
    private var buttonSignUp: some View {
        ButtonSecondary(title: "button.signUp") {
            isShowingSignUpView = true
        }
    }
    
    // MARK: - Intents
    private func onSignIn() {
        Task {
            do {
                try await auth.signIn(with: email, password: password)
                dismiss()
            } catch {
                errorWrapper = .init(
                    error: error,
                    guidance: "guidance.signIn.failed",
                    action: .init(title: "action.tryAgain") {
                        email.clear()
                        password.clear()
                    }
                )
            }
        }
    }
}

#Preview {
    SignInSheet()
        .auth(.init())
}
