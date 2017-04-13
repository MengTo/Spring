// The MIT License (MIT)
//
// Copyright (c) 2015 Meng To (meng@designcode.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public class TransitionManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = true
    var duration = 0.3
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        if isPresenting {
            toView.frame = container.bounds
            toView.transform = CGAffineTransform(translationX: 0, y: container.frame.size.height)
            container.addSubview(fromView)
            container.addSubview(toView)
            SpringAnimation.springEaseInOut(duration: duration) {
                fromView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                fromView.alpha = 0.5
                toView.transform = CGAffineTransform.identity
            }
        }
        else {

            // 1. Rotating will change the bounds
            // 2. we have to properly reset toView
            // to the actual container's bounds, at
            // the same time take consideration of
            // previous transformation when presenting
            let transform = toView.transform
            toView.transform = CGAffineTransform.identity
            toView.frame = container.bounds
            toView.transform = transform

            container.addSubview(toView)
            container.addSubview(fromView)

            SpringAnimation.springEaseInOut(duration: duration) {
                fromView.transform = CGAffineTransform(translationX: 0, y: fromView.frame.size.height)
                toView.transform = CGAffineTransform.identity
                toView.alpha = 1
            }
        }
        
        delay(delay: duration, closure: {
            transitionContext.completeTransition(true)
        })
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animationController(forPresentedController presented: UIViewController, presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}
