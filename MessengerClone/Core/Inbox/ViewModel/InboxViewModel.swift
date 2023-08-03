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
    @Published var recentMessages = [Message]()
    
    private var cancellables = Set<AnyCancellable>()
    private var service = InboxService()
    
    init() {
        setupSubscribers()
        service.observeRecentMessages()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]){
        var messages = changes.compactMap( { try? $0.document.data(as: Message.self) } )
        
        for i in 0 ..< messages.count{
            UserService.fetchUser(withUid: messages[i].chatPartnerId) { user in
                if let previousMessageIndex = self.recentMessages.firstIndex(where: { $0.user?.uid == messages[i].fromId || $0.user?.uid == messages[i].toId }){
                    messages[i].user = user
                    self.recentMessages[previousMessageIndex] = messages[i]
                } else {
                    messages[i].user = user
                    self.recentMessages.append(messages[i])
                }
            }
        }
    }
}
