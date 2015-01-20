//
//  DesignableTextView.swift
//  3DTransform
//
//  Created by Meng To on 2014-11-27.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable public class DesignableTextView: SpringTextView {
    
    @IBInspectable public var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

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
