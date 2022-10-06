//
//  ColorViewModel.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//


import SwiftUI

final class ColorViewModel: ObservableObject {
    
    //初始的顏色陣列
    @Published var colorArray = [
        ColorModel(colorStr: "紅色", colorRGB: Color(red: 255/255, green: 0/255, blue: 0/255)),
        ColorModel(colorStr: "橙色", colorRGB: Color(red: 255/255, green: 165/255, blue: 0/255)),
        ColorModel(colorStr: "黃色", colorRGB: Color(red: 255/255, green: 255/255, blue: 0/255)),
        ColorModel(colorStr: "綠色", colorRGB: Color(red: 0/255, green: 255/255, blue: 0/255)),
        ColorModel(colorStr: "藍色", colorRGB: Color(red: 0/255, green: 0/255, blue: 255/255)),
        ColorModel(colorStr: "靛色", colorRGB: Color(red: 0/255, green: 127/255, blue: 255/255)),
        ColorModel(colorStr: "紫色", colorRGB: Color(red: 139/255, green: 0/255, blue: 255/255))
    ]
    
    //存入使用者準備拖移的顏色
    @Published var currentColor: ColorModel?
    
    
    /// 刪除使用者選擇的顏色
    /// - Parameters:
    ///   - colorIndex: 指定顏色所在Array的位置
    func deleteTapColor (colorIndex : Int) {
        colorArray.remove(at: colorIndex)
    }
    
    //新增使用者指定的顏色
    
    
    /// 新增使用者選定的顏色與顏色描述字串
    /// - Parameters:
    ///   - colorStr: 顏色的描述字串
    ///   - colorSet: 顏色的RGB值
    func addNewColor(colorStr: String, colorSet: Color) {
        colorArray.append(ColorModel(colorStr: colorStr, colorRGB: colorSet))
    }
}
