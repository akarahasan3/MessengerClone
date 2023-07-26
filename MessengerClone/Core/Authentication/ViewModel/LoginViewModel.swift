//
//  LoginViewModel.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 26.07.23.
//

import SwiftUI

class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
