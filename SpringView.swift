//
//  SpringView.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-01.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

@IBDesignable class SpringView: UIView {
    
    @IBInspectable var x: CGFloat = 0
    @IBInspectable var y: CGFloat = 0
    @IBInspectable var scaleX: CGFloat = 1
    @IBInspectable var scaleY: CGFloat = 1
    @IBInspectable var rotate: CGFloat = 0
    @IBInspectable var opacity: CGFloat = 1
    @IBInspectable var delay: CGFloat = 0
    @IBInspectable var duration: CGFloat = 0.7
    @IBInspectable var damping: CGFloat = 0.7
    @IBInspectable var velocity: CGFloat = 0.7
    @IBInspectable var isFrom: Bool = false
    
    func animate() {
        isFrom = false
        setView({
            finished in
        })
    }
    
    func animateFrom() {
        isFrom = true
        setView {}
    }
    
    func animateNext(completion: () -> ()) {
        setView {
            completion()
        }
    }
    
    override func awakeFromNib() {
        setView {}
    }
    
    private func setView(completion: () -> ()) {
        if isFrom {
            let translate = CGAffineTransformMakeTranslation(self.x, self.y)
            let scale = CGAffineTransformMakeScale(self.scaleX, self.scaleY)
            let rotate = CGAffineTransformMakeRotation(self.rotate)
            let translateAndScale = CGAffineTransformConcat(translate, scale)
            self.transform = CGAffineTransformConcat(rotate, translateAndScale)
            
            self.alpha = self.opacity
        }
        
        UIView.animateWithDuration( NSTimeInterval(duration),
            delay: NSTimeInterval(delay),
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity,
            options: nil,
            animations: {
                
            if self.isFrom {
                self.transform = CGAffineTransformIdentity
                self.alpha = 1
            }
            else {
                let translate = CGAffineTransformMakeTranslation(self.x, self.y)
                let scale = CGAffineTransformMakeScale(self.scaleX, self.scaleY)
                let rotate = CGAffineTransformMakeRotation(self.rotate)
                let translateAndScale = CGAffineTransformConcat(translate, scale)
                self.transform = CGAffineTransformConcat(rotate, translateAndScale)
                
                self.alpha = self.opacity
            }
                
        }, { finished in
            
            completion()
            
        })
    }
    
    func reset() {
        x = 0
        y = 0
        scaleX = 1
        scaleY = 1
        rotate = 0
        opacity = 1
        delay = 0
        duration = 0.7
        damping = 0.7
        velocity = 0.7
    }
}