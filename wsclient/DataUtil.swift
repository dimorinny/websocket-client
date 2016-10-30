//
//  DataUtil.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 30.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

extension Data {
    
    func toString() -> String {
        return String(data: self, encoding: .utf8)!
    }
}
