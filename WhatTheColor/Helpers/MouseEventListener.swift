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

class MouseEventListener {
    var eventMonitor: Any?
    
    var lastMouseLocation : MousePosition = MousePosition(x: 0, y: 0)
    
    func startListening() {
        let mask: NSEvent.EventTypeMask = [.mouseMoved, .leftMouseDown]
        
        
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask) { event in
            let eventType = event.type
            if(eventType == .leftMouseDown){
                
                print("Thats a click on x: \(self.lastMouseLocation.x) y:\(self.lastMouseLocation.y)")
                let pos = self.lastMouseLocation;
                let color = self.getColorAtMouseLocation(mouseX: pos.x, mouseY: pos.y)
                print(color?.asHexadecimal ?? "no color")
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
    
    func getColorAtMouseLocation(mouseX:Float, mouseY:Float) -> NSColor? {
        if let screen = NSScreen.main {
            let frame = screen.frame
            let scaling = Float(screen.backingScaleFactor);
            
            let screenShotX = Int(mouseX * scaling)
            let screenShotY = Int((Float(frame.height) - mouseY) * scaling)
            
            if let screenShot = CGDisplayCreateImage(CGMainDisplayID()) {
                let bitmapRep = NSBitmapImageRep(cgImage: screenShot)
                if screenShotX < bitmapRep.pixelsWide && screenShotY < bitmapRep.pixelsHigh {
                    if let color = bitmapRep.colorAt(x: screenShotX, y: screenShotY){
                        return color
                    }
                    
                }
            }
            
        }
        return nil
    }
}
