//
//  ViewController.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 10/11/2023.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register for key events
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) {
            return self.handleKeyEvent($0)
        }
    }

    func handleKeyEvent(_ event: NSEvent) -> NSEvent? {
        // Check for the specific key combination you are interested in
        if event.modifierFlags.contains(.command), event.charactersIgnoringModifiers == "S" {
            // Perform your action for the Command + S shortcut
            print("Command + S pressed")
            return nil  // Returning nil prevents the event from being passed to the next responder
        }

        // Add more shortcut checks as needed

        // If the key event doesn't match any shortcuts you are handling, pass it to the next responder
        return event
    }
}
