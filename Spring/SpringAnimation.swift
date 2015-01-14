//
//  SpringAnimation.swift
//  ShotsDemo
//
//  Created by Meng To on 2014-07-04.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

func spring(duration: NSTimeInterval, animations: (() -> Void)!) {
    
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

func springEaseIn(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveEaseIn,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

func springEaseOut(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveEaseOut,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

func springEaseInOut(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveEaseInOut,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

func springLinear(duration: NSTimeInterval, animations: (() -> Void)!) {
    
    UIView.animateWithDuration(
        duration,
        delay: 0,
        options: UIViewAnimationOptions.CurveLinear,
        animations: {
            
            animations()
            
        }, completion: { finished in
    })
}

func springWithDelay(duration: NSTimeInterval, delay: NSTimeInterval, animations: (() -> Void)!) {
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

func springWithCompletion(duration: NSTimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {

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