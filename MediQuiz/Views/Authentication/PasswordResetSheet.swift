//
//  PasswordResetSheet.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct PasswordResetSheet: View {
    
    @State private var email = ""
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.auth) private var auth
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer(minLength: 100)
                VStack(spacing: 16) {
                    SampleImage(image: .email)
                    textHeadline
                    fieldEmail
                    buttonSend
                }
                .padding()
                .navigationTitle("title.passwordReset")
                .sheet(item: $errorWrapper) { wrapper in
                    ErrorSheet(wrapper: wrapper)
                }
            }
            .scrollIndicators(.never)
        }
    }
    
    private var textHeadline: some View {
        TextPrimary(text: "text.passwordReset")
            .multilineTextAlignment(.center)
    }
    
    private var fieldEmail: some View {
        TextFieldPrimary(label: "label.email", text: $email)
            .textInputAutocapitalization(.never)
    }
    
    private var buttonSend: some View {
        ButtonPrimary(title: "button.send", action: onSend)
            .disabled(email.isEmpty)
    }
    
    // MARK: - Intents
    private func onSend() {
        Task {
            do {
                try await auth.sendPasswordResetEmail(to: email)
            } catch {
                errorWrapper = .init(
                    error: error,
                    guidance: "guidance.passwordReset.failed"
                )
            }
        }
    }
}

#Preview {
    PasswordResetSheet()
        .environment(\.auth, Authentication())
}
