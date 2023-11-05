//
//  ColorExtenions.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 05/11/2023.
//

import Foundation
import SwiftUI


extension NSColor {
    var asHexadecimal: String {
        let redHex = self.colorPartToHex(number: self.redComponent)
        let greenHex = self.colorPartToHex(number: self.greenComponent)
        let blueHex = self.colorPartToHex(number: self.blueComponent)
        return "#\(redHex)\(greenHex)\(blueHex)"
    }
    
    
    private func colorPartToHex(number: CGFloat)-> String{
        return String(Int(number * 255), radix: 16)
    }
    
}
