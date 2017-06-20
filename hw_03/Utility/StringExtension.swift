//
//  StringExtension.swift
//  hw_03
//
//  Created by Takashima on 2017/06/20.
//  Copyright © 2017年 taka. All rights reserved.
//

import Foundation
import BonMot

extension String {
    func withNormalStyle(ofSize size: CGFloat = 14, color: UIColor = UIColor.baseColor, height: CGFloat = 1.0, tracking: CGFloat = 100) -> NSAttributedString {
        let style = StringStyle(
            .font(UIFont.systemFont(ofSize: size)),
            .color(color),
            .lineHeightMultiple(height),
            .tracking(.adobe(tracking))
        )
        
        return self.styled(with: style)
    }
    
    func withBoldStyle(ofSize size: CGFloat = 14, color: UIColor = UIColor.baseColor, height: CGFloat = 1.0, tracking: CGFloat = 100) -> NSAttributedString {
        let style = StringStyle(
            .font(UIFont.boldSystemFont(ofSize: size)),
            .color(color),
            .lineHeightMultiple(height),
            .tracking(.adobe(tracking))
        )
        
        return self.styled(with: style)
    }
}
