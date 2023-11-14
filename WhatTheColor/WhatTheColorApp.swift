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
            
            
                        ContentView()
                .frame(minWidth: 400, minHeight: 300).onHover(perform: { hovering in
                    if(hovering){
                        NSCursor.crosshair.set()
                        
                    } else {
                        NSCursor.arrow.set()
                    }
                })
                    
            
        }
    }
}


struct ContentView: View {
    var body: some View {
        Text("Hello, Transparent Window!")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(TransparentWindow())
    }
}

struct TransparentWindow: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let hostingController = NSHostingController(rootView: EmptyView())
        let window = TransparentNSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 400, height: 300),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        window.isOpaque = false
        window.backgroundColor = NSColor.clear
        window.contentView = hostingController.view
        window.makeKeyAndOrderFront(nil)
        return hostingController.view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        // Update the NSView if needed
    }
}

class TransparentNSWindow: NSWindow {
    override var canBecomeKey: Bool {
        return true
    }
    
    
}


