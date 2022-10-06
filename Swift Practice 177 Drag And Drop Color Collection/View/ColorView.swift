//
//  ColorView.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//

import SwiftUI

struct ColorView: View {
    
    //接收Foreach內的顏色
    var colorModel: ColorModel
    
    //於foreach內執行刪除的動作
    let action: () -> Void
    
    
    var body: some View {
        
        ZStack {
            //顯示該顏色與顏色的字串內容
            colorModel.colorRGB
            Text(colorModel.colorStr)
            
            //刪除該顏色的按鈕
            VStack{
                HStack{
                    Spacer()
                    Button {
                        action()
                    } label: {
                        Text("X")
                            .font(Font.system(size: 25))
                                        .frame(width: 30, height: 30)
                                        .background(Color.gray)
                                        .clipShape(Circle())
                                        .offset(x: -5, y: 5)
                    }
                }
                Spacer()
            }
        }
        .cornerRadius(20)
    }
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorView()
//    }
//}
