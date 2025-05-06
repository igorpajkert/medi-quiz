//
//  AccountHost.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 02/05/2025.
//

import SwiftUI

struct AccountHost: View {
    
    @Environment(\.auth) private var auth
    
    var body: some View {
        if auth.isSignIn {
            AccountView()
        } else {
            NoUserView()
        }
    }
}

#Preview {
    AccountHost()
}
