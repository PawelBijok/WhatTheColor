//
//  RecentColorsView.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 05/11/2023.
//

import Foundation
import SwiftUI


struct RecentColorsView: View {
    
    @State private var colors = [Color.red, Color.pink, Color.green]
    
    
    func addColor()->Void{
        colors.insert(Color.orange, at: 0)
    }
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(colors, id: \.self) { color in
                        ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color)
                                .frame(width: 100, height: 100)
                            Text("color")
                        }
                        
                    }
                    
                }.padding(10)
            }
            Button(action: addColor){
                Text("Add color")
            }
        }
    }
}
