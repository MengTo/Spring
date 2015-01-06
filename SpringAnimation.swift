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
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 0.8,
        options: nil,
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