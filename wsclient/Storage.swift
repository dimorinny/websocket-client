//
//  HeadersStorage.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 28.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation

class Storage<T : NSCoding> {
    
    private let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func loadData() -> [T]? {
        let data = UserDefaults.standard.value(forKey: key) as? Data
        
        if (data != nil) {
            return NSKeyedUnarchiver.unarchiveObject(with: data!) as? [T]
        }
        
        return nil
    }
    
    func saveData(_ headers: [T]) {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: headers), forKey: key)
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
