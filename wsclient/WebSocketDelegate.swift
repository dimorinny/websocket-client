//
//  WebSocketDelegate.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 28.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation
import Starscream

extension ViewController : WebSocketDelegate {
    
    func websocketDidConnect(socket: WebSocket) {
        print("Connected")
        model.messages.addMessage(message: ConnectedMessage(url: socket.currentURL.absoluteString))
        applyConnectButtonState(state: ConnectButtonActionState.Disconnect)
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("Origin: " + socket.origin!)
        print(socket.headers)
//        print("socket disconnect")
        print(error.debugDescription)
        model.messages.addMessage(message: DisconnectedMessage(url: socket.currentURL.absoluteString))
        applyConnectButtonState(state: ConnectButtonActionState.Connect)
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("socket receive")
        model.messages.addMessage(message: ResponseMessage(message: text))

    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("socket receive")
        model.messages.addMessage(message: ResponseMessage(message: data.toString()))
    }
}
