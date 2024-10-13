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
            if(self.colorsStore.colors.count == 0){
                VStack(spacing: 10){
                    
                    Text("No colors selected yet").font(.title)
                    
                    HStack{
                       Text("Use")
                        Text("⌘ + Shift + W").font(.headline)
                        Text("to point at the color")
                    }
                }.padding(30)
            }
            else {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .center){
                        
                        
                        ForEach(0..<self.colorsStore.colors.count, id: \.self) { item in
                            let color = self.colorsStore.colors[item]
                            
                            ColorTile(color: color, onClick: onColorClicked)
                        }
                        Divider().frame(height: 100).padding()
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10).fill(Color(NSColor.red)).frame(width: 100, height: 100)
                            VStack{
                                
                                Button(action: {
                                    colorsStore.clearColors()
                                }, label: {
                                    Image(systemName: "trash.fill").foregroundColor(Color.black)
                                }).buttonStyle(.bordered).controlSize(.large)
                                Text("Delete all").foregroundStyle(Color.black)
                            }
                        }
                        
                        
                        
                    }.padding(10)
                }}
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

struct PreviewView: View {
    @ObservedObject var colorsStore: ColorsStore
    init(colorsStore: ColorsStore) {
        self.colorsStore = colorsStore
//        colorsStore.addColor(color: NSColor.yellow)
    }
    var body: some View {
        RecentColorsView(colorsStore: colorsStore)
    }
}

#Preview(body: {
    PreviewView(colorsStore: ColorsStore())
})
