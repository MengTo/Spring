//
//  TransitionManager.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-10.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

public class TransitionManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = true
    var duration = 0.3
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        if isPresenting {
            container.addSubview(fromView)
            container.addSubview(toView)
            
            toView.transform = CGAffineTransformMakeTranslation(0, toView.frame.size.height)
            springEaseInOut(duration) {
                fromView.transform = CGAffineTransformMakeScale(0.8, 0.8)
                fromView.alpha = 0.5
                toView.transform = CGAffineTransformIdentity
            }
        }
        else {
            container.addSubview(toView)
            container.addSubview(fromView)
            
            springEaseInOut(duration) {
                fromView.transform = CGAffineTransformMakeTranslation(0, fromView.frame.size.height)
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
