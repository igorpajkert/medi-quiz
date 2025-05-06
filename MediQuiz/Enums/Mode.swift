//
//  Mode.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 06/05/2025.
//

import SwiftUI

enum Mode: String, Identifiable, CaseIterable, Nameable {
    case main = "main"
    case swipe = "swipe"
    
    var id: String {
        rawValue
    }
    
    var name: String {
        switch self {
        case .main:
            String(localized: "name.mainMode")
        case .swipe:
            String(localized: "name.swipeMode")
        }
    }
    
    var image: Image {
        switch self {
        case .main:
                .init(.mainMode)
        case .swipe:
                .init(.swipeMode)
        }
    }
}
