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
    
    private func sktrFormatter(date:Date) -> String {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("今日ToDo").font(.title).bold()
                Spacer()
            }.padding()
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
                    }.contentShape(Rectangle())
                }
            }
        }
    }
}


