//
//  AnimatedMeshGradient.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 02/05/2025.
//

import SwiftUI

struct AnimatedMeshGradient: View {
    
    @State private var firstWave = false
    @State private var secondWave = false
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                [0.0, 0.5], firstWave ? [0.5, 0.5] : [0.8, 0.2], [1.0, 0.5],
                [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
            ],
            colors: [
                secondWave ? .lightLavender : .lavender, firstWave ? .lightLavender : .lavender, secondWave ? .accent : .lightLavender,
                secondWave ? .lavender : .accent, .lavender, firstWave ? .accent : .lavender,
                firstWave ? .accent : .darkLavender, secondWave ? .darkLavender : .lavender, firstWave ? .darkLavender : .accent
            ]
        )
        .ignoresSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                firstWave.toggle()
            }
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                secondWave.toggle()
            }
        }
    }
}

#Preview {
    AnimatedMeshGradient()
}
