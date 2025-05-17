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
    case scenarios = "scenarios"
    case calculations = "calculations"
    
    var id: String {
        rawValue
    }
    
    var name: String {
        switch self {
        case .main:
            String(localized: "name.mainMode")
        case .swipe:
            String(localized: "name.swipeMode")
        case .scenarios:
            String(localized: "name.scenariosMode")
        case .calculations:
            String(localized: "name.calculationsMode")
        }
    }
    
    var image: Image {
        switch self {
        case .main:
                .init(.mainMode)
        case .swipe:
                .init(.swipeMode)
        case .scenarios:
                .init(.scenarios)
        case .calculations:
                .init(.calculations)
        }
    }
    
    var summary: String {
        switch self {
        case .main:
            String(localized: "summary.mainMode")
        case .swipe:
            String(localized: "summary.swipeMode")
        case .scenarios:
            String(localized: "summary.scenariosMode")
        case .calculations:
            String(localized: "summary.calculationsMode")
        }
    }
}
