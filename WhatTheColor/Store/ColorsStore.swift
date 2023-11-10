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
        colors.insert(color, at: 0)
    }
    


}
