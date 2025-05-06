//
//  AccountEditSheet.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 17/04/2025.
//

import SwiftUI

struct AccountEditSheet: View {
    
    @State private var username = ""
    @State private var errorWrapper: ErrorWrapper?
    @State private var isShowingDeleteConfirmationAlert = false
    @State private var isShowingPasswordChangeView = false
    
    @Environment(\.auth) private var auth
    @Environment(\.dismiss) private var dismiss
    
    private var isEdited: Bool {
        username != auth.userData?.name
    }
    
    var body: some View {
        @Bindable var auth = auth
        
        NavigationStack {
            Form {
                sectionUsername
                sectionChangePassword
                sectionDeleteAccount
            }
            .navigationTitle("title.editAccount")
            .toolbar {
                toolbarButtonSave
                toolbarButtonCancel
            }
            .navigationDestination(isPresented: $isShowingPasswordChangeView) {
                PasswordChangeView()
            }
            .sheet(item: $errorWrapper) { wrapper in
                ErrorSheet(wrapper: wrapper)
            }
            .alert(
                "alert.deleteAccountConfirmation",
                isPresented: $isShowingDeleteConfirmationAlert
            ) {
                Button("button.delete", role: .destructive, action: {})
            }
            .onAppear {
                username = auth.userData?.name ?? ""
            }
        }
    }
    
    private var sectionUsername: some View {
        Section("section.username") {
            HStack {
                Text("text.username")
                Spacer()
                TextField("field.username", text: $username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
    
    private var sectionChangePassword: some View {
        Section("section.changePassword") {
            Text("text.changePasswordWarning")
                .padding(.vertical, 5)
            Button("button.changePassword") {
                isShowingPasswordChangeView.toggle()
            }
        }
    }
    
    private var sectionDeleteAccount: some View {
        Section("section.deleteAccount") {
            Text("text.deleteAccountWarning")
                .padding(.vertical, 5)
            Button("button.deleteAccount", role: .destructive) {
                isShowingDeleteConfirmationAlert.toggle()
            }
        }
    }
    
    private var toolbarButtonSave: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button("button.save", action: changeUserName)
                .disabled(!isEdited)
        }
    }
    
    private var toolbarButtonCancel: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("button.cancel") {
                dismiss()
            }
        }
    }
    
    // MARK: - Intents
    private func changeUserName() {
        do {
            try auth.changeUserName(to: username)
            dismiss()
        } catch {
            errorWrapper = .init(
                error: error,
                guidance: "guidance.usernameChangeFailed"
            )
        }
    }
}

#Preview {
    AccountEditSheet()
}
