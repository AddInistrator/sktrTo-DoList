//
//  sktrTo_DoVIew.swift
//  sktrTo_DoListView
//
//  Created by 朱玺源 on 2023/9/30.
//

import Foundation
import SwiftUI


struct sktrTo_DoListView: View {
    @State private var selectedTo_DoObject:sktrTo_DoObject = sktrTo_DoObject(content: "", level: 5, ddl: Date(), completeTime: Date());
    @State private var isPresented:Bool = false;
    @State private var isEdit:Bool = false;
    @ObservedObject var selectedTo_DoList:sktrTo_DoList
    
    private func sktrFormatter(date:Date) -> String {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "plus.circle")
                    .font(.title2)
                    .foregroundStyle(Color.init(uiColor: .hex(0x5E81AC)))
                    .onTapGesture {
                        isPresented.toggle(); isEdit = false
                        selectedTo_DoObject = sktrTo_DoObject(content: "", level: 5, ddl: Date(), completeTime: Date());
                    }
                    
            }.padding(.all, 20)
            List {
                ForEach(selectedTo_DoList.To_DoList) { object in
                    HStack {
                        VStack {
                            Spacer()
                            Rectangle()
                                .fill(Color(uiColor: object.isCompleted ? .gray : sktrTo_DoLevelDictionary[object.level]!.color))
                                .cornerRadius(2)
                                .frame(width: 5)
                            Spacer()
                        }
                        Spacer(minLength: 15.0)
                        VStack {
                            Spacer()
                            HStack{
                                Text("\(object.content)") .font(.title2)
                                Spacer()
                            }
                            Spacer()
                            HStack{
                                Image(systemName: object.isCompleted ? "clock.badge.checkmark": "clock.badge.exclamationmark")
                                Text(object.isCompleted ? "完成于：\(fmt.getDate(date:object.completeTime))" : "截止于：\(fmt.getDate(date:object.ddl))")
                                    .font(.subheadline)
                                Spacer()
                            } .foregroundStyle(Color(uiColor: .hex(0x4C566A)))
                            Spacer()
                        }.foregroundColor(object.isCompleted ? .gray : .primary)
                        // 这里用个Group套起来，里面用三元实现点击切换图标，展示是否已经完成
                        Group{
                            object.isCompleted ? Image(systemName: "circle.fill") : Image(systemName: "circle")
                        }
                    }   .contentShape(Rectangle())
                        .onTapGesture {
                            selectedTo_DoList.switchComplete(object: object)
                        }
                        .onLongPressGesture(perform: {
                            selectedTo_DoObject = object
                            isPresented.toggle()
                            isEdit = true
                        })
                // 这个调用将实现横滑删除功能
                }.onDelete{ index in selectedTo_DoList.deleteTo_DoObject(offset: index) } 
            }
        }.animation(.default, value: selectedTo_DoList.To_DoList)
            .sheet(isPresented: $isPresented, content: {
                sktrTo_DoEditorView(selectedTo_DoObject:selectedTo_DoObject, action: { object in
                    isEdit ? selectedTo_DoList.updateTo_DoObject(object: object) : selectedTo_DoList.addTo_DoObject(object: object)
                    isPresented.toggle()
                }, isEdit: isEdit)
            })
    }
}

