//
//  sktrUserNotifications.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/10/6.
//

import Foundation
import UserNotifications



var sendNotificationGranted:Bool = false

func setNotification(){
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge]){ (granted, _) in
        if granted {
            sendNotificationGranted = true
        } else {
            sendNotificationGranted = false
        }
    }
}

func makeNotification(object: sktrTo_DoObject){
    
    let userCalendar = Calendar.current
    let calendar = userCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: object.ddl)
    var dateComponents = DateComponents()
    dateComponents.year = calendar.year
    dateComponents.month = calendar.month
    dateComponents.day = calendar.day
    dateComponents.hour = calendar.hour
    dateComponents.minute = calendar.minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
    
    let content = UNMutableNotificationContent()
    content.title = "To_DoList提醒"
    content.body = String(object.content) + " 已到截止时间：" + String(fmt.getDateAndTime(date: object.ddl))
    
    let request = UNNotificationRequest(identifier: object.content, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
}

func deleteNotification(object: sktrTo_DoObject){
    var temp:[String] = []
    temp.append(object.content)
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: temp)

}
