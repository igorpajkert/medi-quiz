//
//  DatabaseController.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 25/02/2025.
//

import Foundation
import FirebaseFirestore

final class DatabaseController {
    
    /// Retrieves a single document of type `T` from the specified Firestore collection.
    func getData<T: Codable>(from document: String, within collection: String) async throws -> T {
        try await Firestore.firestore()
            .collection(collection)
            .document(document)
            .getDocument(as: T.self)
    }
    
    /// Retrieves all documents of type `T` from the specified Firestore collection.
    func getAllDocuments<T: Codable>(from collection: String) async throws -> [T] {
        let querySnapshot = try await Firestore.firestore().collection(collection).getDocuments()
        return try querySnapshot.documents.map { try $0.data(as: T.self) }
    }
}
