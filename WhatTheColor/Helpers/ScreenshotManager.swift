//
//  ScreenshotManager.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 13/10/2024.
//

import ScreenCaptureKit
class ScreenshotManager {
    
    init() {
        //TODO: add more displays support
        initializeDisplay()
    }
    
    var display:SCDisplay?
    
    func getScreenshot() async -> CGImage?{
        if(self.display == nil){
            return nil
        }
        
        let myContentFilter = SCContentFilter(display: display!, excludingApplications: [], exceptingWindows: [])
        
        let myConfiguration = SCStreamConfiguration()
        //TODO: assign to actuall screen size
        myConfiguration.width = 3456
        myConfiguration.height = 2234
        myConfiguration.showsCursor = false
        
        if let sc = try? await SCScreenshotManager.captureImage(contentFilter: myContentFilter, configuration: myConfiguration) {
            return sc
        }
        return nil
        
        
    }
    
    func getColorAtMouseLocation(mouseX:Float, mouseY:Float) async -> NSColor?  {
        let screenshot = await self.getScreenshot()
        if(screenshot == nil){
            return nil
        }
        
        if let screen = NSScreen.main {
            let frame = screen.frame
            let scaling = Float(screen.backingScaleFactor);
            
            let screenShotX = Int(mouseX * scaling - 1)
            let screenShotY = Int((Float(frame.height) - mouseY) * scaling - 1)
            
            let bitmapRep = NSBitmapImageRep(cgImage: screenshot!)
            if screenShotX < bitmapRep.pixelsWide && screenShotY < bitmapRep.pixelsHigh {
                if let color = bitmapRep.colorAt(x: screenShotX, y: screenShotY){
                    return color
                }
            }
        }
        return nil
    }
    
    private
    func initializeDisplay()->Void{
        SCShareableContent.getExcludingDesktopWindows(false, onScreenWindowsOnly: false) { shareableContent, error in
            if let error = error {
                print("Error retrieving shareable content: \(error)")
                self.display = nil
                return
            }
            self.display = shareableContent?.displays.first
        }
    }
}

