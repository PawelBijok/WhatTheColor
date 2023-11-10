//
//  PasteboardManager.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 10/11/2023.
//

import SwiftUI


struct PasteboardManager{
    let pasteboard = NSPasteboard.general
    
     func write(text:String){
         pasteboard.declareTypes([.string], owner: self)
        pasteboard.setString(text, forType: .string)
    }
}
