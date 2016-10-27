//
//  Header.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

class Header {
    var name, value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    init() {
        self.name = ""
        self.value = ""
    }
}
