//
//  ApplicationMenu.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 29/10/2023.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject{
    
    let menu = NSMenu()
    
    func createMenu()->NSMenu{
        let settingsView = SettingsView()
        let topView = NSHostingController(rootView: settingsView)
        topView.view.frame.size = CGSize(width: 125, height: 125)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        return menu;
        
    }
}
