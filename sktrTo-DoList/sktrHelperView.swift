//
//  sktrHelperView.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/10/7.
//

import Foundation
import SwiftUI

struct sktrHelperView: View {
    var body: some View {
        VStack{
            List {
                HStack {
                    Image(systemName: "note.text") 
                        .font(.largeTitle)
                        .foregroundStyle(Color(uiColor: .hex(0x5E81AC)))
                    Spacer()
                    VStack {
                        Spacer()
                        HStack{
                            Text("新建 ToDo").font(.title2).bold()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text("点击页面上方的")
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .gray))
                            Image(systemName: "plus.circle")
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .gray))
                            Text("以新建ToDo项")
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .gray))
                            Spacer()
                        }
                    }.padding()
                    Spacer()
                }
                HStack {
                    Image(systemName: "square.and.pencil")
                        .font(.largeTitle)
                        .foregroundStyle(Color(uiColor: .hex(0x5E81AC)))
                    Spacer()
                    VStack {
                        Spacer()
                        HStack{
                            Text("修改 ToDo").font(.title2).bold()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text("长按ToDo项以编辑内容").font(.footnote)
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .gray))
                            Spacer()
                        }
                    }.padding()
                    Spacer()
                }
                HStack {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                        .foregroundStyle(Color(uiColor: .hex(0x5E81AC)))
                    Spacer()
                    VStack {
                        Spacer()
                        HStack{
                            Text("删除 ToDo").font(.title2).bold()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text("向左滑动ToDo项，直至删除").font(.footnote)
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .gray))
                            Spacer()
                        }
                    }.padding()
                    Spacer()
                }
                HStack {
                    Image(systemName: "bell.badge")
                        .font(.largeTitle)
                        .foregroundStyle(Color(uiColor: .hex(0x5E81AC)))
                    Spacer()
                    VStack {
                        Spacer()
                        HStack{
                            Text("注意推送提醒").font(.title2).bold()
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text("当然也可以禁止推送").font(.footnote)
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .gray))
                            Spacer()
                        }
                    }.padding()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    sktrHelperView()
}
