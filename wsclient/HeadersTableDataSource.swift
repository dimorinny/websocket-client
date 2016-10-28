//
//  HeadersTableDataSource.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController : NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        print(model.headers.count)
        return model.headers.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return model.headers[row]
    }
}
