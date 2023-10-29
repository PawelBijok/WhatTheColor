//
//  WhatTheColorApp.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 29/10/2023.
//

import SwiftUI

@main
struct WhatTheColorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings{
            EmptyView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate{
    var popover = NSPopover.init()
    var statusBar: StatusBarController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
            // Create the SwiftUI view that provides the contents
            let contentView = SettingsView()

            // Set the SwiftUI's ContentView to the Popover's ContentViewController
            popover.contentSize = NSSize(width: 10, height: 360)
            popover.contentViewController = NSHostingController(rootView: contentView)
            
            // Create the Status Bar Item with the above Popover
            statusBar = StatusBarController.init(popover)
        }

        func applicationWillTerminate(_ aNotification: Notification) {
            // Insert code here to tear down your application
        }
}
