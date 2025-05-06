//
//  ModeHost.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 06/05/2025.
//

import SwiftUI

struct ModeHost: View {
    
    var mode: Mode
    
    var body: some View {
        switch mode {
        case .main:
            MainModeHost()
        case .swipe:
            SwipeModeHost()
        }
    }
}

#Preview {
    ModeHost(mode: .main)
}
