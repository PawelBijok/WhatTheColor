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
        WindowGroup{
            SettingsView()
        }
    }
}



