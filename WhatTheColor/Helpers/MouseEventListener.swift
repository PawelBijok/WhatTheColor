//
//  MouseEventListener.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 03/11/2023.
//


import Cocoa

class MouseEventListener {
    var eventMonitor: Any?
    
    func startListening() {
        let mask: NSEvent.EventTypeMask = [.mouseMoved, .leftMouseDown]
        
     
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask) { event in
            let eventType = event.type
            if(eventType == .leftMouseDown){
                print("Thats a click")
            }
            else if (eventType == .mouseMoved){
                let mouseLocation = event.locationInWindow
                print("Mouse moved to: \(mouseLocation)")
            }
        }
    }
    
    func stopListening() {
        if let eventMonitor = eventMonitor {
            NSEvent.removeMonitor(eventMonitor)
            self.eventMonitor = nil
        }
    }
}
