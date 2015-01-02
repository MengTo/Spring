//
//  SpringView.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-01.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

@IBDesignable class SpringView: UIView {
    
    @IBInspectable var animation: String = ""
    
    func animatePreset() {
        isFrom = true
        reset()
        
        switch animation {
        case "slideLeft":
            x = 300*force
        case "slideRight":
            x = -300*force
        case "slideDown":
            y = -300*force
        case "slideUp":
            y = 300*force
        case "fadeIn":
            opacity = 0
        case "fadeOut":
            isFrom = false
            opacity = 0
        case "fadeLeft":
            opacity = 0
            x = 300*force
        case "fadeInRight":
            x = -300*force
            opacity = 0
        case "fadeInDown":
            y = -300*force
            opacity = 0
        case "fadeInUp":
            y = 300*force
            opacity = 0
        case "zoomIn":
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case "zoomOut":
            isFrom = false
            opacity = 0
            scaleX = 2*force
            scaleY = 2*force
        case "shake":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values = [0, 30*force, -30*force, 30*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            layer.addAnimation(animation, forKey: "shake")
            opacity = 0.99
        case "pop":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0, 0.1*force, -0.1*force, 0.1*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            layer.addAnimation(animation, forKey: "pop")
            opacity = 0.99
        case "morph":
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.1*force, 0.9, 1.1*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            morphX.duration = CFTimeInterval(duration)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.9, 1.1*force, 0.9, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            morphY.duration = CFTimeInterval(duration)
            layer.addAnimation(morphY, forKey: "morphY")

            opacity = 0.99
        case "flash":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "opacity"
            animation.values = [1, 0, 1, 0, 1]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            layer.addAnimation(animation, forKey: "flash")
            opacity = 0.99
        default:
            x = 300
        }
    }
    
    @IBInspectable var force: CGFloat = 1
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
        animatePreset()
        setView {}
    }
    
    func animateFrom() {
        isFrom = true
        setView {}
    }
    
    func animateNext(completion: () -> ()) {
        animatePreset()
        setView {
            completion()
        }
    }
    
    override func awakeFromNib() {
        animatePreset()
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