//
//  Button+Inspectable.swift
//  Spring
//
//  Created by Tiago Mergulhão on 29/12/17.
//  Copyright © 2017 Meng To. All rights reserved.
//

import UIKit

// MARK: - Border

public extension UIView {
    
    @IBInspectable public var borderColor : UIColor? {
        set (value) {
            guard let color = value else { return }
            layer.borderColor = color.cgColor
        }
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat {
        set (value) {
            layer.borderWidth = value
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set (value) {
            layer.cornerRadius = value
        }
        get {
            return layer.cornerRadius
        }
    }
}

// MARK: - Shadow

public extension UIView {
    
    @IBInspectable public var shadowColor : UIColor? {
        set (value) {
            guard let color = value else { return }
            layer.shadowColor = color.cgColor
        }
        get {
            guard let cgColor = layer.shadowColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat {
        set (value) {
            layer.shadowRadius = value
        }
        get {
            return layer.shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity : CGFloat {
        set (value) {
            layer.shadowOpacity = Float(value)
        }
        get {
            return CGFloat(layer.shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowOffset : CGSize {
        set (value) {
            layer.shadowOffset = value
        }
        get {
            return layer.shadowOffset
        }
    }
    
    @IBInspectable public var shadowOffsetX : CGFloat {
        set (value) {
            layer.shadowOffset.width = value
        }
        get {
            return layer.shadowOffset.width
        }
    }
    
    @IBInspectable public var shadowOffsetY : CGFloat {
        set (value) {
            layer.shadowOffset.height = value
        }
        get {
            return layer.shadowOffset.height
        }
    }
}
