//
//  TextViewUtil.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 28.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation
import Cocoa

extension NSTextView {
    
    func append(string: String) {
        self.textStorage?.append(NSAttributedString(string: string))
        self.scrollToEndOfDocument(nil)
    }
    
    func clear() {
        self.textStorage?.mutableString.setString("")
    }
}
