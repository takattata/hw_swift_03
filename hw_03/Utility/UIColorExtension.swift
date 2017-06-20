//
//  UIColorExtension.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        let red: CGFloat   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat  = CGFloat(hex & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private enum Cache {
        // TODO: - Add Secondary Color
        // Basic
        static let baseColor        = UIColor(hex: 0x555555, alpha: 1.0)
        static let mutedColor       = UIColor(hex: 0x8f8e94, alpha: 1.0)
        static let remarkableColor  = UIColor(hex: 0xfa64a0, alpha: 1.0)
        static let activeColor      = UIColor(hex: 0xff828c, alpha: 1.0)
        static let passiveColor     = UIColor(hex: 0xbcddf2, alpha: 1.0)
        static let infoColor        = UIColor(hex: 0x7ec3ef, alpha: 1.0)
        static let importantColor   = UIColor(hex: 0x6e3c28, alpha: 1.0)
        
        // SNS
        static let facebookColor    = UIColor(hex: 0x3b5998, alpha: 1.0)
        static let twitterColor     = UIColor(hex: 0x55acee, alpha: 1.0)
        
        // Parts
        static let backgroundColor  = UIColor(hex: 0xfcf0ec, alpha: 1.0)
        static let borderColor      = UIColor(hex: 0xdddddd, alpha: 1.0)
        static let navigationColor  = UIColor(hex: 0xffd9cc, alpha: 1.0)
        static let nabBarColor      = UIColor(hex: 0xfafafa, alpha: 1.0)
        static let placeholderColor = UIColor(hex: 0xc7c7cd, alpha: 1.0)
        
        // Button
        static let primaryButtonColor      = UIColor(hex: 0xffebac, alpha: 1.0)
        static let primaryButtonTapColor   = UIColor(hex: 0xf1ce8b, alpha: 1.0)
        static let secondaryButtonTapColor = UIColor(hex: 0xe8c5ba, alpha: 1.0)
    }
    
    // Basic
    class var baseColor:        UIColor { return Cache.baseColor }
    class var mutedColor:       UIColor { return Cache.mutedColor }
    class var remarkableColor:  UIColor { return Cache.remarkableColor }
    class var activeColor:      UIColor { return Cache.activeColor }
    class var passiveColor:     UIColor { return Cache.passiveColor }
    class var infoColor:        UIColor { return Cache.infoColor }
    class var importantColor:   UIColor { return Cache.importantColor }
    
    // SNS
    class var facebookColor:    UIColor { return Cache.facebookColor }
    class var twitterColor:     UIColor { return Cache.twitterColor }
    
    // Parts
    class var backgroundColor:  UIColor { return Cache.backgroundColor }
    class var borderColor:      UIColor { return Cache.borderColor }
    class var navigationColor:  UIColor { return Cache.navigationColor }
    class var nabBarColor:      UIColor { return Cache.nabBarColor }
    class var placeholderColor: UIColor { return Cache.placeholderColor }
    
    // Button
    class var primaryButtonColor:      UIColor { return Cache.primaryButtonColor }
    class var primaryButtonTapColor:   UIColor { return Cache.primaryButtonTapColor }
    class var secondaryButtonTapColor: UIColor { return Cache.secondaryButtonTapColor }
}
