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
    
    @IBAction func lol(_ sender: NSSegmentedCell) {
        print(sender.selectedSegment)
    }
    @IBAction func onConnectButton(_ sender: NSButton) {
        headers.append(Header(name: "Origin", value: "avito.ru"))
        table.reloadData()
        table.editColumn(0, row: headers.count - 1, with: nil, select: true)
    }

    @IBAction func onConnectTextField(_ sender: NSTextField) {
    }
    
    @IBAction func onSendData(_ sender: NSTextField) {
    }
}

