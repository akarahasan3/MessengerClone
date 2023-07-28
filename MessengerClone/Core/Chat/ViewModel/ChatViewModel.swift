//
//  ChatViewModel.swift
//  MessengerClone
//
//  Created by Ajdin Karahasanovic on 28.07.23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User
    
    init(user: User){
        self.user = user
    }
    
    func sendMessage(){
        MessageService.sendMessage(messageText, toUser: user)
    }
}
