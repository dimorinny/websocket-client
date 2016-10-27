//
//  HeadersTableDelegate.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController : NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cell = tableView.make(withIdentifier: "CellLol", owner: nil)
        let casted = cell as? NSTableCellView
        
        if casted != nil {
            casted?.textField?.stringValue = headers[row].name
            return casted
        }
        
        return nil
    }
}
