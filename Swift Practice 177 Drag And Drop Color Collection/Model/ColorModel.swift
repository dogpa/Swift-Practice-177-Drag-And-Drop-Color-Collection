//
//  ColorModel.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//


import SwiftUI

///客制顏色的Struct
struct ColorModel: Identifiable {
    var id = UUID().uuidString
    var colorStr: String
    var colorRGB: Color
}

