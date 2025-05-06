//
//  NoUserView.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 01/05/2025.
//

import SwiftUI

struct NoUserView: View {
    
    @State private var isShowingSignInSheet = false
    
    var body: some View {
        ZStack {
            AnimatedMeshGradient()
            ScrollView {
                VStack {
                    Spacer(minLength: 100)
                    
                    circleImage
                    
                    TextPrimary(text: "text.signIn.welcome")
                        .padding()
                    
                    Divider()
                    
                    ButtonPrimary(
                        title: "button.signIn",
                        action: { isShowingSignInSheet.toggle() },
                        shadowRadius: 12
                    )
                    .padding(.vertical)
                    
                    TextTertiary(text: "text.signUp.hint")
                }
                .padding()
                .multilineTextAlignment(.center)
                .sheet(isPresented: $isShowingSignInSheet) {
                    SignInSheet()
                }
                .toolbarBackgroundVisibility(.hidden, for: .navigationBar)
            }
            .scrollIndicators(.never)
        }
    }
    
    private var circleImage: some View {
        SampleImage(
            image: .account2,
            width: 160,
            height: 160,
            shadowRadius: 12
        )
        .overlay {
            Circle().stroke(Color.white, lineWidth: 6)
        }
    }
}

#Preview {
    NoUserView()
}
