//
//  RecentColorsView.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 05/11/2023.
//

import Foundation
import SwiftUI


struct RecentColorsView: View {
    @ObservedObject var colorsStore: ColorsStore
    
    
    
   
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.colorsStore.colors, id: \.self) { color in
                        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                            ColorTile(color: color)
                        }
                        
                    }
                    
                }.padding(10)
            }
           
        }
    }
}


struct ColorTile: View {
    let color: NSColor
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(nsColor: color))
            .frame(width: 100, height: 100)
        Text("\(color.asHexadecimal)").foregroundStyle(color.isDark ? Color.white : Color.black)
    }
}
