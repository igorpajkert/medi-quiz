//
//  MeshGradients.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 02/05/2025.
//

import SwiftUI

struct PrimaryMeshGradient: View {
    
    @State private var wave1 = false
    @State private var wave2 = false
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 4,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                [0.0, wave1 ? 0.2 : 0.4], [wave2 ? 0.4 : 0.6, wave1 ? 0.2 : 0.4], [1.0, wave2 ? 0.2 : 0.4],
                [0.0, wave2 ? 0.5 : 0.7], [wave1 ? 0.4 : 0.6, wave2 ? 0.5 : 0.7], [1.0, wave1 ? 0.5 : 0.7],
                [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
            ],
            colors: [
                .lightLavender, .lightLavender, .lightLavender,
                .lavender, .lavender, .lavender,
                .darkLavender, .darkLavender, .darkLavender,
                .accent, .accent, .accent
            ],
            background: .accent,
            smoothsColors: true
        )
        .ignoresSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                wave1.toggle()
            }
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                wave2.toggle()
            }
        }
    }
}

#Preview("Primary") {
    PrimaryMeshGradient()
}

struct BorderMeshGradient: View {
    
    @State private var wave1 = false
    @State private var wave2 = false
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                [0.0, 0.5], wave1 ? [0.5, 0.5] : [0.8, 0.2], [1.0, 0.5],
                [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
            ],
            colors: [
                wave2 ? .lightLavender : .lavender, wave1 ? .lightLavender : .lavender, wave2 ? .lavender : .lightLavender,
                wave1 ? .lavender : .accent, .lavender, wave2 ? .accent : .lavender,
                wave1 ? .accent : .darkLavender, wave2 ? .accent : .darkLavender, wave1 ? .darkLavender : .accent
            ]
        )
        .ignoresSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                wave1.toggle()
            }
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                wave2.toggle()
            }
        }
    }
}

#Preview("Border") {
    BorderMeshGradient()
}
