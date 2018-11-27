//
//  ColorUtils.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init?(hex: String) {
    var hexNormalized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexNormalized = hexNormalized.replacingOccurrences(of: "#", with: "")
    
    var rgb: UInt32 = 0
    var r: CGFloat = 0.0
    var g: CGFloat = 0.0
    var b: CGFloat = 0.0
    var a: CGFloat = 1.0
    
    let length = hexNormalized.count
    Scanner(string: hexNormalized).scanHexInt32(&rgb)
    if length == 6 {
      r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
      g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
      b = CGFloat(rgb & 0x0000FF) / 255.0
    } else if length == 8 {
      r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
      g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
      b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
      a = CGFloat(rgb & 0x000000FF) / 255.0
    } else {
      return nil
    }
    
    self.init(red: r, green: g, blue: b, alpha: a)
  }
  
  var toHex: String? {
    var r: Float, g: Float, b: Float, a = Float(1.0)
    if let components = cgColor.components, components.count >= 3 {
      r = Float(components[0])
      g = Float(components[1])
      b = Float(components[2])
      if components.count >= 4 {
        a = Float(components[3])
      }
    } else {
      var white = CGFloat(0.0), alpha = CGFloat(0.0)
      getWhite(&white, alpha: &alpha)
      r = Float(white)
      g = Float(white)
      b = Float(white)
      a = Float(alpha)
    }
    let hex = String(format: "%02lX%02lX%02lX%02lX",
                     lroundf(r * 255),
                     lroundf(g * 255),
                     lroundf(b * 255),
                     lroundf(a * 255))
    return hex
  }
}
