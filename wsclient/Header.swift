//
//  Header.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

class Header : NSObject, NSCoding {
    
    private static let nameKey = "name"
    private static let valueKey = "value"
    
    var name, value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    override init() {
        self.name = ""
        self.value = ""
        
        super.init()
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Header.nameKey)
        aCoder.encode(value, forKey: Header.valueKey)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: Header.nameKey) as! String
        self.value = aDecoder.decodeObject(forKey: Header.valueKey) as! String
    }
}
