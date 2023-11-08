//
//  RecentColorsView.swift
//  WhatTheColor
//
//  Created by Paweł Bijok on 05/11/2023.
//

import Foundation
import SwiftUI


struct RecentColorsView: View {
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                
            }.padding(10)
        }
    }
}
