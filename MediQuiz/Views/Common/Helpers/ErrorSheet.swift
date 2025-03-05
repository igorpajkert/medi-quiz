//
//  ErrorSheet.swift
//  JsonWizardMobile
//
//  Created by Igor Pajkert on 11/01/2025.
//

import SwiftUI

struct ErrorSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let wrapper: ErrorWrapper
    
    var body: some View {
        NavigationStack {
            ScrollView {
                errorContent
                    .multilineTextAlignment(.center)
                    .navigationTitle("title.error")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        toolbarDismissButton
                    }
                    .padding()
            }
        }
    }
    
    private var errorSymbol: some View {
        Image(systemName: "xmark.circle")
            .font(.title)
            .imageScale(.large)
            .foregroundStyle(.red)
    }
    
    private var errorContent: some View {
        VStack(spacing: 16) {
            errorSymbol
                .padding(.top)
            Text(wrapper.error.localizedDescription)
                .font(.headline)
            Divider()
            Text(wrapper.guidance)
                .font(.caption)
                .padding()
            actionButton
        }
    }
    
    private var actionButton: some View {
        ButtonPrimary(
            title: wrapper.dismissAction?.title ?? "button.dismiss",
            action: wrapperAction
        )
    }
    
    // MARK: Toolbar
    private var toolbarDismissButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("button.dismiss") {
                dismiss()
            }
        }
    }
    
    // MARK: - Intents
    private func wrapperAction() {
        if let dismissAction = wrapper.dismissAction {
            dismissAction.action()
            dismiss()
        } else {
            dismiss()
        }
    }
}

#Preview("No Action") {
    ErrorSheet(
        wrapper: ErrorWrapper(
            error: ErrorWrapper.SampleError.sample,
            guidance: "Try again later."
        )
    )
}

#Preview("Sign In") {
    ErrorSheet(
        wrapper: ErrorWrapper(
            error: ErrorWrapper.SampleError.sample,
            guidance: "Sign into your account.",
            dismissAction: ErrorWrapper.ErrorAction(title: "Sign In") {}
        )
    )
}
