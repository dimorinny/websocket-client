//
//  ViewController.swift
//  wsclient
//
//  Created by Меркурьев Дмитрий on 27.10.16.
//  Copyright © 2016 &nbsp;. All rights reserved.
//


import Cocoa
import Starscream

enum ActionSegment : Int {
    case plus, minus
}

enum TableColumn : Int {
    case name, value
}

class ViewController : NSViewController, MessagesUpdateDelegate {
    
    private static let headersStorageKey = "headersStorageKey"
    
    static let rowUnselected = -1
    
    @IBOutlet weak var table: NSTableView!
    @IBOutlet weak var url: NSTextField!
    @IBOutlet weak var headersActions: NSSegmentedCell!
    @IBOutlet weak var connectionActionButton: NSButtonCell!
    @IBOutlet var log: NSTextView!
    
    let headersStorage: Storage<Header> = Storage(key: headersStorageKey)
    var socket: WebSocket? = nil
    
    let model: MainScreenModel = MainScreenModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: remove it
        model.headers.append(Header(name: "Origin", value: "aviwqeto.ru"))
        model.headers.append(Header(name: "Origin1", value: "aviqwto.ru"))
        model.headers.append(Header(name: "Origin2", value: "avieqwto.ru"))
        model.headers.append(Header(name: "Origin3", value: "avieto.ru"))
        
        // TODO: remove it
        headersStorage.saveData(model.headers)
        
        table.delegate = self
        table.dataSource = self
        model.messages.delegate = self
    }
    
    func saveAndReloadHeaders() {
        table.reloadData()
        headersStorage.saveData(model.headers)
    }
    
    func applyConnectButtonState(state: ConnectButtonActionState) {
        model.connectButtonState = state
        connectionActionButton.title = state.rawValue
    }
    
    func connect() {
        switch model.connectButtonState {
            
        case .Connect:
            if (!url.stringValue.isEmpty) {
                socket = WebSocket(url: URL(string: url.stringValue)!)
                socket?.delegate = self
                socket?.connect()
            }
            
        case .Disconnect:
            applyConnectButtonState(state: ConnectButtonActionState.Connect)
            socket?.disconnect()
            
        default:
            ()
        }
    }
    
    func messageUpdated(messages: String) {
        log.clear()
        log.append(string: messages)
    }
    
    @IBAction func onHeaderNameInput(_ sender: NSTextField) {
        let selectedRow = table.selectedRow
        model.headers[selectedRow].name = sender.stringValue
        table.editColumn(TableColumn.value.rawValue, row: selectedRow, with: nil, select: true)
    }
    
    @IBAction func onHeaderValueInput(_ sender: NSTextField) {
        model.headers[table.selectedRow].value = sender.stringValue
    }
    
    @IBAction func onHeadersAction(_ sender: NSSegmentedCell) {
        let segment = ActionSegment.init(rawValue: sender.selectedSegment)!
        
        switch segment {

        case .plus:
            model.headers.append(Header())
            saveAndReloadHeaders()
            table.selectRowIndexes(IndexSet([model.headers.count - 1]), byExtendingSelection: true)
            table.editColumn(TableColumn.name.rawValue, row: model.headers.count - 1, with: nil, select: true)
            
        case .minus:
            if (table.selectedRow != ViewController.rowUnselected) {
                model.headers.removeAtIndices(set: table.selectedRowIndexes)
                saveAndReloadHeaders()
            }
        }
    }

    @IBAction func onConnectButton(_ sender: NSButton) {
        connect()
    }

    @IBAction func onConnectTextField(_ sender: NSTextField) {
        connect()
    }
    
    @IBAction func onSendData(_ sender: NSTextField) {
        if (!sender.stringValue.isEmpty &&
            socket != nil &&
            (socket?.isConnected)!) {
            socket?.write(string: sender.stringValue)
            model.messages.addMessage(message: SendMessage(message: sender.stringValue))
        }
    }
}

