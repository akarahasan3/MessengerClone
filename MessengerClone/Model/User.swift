//
//  User.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 25.07.23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable{
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    let profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
}

extension User{
    static let MOCK_USER = User(fullName: "KARA JEDINI", email: "batman@gmail.com", profileImageUrl: "batman")
}
