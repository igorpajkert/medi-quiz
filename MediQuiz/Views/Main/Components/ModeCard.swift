//
//  ModeCard.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 06/05/2025.
//

import SwiftUI

struct ModeCard: View {
    
    @Environment(\.colorScheme) private var scheme
    
    let mode: Mode
    
    var body: some View {
        VStack(alignment: .leading) {
            image
            name
            summary
        }
        .padding(20)
        .background {
            RoundedRectangle(cornerRadius: 52)
                .foregroundStyle(.white.gradient.secondary)
        }
        .containerRelativeFrame(.horizontal)
    }
    
    private var image: some View {
        mode.image
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .shadow(radius: 4)
    }
    
    private var name: some View {
        Text(mode.name)
            .font(.title)
            .bold()
            .padding(.top)
            .padding(.horizontal)
    }
    
    private var summary: some View {
        Text(mode.summary)
            .font(.footnote)
            .lineLimit(3, reservesSpace: true)
            .padding(.horizontal)
    }
}

#Preview {
    ModeCard(mode: .main)
}
