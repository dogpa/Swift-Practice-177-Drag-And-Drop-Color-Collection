//
//  ContentView.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//

import SwiftUI

struct ContentView: View {
    //建立一個Bool判斷是否跳到新增Color的View
    @State var addNewColor = false
    
    //使用ColorViewModel給ColorCollectionView與AddColorView一起使用
    @StateObject var colorVM = ColorViewModel()
    
    var body: some View {
        
        //如果addNewColor為false不是新增顏色的顏面則顯示顏色的View並可以操作移動
        //如果addNewColor為true則顯示增加新的顏色的View
        if !addNewColor {
            ColorCollectionView(colorVM: colorVM) {
                addNewColor = true
            }
        }else{
            AddColorView(colorVM: colorVM, action: {addNewColor = false})
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
