//
//  Messages.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 30.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

protocol MessagesUpdateDelegate {
    func messageUpdated(messages: String)
}

class Messages {
    
    var messages: [Message] = []
    var delegate: MessagesUpdateDelegate? = nil
    
    func addMessage(message: Message) {
        messages.append(message)
        delegate?.messageUpdated(messages: allMessagesValue())
    }
    
    private func allMessagesValue() -> String {
        return messages.map({ (message: Message) -> String in
            return message.getMessageText()
        }).joined(separator: "\n")
    }
}
