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

class MouseEventListener {
    var eventMonitor: Any?
    
    var lastMouseLocation : MousePosition = MousePosition(x: 0, y: 0)
    
    func startListening( onColorSelected: @escaping (NSColor)->Void) {
        let mask: NSEvent.EventTypeMask = [.mouseMoved, .leftMouseDown]
        
        
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask) { event in
            let eventType = event.type
            if(eventType == .leftMouseDown){
                
               
                let pos = self.lastMouseLocation;
                if let nsColor = self.getColorAtMouseLocation(mouseX: pos.x, mouseY: pos.y) {
                    
                    onColorSelected(nsColor)
                    
                }
                
                
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
