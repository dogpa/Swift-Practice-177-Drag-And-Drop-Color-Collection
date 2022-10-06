//
//  AddColorView.swift
//  Swift Practice 177 Drag And Drop Color Collection
//
//  Created by Dogpa's MBAir M1 on 2022/10/5.
//

import SwiftUI

struct AddColorView: View {
    //接共用的ViewModel
    @StateObject var colorVM: ColorViewModel
    
    //action在外面ContentView執行切換頁面使用
    let action: () -> Void
    
    //三原色slider Binding的值
    @State var redValue = 0.3
    @State var greenValue = 0.3
    @State var blueValue = 0.3
    
    //輸入值的
    @State var inputColorStr = ""
    var body: some View {
        VStack {
            
            //輸入顏色的字串
            HStack {
                TextField("顏色別稱", text: $inputColorStr)
            }.textFieldStyle(.automatic)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 3)
                )
                .padding(.horizontal)
            ZStack {
                Color(red: redValue*255/255, green: greenValue*255/255, blue: blueValue*255/255)
            }
            .frame(width: 200, height: 200, alignment: .center)
            .cornerRadius(100)
            
            //RGB紅色值的Slider
            Slider(value: $redValue, in: 0...1)
                .padding()
                .tint(.red)
            
            //RGB率色值的Slider
            Slider(value: $greenValue, in: 0...1)
                .padding()
                .tint(.green)
            
            //RGB藍色值的Slider
            Slider(value: $blueValue, in: 0...1)
                .padding()
                .tint(.blue)
            
            //執行新增顏色的Button
            Button {
                colorVM.addNewColor(colorStr: inputColorStr, colorSet: Color(red: redValue*255/255, green: greenValue*255/255, blue: blueValue*255/255))
                action()
                
            } label: {
                Text("建立新設定顏色")
                    .frame(width: 300, height: 60, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(30)
                    
            }
            Spacer(minLength: 30)
        }
    }
}

struct AddColorView_Previews: PreviewProvider {
    static var previews: some View {
        AddColorView(colorVM: ColorViewModel(), action: {})
    }
}
