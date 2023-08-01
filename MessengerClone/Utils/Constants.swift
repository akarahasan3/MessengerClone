//
//  Constants.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 01.08.23.
//

import Foundation
import Firebase

struct FirestoreConstants{
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
