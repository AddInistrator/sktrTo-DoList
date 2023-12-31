//
//  sktrTo-DoList.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/9/30.
//

import Foundation
import SwiftUI


class sktrTo_DoList: ObservableObject, Identifiable {
    
    @AppStorage("sktrTo_DoList") public var To_DoListDBObject:String = ""
    @Published private(set) var To_DoList:[sktrTo_DoObject];
    
    
    init(To_DoList: [sktrTo_DoObject]) {
        self.To_DoList = To_DoList;
        if To_DoList.isEmpty {
            guard (try? self.To_DoList = JSONDecoder().decode([sktrTo_DoObject].self, from: To_DoListDBObject.data(using: .utf8)!)) != nil else { return }
        }
        sortTo_DoObject()
    }
    
    func saveTo_DoDBObject() {
        guard let data = try? JSONEncoder().encode(self.To_DoList) else { return }
        To_DoListDBObject = String(data: data, encoding: .utf8)!
    }
    
    func addTo_DoObject(object:sktrTo_DoObject){
        if object.content == "" {
            return;
        }
        self.To_DoList.append(object)
        sortTo_DoObject()
        saveTo_DoDBObject()
        makeNotification(object: object)
    }
    
    func switchComplete(object:sktrTo_DoObject){
        // 找到这一条的索引 index，$0代表这个方法的第一个参数
        let index = To_DoList.firstIndex(where: {$0.id == object.id});
        if index != nil {
        // index! 代表我知道这个index一定存在，不用再进行判断了
            self.To_DoList[index!].isCompleted.toggle();
            self.To_DoList[index!].completeTime = Date();
        }
        saveTo_DoDBObject()
    }
    
    func deleteTo_DoObject(offset: IndexSet) {
        offset.forEach { index in 
            self.To_DoList.remove(at: index);
        }
        saveTo_DoDBObject()
    }
    

    func updateTo_DoObject(object: sktrTo_DoObject) {
        
        let index = self.To_DoList.firstIndex( where: { $0.id == object.id } );
        deleteNotification(object: self.To_DoList[index!])
        self.To_DoList[index!] = object;
        makeNotification(object: self.To_DoList[index!])
        sortTo_DoObject()
        saveTo_DoDBObject()
        
    }
    
    func sortTo_DoObject() {
        self.To_DoList.sort(by: { fmt.isEqualDate(date1: $0.ddl, date2: $1.ddl) ?
            $0.level > $1.level : fmt.getDate(date: $0.ddl) < fmt.getDate(date: $1.ddl) })
    }
    
    func getTo_DoMemoArray(isComplete:Bool, date:Date = Date()) -> [sktrTo_DoObject] {
        
        var temp:[sktrTo_DoObject] = []
        for object in To_DoList {
            if object.isCompleted == isComplete && fmt.isEqualDate(date1: object.ddl, date2: Date()) {
                temp.append(object)
            }
        }
        return temp
    }

}
