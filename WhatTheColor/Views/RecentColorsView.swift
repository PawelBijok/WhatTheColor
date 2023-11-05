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
        HStack{
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
        }.padding(10)
    }
}
