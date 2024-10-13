//
//  ColorsStore.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 10/11/2023.
//

import SwiftUI

class ColorsStore: ObservableObject {
    @Published var colors: [NSColor] = []
    
    func addColor(color: NSColor){
        print("color store add: \(color)")
        if(colors.count > 0 && colors[0] == color){
            return;
        }
        colors.insert(color, at: 0)
    }
    
    func clearColors()
    {
        colors.removeAll()
    }
    


}
