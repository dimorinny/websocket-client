//
//  Message.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 30.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

let dateFormat = "2014-01-12 H:mm:ss"

class Message {
    let dateFormatter = DateFormatter()
    let message: String
    let date = Date()
    
    internal init(message: String) {
        self.message = message
        self.dateFormatter.dateFormat = dateFormat
    }
    
    func getMessageText() -> String {
        return "[\(self.dateFormatter.string(from: self.date))] \(self.message)"
    }
}

class SendMessage : Message {
    
    override init(message: String) {
        super.init(message: message)
    }
    
    override func getMessageText() -> String {
        return "[\(self.dateFormatter.string(from: self.date))] Send: \(self.message)"
    }
}

class ResponseMessage : Message {
    
    override init(message: String) {
        super.init(message: message)
    }
    
    override func getMessageText() -> String {
        return "[\(self.dateFormatter.string(from: self.date))] Receive: \(self.message)"
    }
}

class ConnectedMessage : Message {
    
    init(url: String) {
        super.init(message: "Connected to \(url)")
    }
}

class DisconnectedMessage : Message {
    
    init(url: String) {
        super.init(message: "Disconnected from \(url)")
    }
}
