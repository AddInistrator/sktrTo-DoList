//
//  sktrTo_DoMemoView.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/10/4.
//

import SwiftUI



struct sktrTo_DoMemoView: View {
    
    @State var selectedTo_DoObject:sktrTo_DoObject = sktrTo_DoObject(content: "", level: 5, ddl: Date(), completeTime: Date())
    @ObservedObject var selectedTo_DoList: sktrTo_DoList;
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Spacer()
            VStack{
                HStack {
                    Text(fmt.getDate(date: Date()))
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color(uiColor: .hex(0x5E81AC)))
                    Spacer()
                }.padding()
            }.padding(.all)
            VStack {
                Spacer()
                Text(sktrQuoteArray.randomElement()!)
                    .font(.footnote)
                    .foregroundStyle(Color .gray)
                Spacer()
            }.padding(.all)
            VStack{
                
                HStack {
                    Text("今日ToDo")
                        .font(.headline)
                        .bold()
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("今日已完成\(selectedTo_DoList.getTo_DoMemoArray(isComplete: true).count)项，还有\(selectedTo_DoList.getTo_DoMemoArray(isComplete: false).count)项未完成")
                        .font(.footnote)
                        .foregroundStyle(Color(uiColor: colorScheme == .dark ? .hex(0xD8DEE9) : .hex(0x4C566A)))
                }
            }.padding(.all)
            
            List {
                ForEach(selectedTo_DoList.getTo_DoMemoArray(isComplete: false)) { object in
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
                                Text(fmt.getTime(time: object.ddl))
                                    .font(.subheadline)
                                
                            }
                            Spacer()
                        }.foregroundColor(object.isCompleted ? .gray : .primary)
                        Group{
                            object.isCompleted ? Image(systemName: "circle.fill") : Image(systemName: "circle")
                        }
                    }   .contentShape(Rectangle())
                        .onTapGesture { selectedTo_DoList.switchComplete(object: object) }
                }
            }
            Spacer()
        }
    }
}


