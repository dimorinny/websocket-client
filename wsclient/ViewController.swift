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
    
    private static let headersStorageKey = "headersStorageKey"
    
    // TODO: enum
    static let nameColumn = 0
    static let valueColumn = 1
    
    // TODO: enum
    static let plusSegment = 0
    static let minusSegment = 1
    
    static let rowUnselected = -1
    
    @IBOutlet weak var table: NSTableView!
    @IBOutlet weak var url: NSTextField!
    @IBOutlet weak var log: NSScrollView!
    @IBOutlet weak var headersActions: NSSegmentedCell!
    
    let headersStorage: Storage<Header> = Storage(key: headersStorageKey)
    
    var headers: [Header] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: remove it
        headers.append(Header(name: "Origin", value: "aviwqeto.ru"))
        headers.append(Header(name: "Origin1", value: "aviqwto.ru"))
        headers.append(Header(name: "Origin2", value: "avieqwto.ru"))
        headers.append(Header(name: "Origin3", value: "avieto.ru"))
        
        // TODO: remove it
        headersStorage.saveData(headers)
        
        table.delegate = self
        table.dataSource = self
    }
    
    private func saveAndReloadHeaders() {
        
    }
    
    @IBAction func onHeaderNameInput(_ sender: NSTextField) {
        let selectedRow = table.selectedRow
        headers[selectedRow].name = sender.stringValue
        table.editColumn(ViewController.valueColumn, row: selectedRow, with: nil, select: true)
    }
    
    @IBAction func onHeaderValueInput(_ sender: NSTextField) {
        headers[table.selectedRow].value = sender.stringValue
    }
    
    @IBAction func onHeadersAction(_ sender: NSSegmentedCell) {
        switch sender.selectedSegment {
            
        case ViewController.plusSegment:
            headers.append(Header())
            table.reloadData()
            table.selectRowIndexes(IndexSet([headers.count - 1]), byExtendingSelection: true)
            table.editColumn(ViewController.nameColumn, row: headers.count - 1, with: nil, select: true)
            
        case ViewController.minusSegment:
            if (table.selectedRow != ViewController.rowUnselected) {
                headers.removeAtIndices(set: table.selectedRowIndexes)
                table.reloadData()
            }
            
        default: ()
        }
    }

    @IBAction func onConnectButton(_ sender: NSButton) {
        print(headersStorage.loadData())
    }

    @IBAction func onConnectTextField(_ sender: NSTextField) {
    }
    
    @IBAction func onSendData(_ sender: NSTextField) {
    }
}

