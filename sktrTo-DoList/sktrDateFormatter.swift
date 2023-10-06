//
//  sktrDateFormatter.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/10/6.
//

import Foundation
import SwiftUI

struct sktrDateFormatter {
    let formatter:DateFormatter = DateFormatter()
    
    func getDate(date: Date) -> String {
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date)
    }
    
    func getTime(time: Date) -> String {
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: time)
    }
    
    func getDateAndTime(date: Date) -> String {
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.string(from: date)
    }
    
    func isEqualDate(date1:Date, date2:Date) -> Bool {
        return self.getDate(date: date1) == self.getDate(date: date2)
    }
}


var fmt:sktrDateFormatter = sktrDateFormatter()
