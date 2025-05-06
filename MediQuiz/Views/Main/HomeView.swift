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
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Mode.allCases) { mode in
                        ModeCard(name: mode.name, image: mode.image)
                            .onTapGesture {
                                selectedMode = mode
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .navigationTitle("title.home")
            .navigationBarTitleDisplayMode(.large)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.never)
            .navigationDestination(item: $selectedMode) { mode in
                ModeHost(mode: mode)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
