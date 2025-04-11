//
//  ErrorSheet.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct ErrorSheet: View {
    
    @Environment(\.dismiss) var dismiss
    
    let wrapper: ErrorWrapper
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                imageError
                textError
                Divider()
                TextSecondary(text: wrapper.guidance)
                TextTertiary(text: "text.errorSheet.contactSupport")
                ButtonPrimary(title: wrapper.action?.title ?? "button.dismiss") {
                    wrapper.action?.action()
                    dismiss()
                }
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
    
    private var imageError: some View {
        Image(systemName: "xmark.circle")
            .font(.title)
            .imageScale(.large)
            .foregroundStyle(.red)
    }
    
    private var textError: some View {
        Text(wrapper.error.localizedDescription)
            .font(.headline)
    }
}

#Preview {
    ErrorSheet(
        wrapper: ErrorWrapper(
            error: ErrorWrapper.SampleError.sample,
            guidance: "Try again later."
        )
    )
}
