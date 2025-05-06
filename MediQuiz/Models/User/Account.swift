//
//  Account.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 11/04/2025.
//

import Foundation

struct Account {
    var name = ""
    var email = ""
    var password = ""
    var passwordConfirmation = ""
    
    var isCredentialsEmpty: Bool {
        name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordConfirmation.isEmpty
    }
    
    var isPasswordMatching: Bool {
        password == passwordConfirmation
    }
    
    var isCredentialsValid: Bool {
        !isCredentialsEmpty && isPasswordMatching
    }
    
    mutating func clear() {
        name = ""
        email = ""
        password = ""
        passwordConfirmation = ""
    }
}
