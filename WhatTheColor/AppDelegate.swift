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
    let stopHotKey = HotKey(key: .escape, modifiers: [.command])
    var registerNextClick: Bool = false
    let screenshotManager = ScreenshotManager()
    var colorStore: ColorsStore
    
    override
    init() {
        self.colorStore = ColorsStore()
    }
    
    
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = RecentColorsView(colorsStore: colorStore)
        
        popover.contentSize = NSSize(width: 400, height: 500)
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        statusBar = StatusBarController.init(popover)
        
        print("will register shortcut")
        
        func stopListening() {
            print("unregister shortcut")
            startHotKey.keyDownHandler = nil
            stopHotKey.keyDownHandler = nil
        }
        self.mouseEventListener.startListening(onPointClicked: {point in
            print("point: \(point)")
            if(self.registerNextClick){
                self.registerNextClick = false
                self.getAndSaveColorAtPosition(mousePosition: point)
            }
        } )
        
        startHotKey.keyDownHandler = {
            print("Pressed start at \(Date())")
            self.registerNextClick = true
        }
        stopHotKey.keyDownHandler = {
            print("Pressed stop at \(Date())")
            self.registerNextClick = false
            
        }
        
    }
    
    func getAndSaveColorAtPosition(mousePosition: MousePosition)->Void{
        let store = self.colorStore
        Task{
            if let color = await screenshotManager.getColorAtMouseLocation(mouseX: mousePosition.x, mouseY: mousePosition.y) {
                await MainActor.run {
                    store.addColor(color: color)
                   }
            }
        }
        
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        mouseEventListener.stopListening()
    }
}
