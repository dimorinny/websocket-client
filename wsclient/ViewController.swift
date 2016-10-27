//
//  ViewController.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//


import Cocoa
import Starscream

class ViewController: NSViewController {
    
    static let plusSegment = 0
    static let minusSegment = 1
    
    static let rowUnselected = -1
    
    @IBOutlet weak var table: NSTableView!
    @IBOutlet weak var url: NSTextField!
    @IBOutlet weak var log: NSScrollView!
    @IBOutlet weak var headersActions: NSSegmentedCell!
    
    var headers: [Header] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headers.append(Header(name: "Origin", value: "avito.ru"))
        headers.append(Header(name: "Origin1", value: "avito.ru"))
        headers.append(Header(name: "Origin2", value: "avito.ru"))
        headers.append(Header(name: "Origin3", value: "avito.ru"))
        
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func onHeadersAction(_ sender: NSSegmentedCell) {
        switch sender.selectedSegment {
            
        case ViewController.plusSegment:
            headers.append(Header())
            table.reloadData()
            table.editColumn(ViewController.plusSegment, row: headers.count - 1, with: nil, select: true)
            
        case ViewController.minusSegment:
            if (table.selectedRow != ViewController.rowUnselected) {
                headers.removeAtIndices(set: table.selectedRowIndexes)
                table.reloadData()
            }
            
        default: ()
        }
    }

    @IBAction func onConnectButton(_ sender: NSButton) {
        print(headers[0].name)
    }

    @IBAction func onConnectTextField(_ sender: NSTextField) {
    }
    
    @IBAction func onSendData(_ sender: NSTextField) {
    }
}

