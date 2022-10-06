//
//  DropViewDelegate.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    //接要移動的顏色
    var colorModel: ColorModel
    
    //接共用的ViewModel
    var colorVM: ColorViewModel
    
    //DropDelegate實作Protocol
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    //開始執行的拖移改變位置
    func dropEntered(info: DropInfo) {
        
        print(colorModel.colorStr)
        
        //fromColorIndex為跟現在準備拖移的顏色在Array的原始位置
        let fromColorIndex = colorVM.colorArray.firstIndex { (colorModel) -> Bool in
            return colorModel.colorStr == colorVM.currentColor?.colorStr
        } ?? 0
        print("fromColorIndex:\(fromColorIndex)")
        
        //toColorIndex為準備脫移到的位置的值
        let toColorIndex = colorVM.colorArray.firstIndex { (colorModel) -> Bool in
            return colorModel.colorStr == self.colorModel.colorStr
        } ?? 0
        print("toColorIndex:\(toColorIndex)")
        
        //如果fromColorIndex與toColorIndex不一樣
        //則先取出原本的要移動的顏色
        //將要交換的顏色移動到原本的顏色的位置上
        //再將要移動的顏色放到準備放到的新位置
        if fromColorIndex != toColorIndex {
            withAnimation(.default) {
                let fromColor = colorVM.colorArray[fromColorIndex]
                colorVM.colorArray[fromColorIndex] = colorVM.colorArray[toColorIndex]
                colorVM.colorArray[toColorIndex] = fromColor
            }
        }
    }
}
