//
//  AppDelegate.swift
//  sktrTo-DoList
//
//  Created by 朱玺源 on 2023/10/7.
//

import Foundation

extension UserDefaults {
    static func isFirstLaunch() -> Bool {
        let hasBeenLaunched = "hasBeenLaunched"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunched)
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: hasBeenLaunched)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
}
