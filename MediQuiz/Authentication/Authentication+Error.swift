//
//  Authentication+Error.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 25/02/2025.
//

import Foundation

extension Authentication {
    
    enum AuthError: Error, LocalizedError {
        
        case noUserFound
        
        var errorDescription: String? {
            switch self {
            case .noUserFound:
                return String(localized: "error.noUserFound")
            }
        }
    }
}
