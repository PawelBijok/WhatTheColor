//
//  AppDelegate.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 03/11/2023.
//

import SwiftUI
import Cocoa


class AppDelegate: NSObject, NSApplicationDelegate{
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    let mouseEventListener = MouseEventListener()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
            let contentView = RecentColorsView()

            popover.contentSize = NSSize(width: 250, height: 500)
            popover.contentViewController = NSHostingController(rootView: contentView)
            
            statusBar = StatusBarController.init(popover)
            mouseEventListener.startListening()
        }

        func applicationWillTerminate(_ aNotification: Notification) {
            mouseEventListener.stopListening()
        }
}
