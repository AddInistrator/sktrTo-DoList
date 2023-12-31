//
//  sktrCreateTo_DoView.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/9/30.
//

import Foundation
import SwiftUI
import PermissionsSwiftUINotification





struct sktrTo_DoEditorView: View {
    @State var selectedTo_DoObject:sktrTo_DoObject = sktrTo_DoObject(content: "", level: 5, ddl: Date(), completeTime: Date())
    @State var action:(_ object:sktrTo_DoObject) -> Void;
    @State var isEdit:Bool = false
    @State var sendNotification:Bool = false
    @State var showModal = true
    
    
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(isEdit ? "编辑ToDo" : "新建ToDo")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                // 一个横向布局，表单项名称-分隔占位-以及表单项
                // 给一个 .all 的 padding，不然不好看
                HStack {
                    Text("内容:").bold()
                    Spacer()
                    TextField("请输入内容",text:$selectedTo_DoObject.content).multilineTextAlignment(.trailing)
                        .lineLimit(nil)
                }.padding()
                
                DatePicker(selection: $selectedTo_DoObject.ddl, in: Date()...) {
                    Text("截止时间:").bold()
                }.padding()
                
                HStack {
                    Text("重要程度：").bold()
                    Spacer()
                    Text("\(sktrTo_DoLevelDictionary[selectedTo_DoObject.level]!.type)")
                        .bold()
                        .foregroundStyle(Color(sktrTo_DoLevelDictionary[selectedTo_DoObject.level]!.color))
                }.padding()
                
                Picker ("", selection: $selectedTo_DoObject.level) {
                    ForEach (2...5, id:\.self) { item in
                        Text(sktrTo_DoLevelDictionary[item]!.type).foregroundStyle(Color(uiColor: sktrTo_DoLevelDictionary[selectedTo_DoObject.level]!.color))
                    }
                }   .pickerStyle(.segmented)
                    .padding()
                
                Spacer()
                Button( action:{
                    action(selectedTo_DoObject)
                }, label:{
                    Text("确定")
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color(uiColor: .hex(0x5E81AC)))
                        .clipShape(Capsule())
                        .padding(.horizontal, 20)
                })
            }.JMAlert(showModal: $showModal, for: [.notification], restrictDismissal: false, autoCheckAuthorization: true)
                .changeHeaderTo("请求权限")
                .changeBottomDescriptionTo("需要允许提醒权限以使用提醒功能")
                .setPermissionComponent(for: .notification, image: AnyView(Image(systemName: "note.text")), title: "推送提醒" , description: "在截止时间时发送提醒")
                .changeHeaderDescriptionTo("")
                .setAccentColor(to: Color(uiColor: .hex(0x5E81AC)))
        }
    }
}


