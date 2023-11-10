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
        print("brightness: \(self.brightnessComponent)")
        return "#\(redHex)\(greenHex)\(blueHex)"
    }
    
    var isDark : Bool {
        return self.brightnessComponent < 0.63
    }
    
    
    private func colorPartToHex(number: CGFloat)-> String{
        let part:String = number == 0 ? "00": String(Int(number * 255), radix: 16)
        if(part.count == 1){
            return "0\(part)"
        }
        return part
    }
    
}
