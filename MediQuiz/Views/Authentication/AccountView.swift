//
//  AccountView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 15/04/2025.
//

import SwiftUI

struct AccountView: View {
    
    @State private var isShowingEditSheet = false
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.auth) private var auth
    
    private var name: String {
        auth.userData?.name ?? "User"
    }
    
    private var email: String {
        auth.user?.email ?? "user@example.com"
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Spacer(minLength: 100)
                SampleImage(image: .avatar)
                textName
                textEmail
                Divider()
                buttonEditProfile
                buttonSignOut
            }
            .padding()
            .navigationTitle("title.account")
            .sheet(isPresented: $isShowingEditSheet) {
                AccountEditSheet()
            }
            .sheet(item: $errorWrapper) { wrapper in
                ErrorSheet(wrapper: wrapper)
            }
        }
        .scrollIndicators(.never)
    }
    
    private var textName: some View {
        Text(name)
            .font(.title)
    }
    
    private var textEmail: some View {
        Text(email)
            .foregroundColor(.secondary)
    }
    
    private var buttonEditProfile: some View {
        ButtonPrimary(title: "button.editProfile") {
            isShowingEditSheet.toggle()
        }
    }
    
    private var buttonSignOut: some View {
        ButtonPrimary(title: "button.signOut", action: onSignOut)
            .tint(.red)
    }
    
    // MARK: - Intents
    private func onSignOut() {
        do {
            try auth.signOut()
        } catch {
            errorWrapper = .init(
                error: error,
                guidance: "guidance.signOut.failed"
            )
        }
    }
}

#Preview {
    AccountView()
}
