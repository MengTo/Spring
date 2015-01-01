//
//  SpringTranslate.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2014-12-31.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

@IBDesignable class SpringTranslate: UIView {
    
    var animationDelay: NSTimeInterval = 0
    var animationDuration: NSTimeInterval = 0
    var animationDamping: CGFloat = 0.7
    var animationVelocity: CGFloat = 0.7
    var animationX: CGFloat = 0
    var animationY: CGFloat = 0
    var animationScaleX: CGFloat = 1
    var animationScaleY: CGFloat = 1
    var animationRotate: CGFloat = 0
    var animationShouldStart: Bool = true
    var animationIsFrom: Bool = true
    var animationAlpha: CGFloat = 1
    
    func shouldAnimate() {
        if animationShouldStart == true {
            animate()
        }
    }
    
    func animate() {
        if animationIsFrom {
            let translate = CGAffineTransformMakeTranslation(self.animationX, self.animationY)
            let scale = CGAffineTransformMakeScale(self.animationScaleX, self.animationScaleY)
            let rotate = CGAffineTransformMakeRotation(self.animationRotate)
            let translateAndScale = CGAffineTransformConcat(translate, scale)
            self.transform = CGAffineTransformConcat(rotate, translateAndScale)
            
            self.alpha = animationAlpha
        }
        
        
        
        UIView.animateWithDuration( animationDuration,
            delay: animationDelay,
            usingSpringWithDamping: animationDamping,
            initialSpringVelocity: animationVelocity,
            options: nil,
            animations: {
                
                if self.animationIsFrom {
                    self.transform = CGAffineTransformIdentity
                    self.alpha = 1
                }
                else {
                    let translate = CGAffineTransformMakeTranslation(self.animationX, self.animationY)
                    let scale = CGAffineTransformMakeScale(self.animationScaleX, self.animationScaleY)
                    let rotate = CGAffineTransformMakeRotation(self.animationRotate)
                    let translateAndScale = CGAffineTransformConcat(translate, scale)
                    self.transform = CGAffineTransformConcat(rotate, translateAndScale)
                    
                    self.alpha = self.animationAlpha
                }
                
            }, completion: nil)
    }
    
    override func awakeFromNib() {
        shouldAnimate()
    }
    
    @IBInspectable var x: CGFloat = 0 {
        didSet {
            animationX = x
        }
    }
    
    @IBInspectable var y: CGFloat = 0 {
        didSet {
            animationY = y
        }
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
    
    @IBInspectable var rotate: CGFloat = 0 {
        didSet {
            animationRotate = rotate
        }
    }
    
    @IBInspectable var opacity: CGFloat = 0 {
        didSet {
            animationAlpha = opacity
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