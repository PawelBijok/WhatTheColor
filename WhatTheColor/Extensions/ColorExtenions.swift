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
        print("contrast with white: \(calculateLuminance())")
        return "#\(redHex)\(greenHex)\(blueHex)"
        
    }
    
    var isDark : Bool {
        
        return self.calculateLuminance() < 0.5
    }
    
    private func calculateLuminance() -> Double {
           let r = redComponent <= 0.04045 ? redComponent / 12.92 : pow((redComponent + 0.055) / 1.055, 2.4)
           let g = greenComponent <= 0.04045 ? greenComponent / 12.92 : pow((greenComponent + 0.055) / 1.055, 2.4)
           let b = blueComponent <= 0.04045 ? blueComponent / 12.92 : pow((blueComponent + 0.055) / 1.055, 2.4)
           
           return 0.2126 * r + 0.7152 * g + 0.0722 * b
       }
    
   

    private func colorPartToHex(number: CGFloat)-> String{
        let part:String = number == 0 ? "00": String(Int(number * 255), radix: 16)
        if(part.count == 1){
            return "0\(part)"
        }
        return part
    }
    
    
    
}
