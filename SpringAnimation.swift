//
//  SpringAnimation.swift
//  ShotsDemo
//
//  Created by Meng To on 2014-07-04.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

var duration = 0.7
var delay = 0.0
var damping = 0.7
var velocity = 0.7

func slideLeft(view: UIView, delay: NSTimeInterval, duration: NSTimeInterval, damping: CGFloat, velocity: CGFloat) {
    view.transform = CGAffineTransformMakeTranslation(200, 0)
    
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: nil, animations: {
        
        view.transform = CGAffineTransformIdentity
        
    }, completion: nil)
}

func spring(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: nil, animations: {
        
        animations()
        
        }, completion: { finished in
            
        })
}

func springWithDelay(duration: NSTimeInterval, delay: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: {
        
        animations()
        
        }, completion: { finished in
            
        })
}

func slideUp(duration: NSTimeInterval, animations: (() -> Void)!) {
    UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
        
        animations()
        
        }, nil)
}

func springWithCompletion(duration: NSTimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {
    
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: {
        
        animations()
        
        }, completion: { finished in
            completion(true)
        })
}

func springScaleFrom (view: UIView, x: CGFloat, y: CGFloat, scaleX: CGFloat, scaleY: CGFloat) {
    let translation = CGAffineTransformMakeTranslation(x, y)
    let scale = CGAffineTransformMakeScale(scaleX, scaleY)
    view.transform = CGAffineTransformConcat(translation, scale)
    
    UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: {
        
        let translation = CGAffineTransformMakeTranslation(0, 0)
        let scale = CGAffineTransformMakeScale(1, 1)
        view.transform = CGAffineTransformConcat(translation, scale)
        
        }, completion: nil)
}

func springScaleTo (view: UIView, x: CGFloat, y: CGFloat, scaleX: CGFloat, scaleY: CGFloat) {
    let translation = CGAffineTransformMakeTranslation(0, 0)
    let scale = CGAffineTransformMakeScale(1, 1)
    view.transform = CGAffineTransformConcat(translation, scale)
    
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: {
        
        let translation = CGAffineTransformMakeTranslation(x, y)
        let scale = CGAffineTransformMakeScale(scaleX, scaleY)
        view.transform = CGAffineTransformConcat(translation, scale)
        
        }, completion: nil)
}

func popoverTopRight(view: UIView) {
    view.hidden = false
    var translate = CGAffineTransformMakeTranslation(200, -200)
    var scale = CGAffineTransformMakeScale(0.3, 0.3)
    view.alpha = 0
    view.transform = CGAffineTransformConcat(translate, scale)
    
    UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: nil, animations: {
        
        var translate = CGAffineTransformMakeTranslation(0, 0)
        var scale = CGAffineTransformMakeScale(1, 1)
        view.transform = CGAffineTransformConcat(translate, scale)
        view.alpha = 1
        
        }, completion: nil)
}