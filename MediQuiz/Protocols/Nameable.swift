//
//  Nameable.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation

/// A protocol that requires an entity to have a read-only `name` property.
protocol Nameable {
    /// The name of the conforming entity.
    var name: String { get }
}
