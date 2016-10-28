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
    
    @nonobjc static let nameIdentifier = "HeaderName"
    @nonobjc static let valueIdentifier = "HeaderValue"
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var text: String = ""
        var cellIdentifier: String = ""
        
        if (tableColumn == table.tableColumns[TableColumn.name.rawValue]) {
            text = model.headers[row].name
            cellIdentifier = ViewController.nameIdentifier
        } else if (tableColumn == table.tableColumns[TableColumn.value.rawValue]) {
            text = model.headers[row].value
            cellIdentifier = ViewController.valueIdentifier
        }
        
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        
        return nil
    }
}
