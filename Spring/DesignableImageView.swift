//
//  DesignableImageView.swift
//  DesignCodeApp
//
//  Created by Meng To on 2014-12-22.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable public class DesignableImageView: SpringImageView {
    
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

}
