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
                HStack(alignment: .center){
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
    
    @State private var hovering = false
    
    
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
                }).buttonStyle(.bordered).controlSize(.large).opacity(hovering ? 1 : 0).animation(.easeOut(duration: 0.2), value: hovering)
            }
            
        }.onHover(perform: { hovering in
            self.hovering = hovering
        })
    }
}

#Preview(body: {
    ColorTile(color: NSColor(red: 0.2, green: 0.5, blue: 0.8, alpha: 1),onClick: {color in
        print("color")
    }).padding(30)
})
