//
//  DesignableTextField.swift
//  3DTransform
//
//  Created by Meng To on 2014-11-27.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable public class DesignableTextField: SpringTextField {
    
    @IBInspectable public var placeholderColor: UIColor = UIColor.clearColor() {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName: placeholderColor])
            layoutSubviews()
            
        }
    }
    
    @IBInspectable public var sidePadding: CGFloat = 0 {
        didSet {
            var padding = UIView(frame: CGRectMake(0, 0, sidePadding, sidePadding))
            
            leftViewMode = UITextFieldViewMode.Always
            leftView = padding
            
            rightViewMode = UITextFieldViewMode.Always
            rightView = padding
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat = 0 {
        didSet {
            var padding = UIView(frame: CGRectMake(0, 0, leftPadding, 0))
            
            leftViewMode = UITextFieldViewMode.Always
            leftView = padding
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat = 0 {
        didSet {
            var padding = UIView(frame: CGRectMake(0, 0, 0, rightPadding))
            
            rightViewMode = UITextFieldViewMode.Always
            rightView = padding
        }
    }
    
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
