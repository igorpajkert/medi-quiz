//
//  Environment+MainMode.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 07/05/2025.
//

import SwiftUI

extension EnvironmentValues {
    /// A `MainMode` object stored in the environment.
    @Entry var mainMode = MainMode()
}

extension View {
    /// Injects the given `MainMode` instance into the SwiftUI environment.
    func mainMode(_ mainMode: MainMode) -> some View {
        environment(\.mainMode, mainMode)
    }
}
