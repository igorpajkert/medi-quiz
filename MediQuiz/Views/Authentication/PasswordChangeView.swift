//
//  PasswordChangeView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 30/04/2025.
//

import SwiftUI

struct PasswordChangeView: View {
    
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var newPasswordConfirmation = ""
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.auth) private var auth
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme
    
    private var fieldStyle: Color {
        scheme == .light ? .black : .white
    }
    
    private var isCredentialsEmpty: Bool {
        oldPassword.isEmpty ||
        newPassword.isEmpty ||
        newPasswordConfirmation.isEmpty
    }
    
    private var isPasswordMatch: Bool {
        newPassword == newPasswordConfirmation
    }
    
    private var isCredentialsValid: Bool {
        !isCredentialsEmpty && isPasswordMatch
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer(minLength: 100)
                VStack(spacing: 16) {
                    SampleImage(image: .password)
                    headline
                    SecureFieldPrimary(
                        label: "field.oldPassword",
                        text: $oldPassword
                    )
                    SecureFieldPrimary(
                        label: "field.newPassword",
                        text: $newPassword
                    )
                    SecureFieldPrimary(
                        label: "field.newPasswordConfirmation",
                        text: $newPasswordConfirmation
                    )
                    .foregroundStyle(isPasswordMatch ? fieldStyle : .red)
                    buttonChangePassword
                }
                .padding()
                .onChange(of: auth.passwordChangeSuccess) { old, new in
                    if new {
                        dismiss()
                    }
                }
            }
            .scrollIndicators(.never)
        }
    }
    
    private var headline: some View {
        Group {
            TextPrimary(text: "text.passwordChange")
            TextTertiary(text: "text.passwordChangeHint")
        }
    }
    
    private var buttonChangePassword: some View {
        ButtonPrimary(
            title: "button.changePassword",
            action: changePassword
        )
        .disabled(!isCredentialsValid)
    }
    
    // MARK: - Intents
    private func changePassword() {
        Task {
            do {
                try await auth.changePassword(
                    from: oldPassword,
                    to: newPassword
                )
            } catch {
                errorWrapper = .init(
                    error: error,
                    guidance: "guidance.passwordChangeFailed"
                )
            }
        }
    }
}

#Preview {
    PasswordChangeView()
}
