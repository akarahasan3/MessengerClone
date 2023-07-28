//
//  InboxViewModel.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 27.07.23.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject{
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
