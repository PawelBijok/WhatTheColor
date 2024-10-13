//
//  MouseEventListener.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 03/11/2023.
//


struct MousePosition{
    let x:Float
    let y:Float
}

import Cocoa
import SwiftUI
import ScreenCaptureKit

class MouseEventListener {
    var eventMonitor: Any?
    
    var lastMouseLocation : MousePosition = MousePosition(x: 0, y: 0)
    let screenshotManager = ScreenshotManager()
    
    func startListening( onPointClicked: @escaping (MousePosition)->Void) {
        let mask: NSEvent.EventTypeMask = [.mouseMoved, .leftMouseDown]
        
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask)  { event in
            let eventType = event.type
            if(eventType == .leftMouseDown){
                
                let pos = self.lastMouseLocation;
                onPointClicked(pos)
                
            }
            else if (eventType == .mouseMoved){
                let mouseLocation = event.locationInWindow
                self.lastMouseLocation = MousePosition(x: Float(mouseLocation.x), y: Float(mouseLocation.y))
                
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
