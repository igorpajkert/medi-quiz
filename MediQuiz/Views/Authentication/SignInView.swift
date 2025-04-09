//
//  SignInView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct SignInView: View {
    
    @State private var isShowingPasswordResetSheet = false
    @State private var isShowingSignUpView = false
    
    @Environment(\.auth) var auth
    
    var body: some View {
        @Bindable var auth = auth
        
        ScrollView {
            VStack(spacing: 16) {
                SampleImage(image: .account)
                headline
                Credentials(email: $auth.email, password: $auth.password)
                buttonPasswordReset
                buttonSignIn
                buttonSignUp
            }
            .navigationTitle("title.signIn")
            .padding()
            .sheet(isPresented: $isShowingPasswordResetSheet) {
                PasswordResetSheet()
            }
            .sheet(item: $auth.errorWrapper) { wrapper in
                ErrorSheet(wrapper: wrapper)
            }
            .navigationDestination(isPresented: $isShowingSignUpView) {
                SignUpView()
            }
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
        ButtonPrimary(title: "button.signIn") {
            auth.signIn(with: auth.email, password: auth.password)
        }
        .bold()
        .disabled(auth.email.isEmpty || auth.password.isEmpty)
    }
    
    private var buttonSignUp: some View {
        ButtonSecondary(title: "button.signUp") {
            isShowingSignUpView = true
        }
    }
}

#Preview {
    NavigationStack {
        SignInView()
            .auth(.init())
    }
}
