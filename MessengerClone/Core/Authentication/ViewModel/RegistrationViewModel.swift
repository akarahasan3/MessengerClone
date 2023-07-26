//
//  RegistrationViewModel.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 26.07.23.
//

import SwiftUI

class RegistrationViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
}
