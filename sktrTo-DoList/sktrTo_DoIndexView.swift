//
//  sktrTo_DoIndexView.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/10/4.
//


import Foundation
import SwiftUI
import PermissionsSwiftUINotification

struct sktrTo_DoIndexView: View {
    
    @StateObject var selectedTo_DoList:sktrTo_DoList = sktrTo_DoList(To_DoList:[]);
    
    
    var body: some View {

        VStack {
            TabView {
                sktrTo_DoMemoView(selectedTo_DoList: selectedTo_DoList)
                    .tabItem { Image(systemName: "calendar"); Text("Today") }
                sktrTo_DoListView(selectedTo_DoList: selectedTo_DoList)
                    .tabItem { Image(systemName: "list.dash"); Text("ToDo") }
            }
        }
    }
}
#Preview {
    sktrTo_DoIndexView()
}
