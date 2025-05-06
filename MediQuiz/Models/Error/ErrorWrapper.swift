//
//  ErrorWrapper.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import SwiftUI

/// A struct that wraps an `Error` with contextual guidance and an optional action.
struct ErrorWrapper: Identifiable {
    
    /// A unique identifier for this error wrapper instance.
    let id: UUID
    /// The underlying error being wrapped.
    let error: Error
    /// A user-friendly message or guidance on how to handle the error.
    let guidance: LocalizedStringKey
    /// An optional action to perform when the error is dismissed.
    let action: ErrorAction?
    
    /// Creates a new `ErrorWrapper` instance.
    init(id: UUID = UUID(),
         error: Error,
         guidance: LocalizedStringKey,
         action: ErrorAction? = nil) {
        self.id = id
        self.error = error
        self.guidance = guidance
        self.action = action
    }
    
    /// An action that may be performed when dismissing an error.
    struct ErrorAction {
        /// A user‐friendly title describing the action.
        let title: LocalizedStringKey
        /// The closure that performs the action.
        let action: () -> Void
    }
}

extension ErrorWrapper {
    /// A collection of sample errors used for demonstration or testing purposes.
    enum SampleError: Error {
        case sample
    }
}
