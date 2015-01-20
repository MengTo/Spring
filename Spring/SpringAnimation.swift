//
//  SpringAnimation.swift
//  ShotsDemo
//
//  Created by Meng To on 2014-07-04.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

public func spring(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        usingSpringWithDamping: 0.7,
        initialSpringVelocity: 0.7,
        options: nil,
        animations: {
        
            animations()
        
        }, completion: { finished in
    })
}

public func springEaseIn(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveEaseIn,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

public func springEaseOut(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveEaseOut,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

public func springEaseInOut(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveEaseInOut,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

public func springLinear(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveLinear,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

public func springWithDelay(duration: NSTimeInterval, delay: NSTimeInterval, animations: (() -> Void)!) {
    UIView.animateWithDuration(
        duration,
        delay: delay,
        usingSpringWithDamping: 0.7,
        initialSpringVelocity: 0.7,
        options: nil,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

public func springWithCompletion(duration: NSTimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {

    UIView.animateWithDuration(
        duration,
        delay: 0,
        usingSpringWithDamping: 0.7,
        initialSpringVelocity: 0.7,
        options: nil,
        animations: {
        
            animations()
        
        }, completion: { finished in
            completion(true)
    })
}