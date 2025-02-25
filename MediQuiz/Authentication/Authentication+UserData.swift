//
//  Authentication+UserData.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 25/02/2025.
//

import Foundation

extension Authentication {
    
    func fetchUserData() async throws -> UserData? {
        guard let user = user else { throw AuthError.noUserFound }
        return try await DatabaseController()
            .getData(from: user.uid, within: "user_data")
    }
}
