//
//  DesignableImageView.swift
//  DesignCodeApp
//
//  Created by Meng To on 2014-12-22.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable class DesignableImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
