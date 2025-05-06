//
//  ModeCard.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 06/05/2025.
//

import SwiftUI

struct ModeCard: View {
    
    @Environment(\.colorScheme) private var scheme
    
    let name: String
    let image: Image
    
    private var background: AnyGradient {
        scheme == .dark ? Color.black.gradient : Color.white.gradient
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 32))
            
            Text(name)
                .font(.title)
                .padding()
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 42)
                .foregroundStyle(background)
        }
        .padding()
        .containerRelativeFrame(.horizontal)
    }
}

#Preview {
    ModeCard(name: "Main Mode", image: .init(.account))
}
