//
//  TransitionZoom.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-11.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

public class TransitionZoom: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = true
    var duration = 0.4
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        if isPresenting {
            container.addSubview(fromView)
            container.addSubview(toView)
            
            toView.alpha = 0
            toView.transform = CGAffineTransformMakeScale(2, 2)
            springEaseInOut(duration) {
                fromView.transform = CGAffineTransformMakeScale(0.5, 0.5)
                fromView.alpha = 0
                toView.transform = CGAffineTransformIdentity
                toView.alpha = 1
            }
        }
        else {
            container.addSubview(toView)
            container.addSubview(fromView)
            
            springEaseInOut(duration) {
                fromView.transform = CGAffineTransformMakeScale(2, 2)
                fromView.alpha = 0
                toView.transform = CGAffineTransformMakeScale(1, 1)
                toView.alpha = 1
            }
        }
        
        delay(duration, {
            transitionContext.completeTransition(true)
        })
    }
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}