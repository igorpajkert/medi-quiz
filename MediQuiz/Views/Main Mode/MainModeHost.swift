//
//  MainModeHost.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 06/05/2025.
//

import SwiftUI

struct MainModeHost: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.mainMode) private var mainMode
    
    var body: some View {
        CategoriesView()
            .sheet(item: $errorWrapper) { wrapper in
                ErrorSheet(wrapper: wrapper)
            }
            .task {
                await fetchData()
            }
    }
    
    // MARK: - Intents
    private func fetchData() async {
        do {
            try await mainMode.fetchData()
        } catch {
            errorWrapper = .init(
                error: error,
                guidance: "guidance.faildedToFetchData"
            )
        }
    }
}

#Preview {
    MainModeHost()
        .environment(\.mainMode, MainMode())
}
