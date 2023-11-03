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

    func applicationDidFinishLaunching(_ aNotification: Notification) {
            
            let contentView = SettingsView()

            
            popover.contentSize = NSSize(width: 900, height: 500)
            popover.contentViewController = NSHostingController(rootView: contentView)
            
            
            
            statusBar = StatusBarController.init(popover)
        }

        func applicationWillTerminate(_ aNotification: Notification) {
            // Insert code here to tear down your application
        }
}
