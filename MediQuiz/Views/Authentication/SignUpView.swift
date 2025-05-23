//
//  SignUpView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.auth) private var auth
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme
    
    private var fieldStyle: Color {
        scheme == .light ? .black : .white
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SampleImage(image: .avatar)
                VStack(alignment: .leading) {
                    sectionName
                    sectionEmail
                    sectionPassword
                    buttonRegister
                        .padding(.top)
                    buttonCancel
                }
            }
            .padding()
            .navigationTitle("title.signup")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $errorWrapper) { wrapper in
                ErrorSheet(wrapper: wrapper)
            }
            .onChange(of: auth.signUpSuccess) { old, new in
                if new {
                    dismiss()
                }
            }
        }
        .scrollIndicators(.never)
    }
    
    @ViewBuilder
    private var sectionName: some View {
        @Bindable var auth = auth
        Section("section.name") {
            TextFieldPrimary(
                label: "label.name",
                text: $auth.newAccount.name
            )
        }
    }
    
    @ViewBuilder
    private var sectionEmail: some View {
        @Bindable var auth = auth
        Section("section.email") {
            TextFieldPrimary(
                label: "label.email",
                text: $auth.newAccount.email
            )
        }
    }
    
    @ViewBuilder
    private var sectionPassword: some View {
        @Bindable var auth = auth
        Section("section.password") {
            SecureFieldPrimary(
                label: "label.password",
                text: $auth.newAccount.password
            )
            SecureFieldPrimary(
                label: "label.confirmPassword",
                text: $auth.newAccount.passwordConfirmation
            )
            .foregroundStyle(auth.newAccount.isPasswordMatching ? fieldStyle : .red)
        }
    }
    
    private var buttonRegister: some View {
        ButtonPrimary(title: "button.register", action: onRegister)
            .disabled(!auth.newAccount.isCredentialsValid)
    }
    
    private var buttonCancel: some View {
        ButtonSecondary(title: "button.cancel") {
            dismiss()
        }
    }
    
    // MARK: - Intents
    private func onRegister() {
        Task {
            do {
                try await auth.register(account: auth.newAccount)
            } catch {
                errorWrapper = .init(
                    error: error,
                    guidance: "guidance.register.failed"
                )
            }
        }
    }
}

#Preview {
    NavigationStack {
        SignUpView()
            .environment(\.auth, Authentication())
    }
}
