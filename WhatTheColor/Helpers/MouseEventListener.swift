//
//  MouseEventListener.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 03/11/2023.
//


import Cocoa

class MouseEventListener {
    var eventMonitor: Any?
    
    var lastMouseLocation : (Int, Int) = (0,0)
    
    func startListening() {
        let mask: NSEvent.EventTypeMask = [.mouseMoved, .leftMouseDown]
        
     
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask) { event in
            let eventType = event.type
            if(eventType == .leftMouseDown){
                let (x,y) = self.lastMouseLocation
                print("Thats a click on x: \(x) y:\(y)")
                self.getColorAtMouseLocation(mouseX: x, mouseY: y)
            }
            else if (eventType == .mouseMoved){
                let mouseLocation = event.locationInWindow
                print("Mouse moved to: \(mouseLocation)")
                self.lastMouseLocation = (Int(mouseLocation.x), Int(mouseLocation.y))
                
            }
        }
    }
    
    func stopListening() {
        if let eventMonitor = eventMonitor {
            NSEvent.removeMonitor(eventMonitor)
            self.eventMonitor = nil
        }
    }
    
    func getColorAtMouseLocation(mouseX:Int, mouseY:Int) {
        if let screen = NSScreen.main {
            let frame = screen.frame
                            let x = mouseX
                            let y = Int(frame.height) - mouseY

                            if let screenShot = CGDisplayCreateImage(CGMainDisplayID()) {
                                let bitmapRep = NSBitmapImageRep(cgImage: screenShot)
                                if x < bitmapRep.pixelsWide && y < bitmapRep.pixelsHigh {
                                    print (bitmapRep.colorAt(x: x, y: y))
                                }
                            }
        }
    }
}
