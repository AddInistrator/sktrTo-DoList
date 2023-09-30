//
//  sktrTo_DoListApp.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/9/30.
//

import SwiftUI

@main
struct sktrTo_DoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
