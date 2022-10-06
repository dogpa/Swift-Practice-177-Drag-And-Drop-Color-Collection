//
//  ColorCollectionView.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//

import SwiftUI

struct ColorCollectionView: View {
    //接收共用的ViewModel
    @StateObject var colorVM: ColorViewModel
    
    //切換頁面的Action用於新增顏色
    let action: () -> Void
    
    //LazyVGrid使用的Array設定兩個一行
    let columns = Array(repeating: GridItem(.flexible(), spacing: 30), count: 2)
   
    var body: some View {
        VStack {
            
            //透過Foreach顯示顏色
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(colorVM.colorArray) { color in
                        ColorView(colorModel: color, action: {
                            
                            //action內找到該顏色在Array內的Index值並呼叫deleteTapColor刪除
                            let tapColorIndex = colorVM.colorArray.firstIndex { (colorModel) -> Bool in
                                return colorModel.colorStr == color.colorStr
                            } ?? 0
                            print(color,tapColorIndex)
                            colorVM.deleteTapColor(colorIndex: tapColorIndex)
                        })
                            .frame(height: 100, alignment: .center)
                        
                            //滑動時將準備拖曳的顏色存入到colorVM.currentColor內
                            .onDrag {
                                colorVM.currentColor = color
                                return NSItemProvider(contentsOf: URL(string: color.id)!)!
                            }
                        
                            //放下時執行DropViewDelegate裡的function替換位置
                            .onDrop(of: [.url], delegate: DropViewDelegate(colorModel: color, colorVM: colorVM))
                    }
                }
            }
            .padding()
            Button {
                //於ContentView切換頁面
                action()
            } label: {
                Text("建立新顏色")
                    
                    .frame(width: 300, height: 60, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(30)
            }
            Spacer(minLength: 30)

        }
    }
}

struct ColorCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCollectionView(colorVM: ColorViewModel() ,action: {})
    }
}
