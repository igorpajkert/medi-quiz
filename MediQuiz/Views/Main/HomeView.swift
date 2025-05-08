//
//  HomeView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 06/05/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedMode: Mode?
    
    var body: some View {
        ZStack {
            PrimaryMeshGradient()
            ScrollView {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(Mode.allCases) { mode in
                            ModeCard(mode: mode)
                                .onTapGesture {
                                    selectedMode = mode
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(30, for: .scrollContent)
                .scrollIndicators(.never)
                .navigationDestination(item: $selectedMode) { mode in
                    ModeHost(mode: mode)
                }
            }
            .navigationTitle("title.home")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackgroundVisibility(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
