//
//  UserService.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 26.07.23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self) // decoding to a User object via Firebase
        self.currentUser = user
        print("DEBUG: Current user in service is \(currentUser)")
    }
    
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
