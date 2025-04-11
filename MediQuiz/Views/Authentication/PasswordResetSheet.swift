//
//  PasswordResetSheet.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct PasswordResetSheet: View {
    
    @State private var email = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.auth) var auth
    
    var body: some View {
        @Bindable var auth = auth
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    SampleImage(image: .email)
                    textHeadline
                    fieldEmail
                    buttonSend
                }
                .padding()
                .navigationTitle("title.passwordReset")
                .sheet(item: $auth.errorWrapper) { wrapper in
                    ErrorSheet(wrapper: wrapper)
                }
            }
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
        ButtonPrimary(title: "button.send") {
            auth.sendPasswordResetEmail(to: email)
        }
        .disabled(email.isEmpty)
    }
}

#Preview {
    PasswordResetSheet()
        .environment(\.auth, Authentication())
}
