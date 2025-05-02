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
                    circleImage
                    
                    TextPrimary(text: "text.signIn.welcome")
                        .padding()
                    
                    Divider()
                    
                    ButtonPrimary(
                        title: "button.signIn",
                        action: { isShowingSignInSheet.toggle() },
                        shadowRadius: 12
                    )
                    .padding()
                    
                    TextTertiary(text: "text.signUp.hint")
                }
                .offset(y: 200)
                .multilineTextAlignment(.center)
                .sheet(isPresented: $isShowingSignInSheet) {
                    SignInSheet()
                }
                .toolbarBackgroundVisibility(.hidden, for: .navigationBar)
            }
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
        .offset(y: -100)
        .padding(.bottom, -100)
    }
}

#Preview {
    NoUserView()
}
