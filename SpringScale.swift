//
//  SpringScale.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2014-12-31.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable class SpringScale: UIView {
    
    var animationDelay: NSTimeInterval = 0
    var animationDuration: NSTimeInterval = 0
    var animationDamping: CGFloat = 0.7
    var animationVelocity: CGFloat = 0.7
    var animationScaleX: CGFloat = 0
    var animationScaleY: CGFloat = 0
    var animationShouldStart: Bool = true
    var animationIsFrom: Bool = true
    
    func shouldAnimate() {
        if animationShouldStart == true {
            animate()
        }
    }
    
    func animate() {
        if animationIsFrom {
            self.transform = CGAffineTransformMakeScale(self.animationScaleX, self.animationScaleY)
        }
        
        UIView.animateWithDuration( animationDuration,
            delay: animationDelay,
            usingSpringWithDamping: animationDamping,
            initialSpringVelocity: animationVelocity,
            options: nil,
            animations: {
                
                if self.animationIsFrom {
                    self.transform = CGAffineTransformIdentity
                }
                else {
                    self.transform = CGAffineTransformMakeScale(self.animationScaleX, self.animationScaleY)
                }
                
            }, completion: nil)
    }
    
    override func awakeFromNib() {
        shouldAnimate()
    }
    
    @IBInspectable var scaleX: CGFloat = 0 {
        didSet {
            animationScaleX = scaleX
        }
    }
    
    @IBInspectable var scaleY: CGFloat = 0 {
        didSet {
            animationScaleY = scaleY
        }
    }
    
    @IBInspectable var isFrom: Bool = true {
        didSet {
            animationIsFrom = isFrom
            shouldAnimate()
        }
    }
    
    @IBInspectable var start: Bool = true {
        didSet {
            animationShouldStart = start
            shouldAnimate()
        }
    }
    
    @IBInspectable var delay: CGFloat = 0 {
        didSet {
            animationDelay = NSTimeInterval(delay)
        }
    }
    
    @IBInspectable var duration: CGFloat = 0 {
        didSet {
            animationDuration = NSTimeInterval(duration)
        }
    }
    
    @IBInspectable var damping: CGFloat = 0 {
        didSet {
            animationDamping = damping
        }
    }
    
    @IBInspectable var velocity: CGFloat = 0 {
        didSet {
            animationVelocity = velocity
        }
    }
}