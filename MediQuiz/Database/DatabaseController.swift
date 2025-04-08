//
//  DatabaseController.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 08/04/2025.
//

import Foundation
import FirebaseFirestore

struct DatabaseController {
    
    /// Retrieves a single document of type `T` from the specified Firestore collection.
    func getDocument<T: Codable>(_ document: String, within collection: String) async throws -> T {
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
    
    /// Sets data of a specified type into a document within a collection in Firestore synchronously.
    func set<T: Codable>(_ data: T, in document: String, within collection: String, merge: Bool = true) throws {
        let db = Firestore.firestore()
        try db.collection(collection).document(document).setData(from: data, merge: merge)
    }
    
    /// Deletes a Firestore document from a specified collection.
    func delete(_ document: String, within collection: String) async throws {
        let database = Firestore.firestore()
        try await database.collection(collection).document(document).delete()
    }
}
