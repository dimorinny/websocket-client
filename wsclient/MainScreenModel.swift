//
//  MainScreenModel.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 29.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

enum ConnectButtonActionState : String {
    case Connect = "Connect"
    case Cancel = "Cancel"
    case Disconnect = "Disconnect"
}

class MainScreenModel {
    var headers: [Header] = []
    var connectButtonState: ConnectButtonActionState = ConnectButtonActionState.Connect
}
