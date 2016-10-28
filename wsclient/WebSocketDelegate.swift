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
            print("socket connect")
        }
        
        func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
            print("socket disconnect")
        }
        
        func websocketDidReceiveMessage(socket: WebSocket, text: String) {
            print("qwe")
            log.append(string: "\\n")
            log.append(string: text)
        }
        
        func websocketDidReceiveData(socket: WebSocket, data: Data) {
            log.append(string: "\n")
            log.append(data: data)
        }
    }
