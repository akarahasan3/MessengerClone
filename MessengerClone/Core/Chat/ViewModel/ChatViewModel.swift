//
//  ChatViewModel.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 28.07.23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let service: MessageService
    
    init(user: User){
        self.service = MessageService(chatPartner: user)
        observeMessages()
    }
    
    func sendMessage(){
        service.sendMessage(messageText)
    }
    
    func observeMessages(){
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
}
