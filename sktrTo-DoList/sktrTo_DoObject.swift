//
//  sktrTo_DoObject.swift
//  sktrTo_DoList
//
//  Created by 朱玺源 on 2023/9/30.
//

import Foundation
import SwiftUI


struct sktrTo_DoObject: Identifiable, Equatable, Encodable, Decodable {
    var id = UUID();
    var content:String
    var level:Int = 5;
    var isCompleted:Bool = false;
    var ddl:Date = Date()
    var completeTime:Date = Date()
}


struct sktrTo_DoLevel: Equatable, Hashable {
    var type:String;
    var color:UIColor;
}


extension UIColor {
    static func hex(_ val: UInt) -> UIColor {
        var r: UInt = 0, g: UInt = 0, b: UInt = 0, a: UInt = 0xFF
        var rgb = val

        if (val & 0xFFFF0000) == 0 {
            a = 0xF

            if val & 0xF000 > 0 {
                a = val & 0xF
                rgb = val >> 4
            }

            r = (rgb & 0xF00) >> 8
            r = (r << 4) | r

            g = (rgb & 0xF0) >> 4
            g = (g << 4) | g

            b = rgb & 0xF
            b = (b << 4) | b

            a = (a << 4) | a

        } else {
            if val & 0xFF000000 > 0 {
                a = val & 0xFF
                rgb = val >> 8
            }

            r = (rgb & 0xFF0000) >> 16
            g = (rgb & 0xFF00) >> 8
            b = rgb & 0xFF
        }
        return UIColor(red: CGFloat(r) / 255.0,
                       green: CGFloat(g) / 255.0,
                       blue: CGFloat(b) / 255.0,
                       alpha: CGFloat(a) / 255.0)
    }
}


let sktrTo_DoLevelDictionary:[Int:sktrTo_DoLevel] = [
    1:sktrTo_DoLevel(type: "空", color: .gray),
    2:sktrTo_DoLevel(type: "不重要", color: .hex(0xB48EAD)),
    3:sktrTo_DoLevel(type: "普通", color: .hex(0xA3BE8C)),
    4:sktrTo_DoLevel(type: "重要", color: .hex(0xEBCB8B)),
    5:sktrTo_DoLevel(type: "紧急", color: .hex(0xBF616A))
]

