//
//  sktrTo_DoVIew.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/9/30.
//

import Foundation
import SwiftUI

struct sktrTo_DoListView: View {
    
    @State private var newTo_DoObject:String = "";
    @StateObject private var newTo_DoList = sktrTo_DoList(To_DoList:[]);
    
    var body: some View {
        VStack {
            List {
                ForEach(newTo_DoList.To_DoList){ object in
                    HStack{
                        VStack{
                            HStack{
                                // 字符串拼接，之前已有使用
                                Text("\(object.heading)")
                                Spacer()
                            }
                            HStack{
                                Text("\(object.scheduledToCompleteAt)").font(.subheadline)
                                Spacer()
                            }
                        }.foregroundColor(object.isCompleted ? .gray : .primary)
                        // 这里用个Group套起来，里面用三元实现点击切换图标，展示是否已经完成
                        Group{
                            object.isCompleted ? Image(systemName: "circle.fill") : Image(systemName: "circle")
                        }
                    }.contentShape(Rectangle())
                    .onTapGesture {
                        newTo_DoList.switchComplete(object: object)
                    }
                // 这个调用将实现横滑删除功能
                }.onDelete{ index in
                    newTo_DoList.deleteTo_DoObject(offset: index)
                }
            }
        }.animation(.default, value: newTo_DoList.To_DoList)
    }
}

struct sktrTo_DoView_Previews: PreviewProvider {
    static var previews: some View {
        sktrTo_DoListView()
    }
}
