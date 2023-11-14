//
//  AppDelegate.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 03/11/2023.
//

import SwiftUI
import Cocoa
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate{
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    let mouseEventListener = MouseEventListener()
    let startHotKey = HotKey(key: .w, modifiers: [.command, .shift])
    let stopHotKey = HotKey(key: .escape, modifiers: [])
    let cursor = NSCursor()
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let colorStore = ColorsStore()
        let contentView = RecentColorsView(colorsStore: colorStore)
        
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        statusBar = StatusBarController.init(popover)
        
        print("will register shortcut")
        
        startHotKey.keyDownHandler = {
            print("Pressed start at \(Date())")
            
            
            self.mouseEventListener.startListening(onColorSelected: colorStore.addColor)
        }
        stopHotKey.keyDownHandler = {
            print("Pressed stop at \(Date())")
            
            self.mouseEventListener.stopListening()
        }
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        mouseEventListener.stopListening()
    }
}
