//
//  Credentials.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct Credentials: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextFieldPrimary(label: "label.email", text: $email)
            SecureFieldPrimary(label: "label.password", text: $password)
        }
        .textInputAutocapitalization(.never)
    }
}

#Preview {
    Credentials(email: .constant(""), password: .constant(""))
}
