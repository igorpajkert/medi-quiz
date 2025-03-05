//
//  SignInView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 04/03/2025.
//

import SwiftUI

struct SignInView: View {
    
    @State private var model = SignInView.ViewModel()
    
    var body: some View {
        ScrollView() {
            VStack(spacing: 16) {
                SampleImage(image: .account)
                headline
                AccountSupportText()
                UserCredentials(email: $model.email, password: $model.password)
                buttonPasswordReset
                buttonSignIn
                buttonSignUp
            }
            .padding()
            .sheet(
                isPresented: $model.isPresentingPasswordResetSheet,
                onDismiss: model.onDismissPasswordReset
            ) {
                PasswordResetSheet()
            }
            .sheet(item: $model.errorWrapper) { wrapper in
                ErrorSheet(wrapper: wrapper)
            }
            .navigationDestination(
                isPresented: $model.isPresentingSignUpView
            ) {
                SignUpView()
            }
        }
    }
    
    private var headline: some View {
        Text("text.signIn")
            .font(.headline)
            .multilineTextAlignment(.center)
    }
    
    private var buttonPasswordReset: some View {
        ButtonTertiary(title: "button.passwordReset", action: model.onTapPasswordReset)
            .font(.callout)
            .padding(.bottom)
    }
    
    private var buttonSignIn: some View {
        ButtonPrimary(title: "button.signIn", action: model.onTapSignIn)
            .bold()
            .disabled(model.isButtonSignInDisabled)
    }
    
    private var buttonSignUp: some View {
        ButtonSecondary(title: "button.signUp", action: model.onTapSignUp)
    }
}

#Preview {
    NavigationStack {
        SignInView()
            .navigationTitle("Sign In")
    }
}
