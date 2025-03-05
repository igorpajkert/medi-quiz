//
//  UserCredentials.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 04/03/2025.
//

import SwiftUI

struct UserCredentials: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextField("textField.email", text: $email)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(lineWidth: 2)
                }
            SecureField("secureField.password", text: $password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(lineWidth: 2)
                }
        }
        .textInputAutocapitalization(.never)
    }
}
