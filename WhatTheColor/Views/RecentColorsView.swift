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
    let pasteboardManager = PasteboardManager()
    
    
    func onColorClicked(color: NSColor){
        pasteboardManager.write(text: color.asHexadecimal)
    }
    
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    if(self.colorsStore.colors.count == 0){
                        Text("No colors yet").padding(30)
                        
                    }
                    else {
                        
                        
                        ForEach(0..<self.colorsStore.colors.count, id: \.self) { item in
                            let color = self.colorsStore.colors[item]
                            
                            ColorTile(color: color, onClick: onColorClicked)
                        }
                        
                    }
                    
                }.padding(10)
            }
        }
    }
}


struct ColorTile: View {
    let color: NSColor
    let onClick: (NSColor)->Void
    var label: String? = nil
    var disabled: Bool = false
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(nsColor: color))
                .frame(width: 100, height: 100)
            VStack{
                Text("\(label ?? color.asHexadecimal)").foregroundStyle(color.isDark ? Color.white : Color.black).font(.subheadline)
                Button(action: {
                    onClick(color)
                }, label: {
                    Image(systemName: "doc.on.clipboard").foregroundColor(color.isDark ? Color.white : Color.black)
                }).buttonStyle(.borderless)
            }
            
        }
    }
}
