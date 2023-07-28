//
//  NewMessageViewModel.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 27.07.23.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task {try await fetchUsers()}
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        self.users = try await UserService.fetchAllUsers().filter({ $0.id != currentUid })
    }
}
