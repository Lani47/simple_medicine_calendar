//
//  SystemColor.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/15.
//

import Foundation
import SwiftUI

//Colorクラスの色を取り出せるようにするextension
#if os(iOS)
typealias SystemColor = UIColor
#elseif os(macOS)
typealias SystemColor = NSColor
#else
#error("your os is not supported")
#endif

extension SystemColor {
    var rgba: (red: Double, green: Double, blue: Double, alpha: Double) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Double(red), Double(green), Double(blue), Double(alpha))
    }
}

extension Color {
    var rgbValues:(red: Double, green: Double, blue: Double){
        let rgba = SystemColor(self).rgba
        return (rgba.red, rgba.green, rgba.blue)
    }
}
