//
//  DesignableLabel.swift
//  3DTransform
//
//  Created by Meng To on 2014-11-27.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable public class DesignableLabel: SpringLabel {

    @IBInspectable public var lineHeight: CGFloat = 1.5 {
        didSet {
            var font = UIFont(name: self.font.fontName, size: self.font.pointSize)
            var text = self.text
            
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight
            
            var attributedString = NSMutableAttributedString(string: text!)
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            attributedString.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attributedString.length))
            
            self.attributedText = attributedString
        }
    }

}
