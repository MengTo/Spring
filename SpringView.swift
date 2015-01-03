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
        opacity = 0.99
        
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
        case "fadeInLeft":
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
        case "fall":
            isFrom = false
            rotate = 1
            y = 300
        case "shake":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            animation.values = [0, 30*force, -30*force, 30*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.repeatCount = 1
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "shake")
        case "pop":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.scale"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.repeatCount = 1
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "pop")
        case "flipX":
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(CATransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(CATransform3D:
                CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "3d")
        case "flipY":
            var perspective = CATransform3DIdentity
            perspective.m34 = -1.0 / layer.frame.size.width/2
            
            let animation = CABasicAnimation()
            animation.keyPath = "transform"
            animation.fromValue = NSValue(CATransform3D:
                CATransform3DMakeRotation(0, 0, 0, 0))
            animation.toValue = NSValue(CATransform3D:
                CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0)))
            animation.duration = CFTimeInterval(duration)
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "3d")
        case "morph":
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = 1
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = 1
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphY, forKey: "morphY")
        case "squeeze":
            let morphX = CAKeyframeAnimation()
            morphX.keyPath = "transform.scale.x"
            morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
            morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            morphX.duration = CFTimeInterval(duration)
            morphX.repeatCount = 1
            morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphX, forKey: "morphX")
            
            let morphY = CAKeyframeAnimation()
            morphY.keyPath = "transform.scale.y"
            morphY.values = [1, 0.5, 1, 0.5, 1]
            morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            morphY.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
            morphY.duration = CFTimeInterval(duration)
            morphY.repeatCount = 1
            morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(morphY, forKey: "morphY")
        case "flash":
            let animation = CABasicAnimation()
            animation.keyPath = "opacity"
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = CFTimeInterval(duration)
            animation.repeatCount = 2
            animation.autoreverses = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "flash")
        case "wobble":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "wobble")
            
            let x = CAKeyframeAnimation()
            x.keyPath = "position.x"
            x.values = [0, 30*force, -30*force, 30*force, 0]
            x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            x.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            x.duration = CFTimeInterval(duration)
            x.additive = true
            x.repeatCount = 1
            x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(x, forKey: "x")
        case "swing":
            let animation = CAKeyframeAnimation()
            animation.keyPath = "transform.rotation"
            animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
            animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            animation.duration = CFTimeInterval(duration)
            animation.additive = true
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
            layer.addAnimation(animation, forKey: "swing")
        default:
            x = 300
        }
    }
    
    @IBInspectable var force: CGFloat = 1
    @IBInspectable var delay: CGFloat = 0
    @IBInspectable var duration: CGFloat = 0.7
    @IBInspectable var damping: CGFloat = 0.7
    @IBInspectable var velocity: CGFloat = 0.7
    @IBInspectable var x: CGFloat = 0
    @IBInspectable var y: CGFloat = 0
    @IBInspectable var scaleX: CGFloat = 1
    @IBInspectable var scaleY: CGFloat = 1
    @IBInspectable var rotate: CGFloat = 0
    @IBInspectable var opacity: CGFloat = 1
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
    }
}