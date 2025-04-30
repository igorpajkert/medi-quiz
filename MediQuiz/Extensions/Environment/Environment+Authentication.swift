//
//  Environment+Authentication.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import SwiftUI

extension EnvironmentValues {
    /// A `Authentication` object stored in the environment.
    @Entry var auth = Authentication()
}

extension View {
    /// Injects the given `DataStore` instance into the SwiftUI environment.
    func auth(_ authentication: Authentication) -> some View {
        environment(\.auth, authentication)
    }
}
