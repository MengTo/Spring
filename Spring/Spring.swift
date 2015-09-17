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

@objc public protocol Springable {
    var autostart: Bool  { get set }
    var autohide: Bool  { get set }
    var animation: String  { get set }
    var force: CGFloat  { get set }
    var delay: CGFloat { get set }
    var duration: CGFloat { get set }
    var damping: CGFloat { get set }
    var velocity: CGFloat { get set }
    var repeatCount: Float { get set }
    var x: CGFloat { get set }
    var y: CGFloat { get set }
    var scaleX: CGFloat { get set }
    var scaleY: CGFloat { get set }
    var rotate: CGFloat { get set }
    var opacity: CGFloat { get set }
    var animateFrom: Bool { get set }
    var curve: String { get set }

    // UIView
    var layer : CALayer { get }
    var transform : CGAffineTransform { get set }
    var alpha : CGFloat { get set }
    
    func animate()
    func animateNext(completion: () -> ())
    func animateTo()
    func animateToNext(completion: () -> ())
}

public class Spring : NSObject {

    private unowned var view : Springable
    private var shouldAnimateAfterActive = false
    private var shouldAnimateInLayoutSubviews = true

    init(_ view: Springable) {
        self.view = view
        super.init()
        commonInit()
    }

    func commonInit() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActiveNotification:", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }

    func didBecomeActiveNotification(notification: NSNotification) {
        if shouldAnimateAfterActive {
            alpha = 0
            animate()
            shouldAnimateAfterActive = false
        }
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationDidBecomeActiveNotification, object: nil)
    }

    private var autostart: Bool { set { self.view.autostart = newValue } get { return self.view.autostart }}
    private var autohide: Bool { set { self.view.autohide = newValue } get { return self.view.autohide }}
    private var animation: String { set { self.view.animation = newValue } get { return self.view.animation }}
    private var force: CGFloat { set { self.view.force = newValue } get { return self.view.force }}
    private var delay: CGFloat { set { self.view.delay = newValue } get { return self.view.delay }}
    private var duration: CGFloat { set { self.view.duration = newValue } get { return self.view.duration }}
    private var damping: CGFloat { set { self.view.damping = newValue } get { return self.view.damping }}
    private var velocity: CGFloat { set { self.view.velocity = newValue } get { return self.view.velocity }}
    private var repeatCount: Float { set { self.view.repeatCount = newValue } get { return self.view.repeatCount }}
    private var x: CGFloat { set { self.view.x = newValue } get { return self.view.x }}
    private var y: CGFloat { set { self.view.y = newValue } get { return self.view.y }}
    private var scaleX: CGFloat { set { self.view.scaleX = newValue } get { return self.view.scaleX }}
    private var scaleY: CGFloat { set { self.view.scaleY = newValue } get { return self.view.scaleY }}
    private var rotate: CGFloat { set { self.view.rotate = newValue } get { return self.view.rotate }}
    private var opacity: CGFloat { set { self.view.opacity = newValue } get { return self.view.opacity }}
    private var animateFrom: Bool { set { self.view.animateFrom = newValue } get { return self.view.animateFrom }}
    private var curve: String { set { self.view.curve = newValue } get { return self.view.curve }}

    // UIView
    private var layer : CALayer { return view.layer }
    private var transform : CGAffineTransform { get { return view.transform } set { view.transform = newValue }}
    private var alpha: CGFloat { get { return view.alpha } set { view.alpha = newValue } }

    public enum AnimationPreset: String {
        case SlideLeft = "slideLeft"
        case SlideRight = "slideRight"
        case SlideDown = "slideDown"
        case SlideUp = "slideUp"
        case SqueezeLeft = "squeezeLeft"
        case SqueezeRight = "squeezeRight"
        case SqueezeDown = "squeezeDown"
        case SqueezeUp = "squeezeUp"
        case FadeIn = "fadeIn"
        case FadeOut = "fadeOut"
        case FadeOutIn = "fadeOutIn"
        case FadeInLeft = "fadeInLeft"
        case FadeInRight = "fadeInRight"
        case FadeInDown = "fadeInDown"
        case FadeInUp = "fadeInUp"
        case ZoomIn = "zoomIn"
        case ZoomOut = "zoomOut"
        case Fall = "fall"
        case Shake = "shake"
        case Pop = "pop"
        case FlipX = "flipX"
        case FlipY = "flipY"
        case Morph = "morph"
        case Squeeze = "squeeze"
        case Flash = "flash"
        case Wobble = "wobble"
        case Swing = "swing"
    }

    public enum AnimationCurve: String {
        case EaseIn = "easeIn"
        case EaseOut = "easeOut"
        case EaseInOut = "easeInOut"
        case Linear = "linear"
        case Spring = "spring"
        case EaseInSine = "easeInSine"
        case EaseOutSine = "easeOutSine"
        case EaseInOutSine = "easeInOutSine"
        case EaseInQuad = "easeInQuad"
        case EaseOutQuad = "easeOutQuad"
        case EaseInOutQuad = "easeInOutQuad"
        case EaseInCubic = "easeInCubic"
        case EaseOutCubic = "easeOutCubic"
        case EaseInOutCubic = "easeInOutCubic"
        case EaseInQuart = "easeInQuart"
        case EaseOutQuart = "easeOutQuart"
        case EaseInOutQuart = "easeInOutQuart"
        case EaseInQuint = "easeInQuint"
        case EaseOutQuint = "easeOutQuint"
        case EaseInOutQuint = "easeInOutQuint"
        case EaseInExpo = "easeInExpo"
        case EaseOutExpo = "easeOutExpo"
        case EaseInOutExpo = "easeInOutExpo"
        case EaseInCirc = "easeInCirc"
        case EaseOutCirc = "easeOutCirc"
        case EaseInOutCirc = "easeInOutCirc"
        case EaseInBack = "easeInBack"
        case EaseOutBack = "easeOutBack"
        case EaseInOutBack = "easeInOutBack"
    }

    func animatePreset() {
        alpha = 0.99
        if let animation = AnimationPreset(rawValue: animation) {
            switch animation {
            case .SlideLeft:
                x = 300*force
            case .SlideRight:
                x = -300*force
            case .SlideDown:
                y = -300*force
            case .SlideUp:
                y = 300*force
            case .SqueezeLeft:
                x = 300
                scaleX = 3*force
            case .SqueezeRight:
                x = -300
                scaleX = 3*force
            case .SqueezeDown:
                y = -300
                scaleY = 3*force
            case .SqueezeUp:
                y = 300
                scaleY = 3*force
            case .FadeIn:
                opacity = 0
            case .FadeOut:
                animateFrom = false
                opacity = 0
            case .FadeOutIn:
                let animation = CABasicAnimation()
                animation.keyPath = "opacity"
                animation.fromValue = 1
                animation.toValue = 0
                animation.timingFunction = getTimingFunction(curve)
                animation.duration = CFTimeInterval(duration)
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                animation.autoreverses = true
                layer.addAnimation(animation, forKey: "fade")
            case .FadeInLeft:
                opacity = 0
                x = 300*force
            case .FadeInRight:
                x = -300*force
                opacity = 0
            case .FadeInDown:
                y = -300*force
                opacity = 0
            case .FadeInUp:
                y = 300*force
                opacity = 0
            case .ZoomIn:
                opacity = 0
                scaleX = 2*force
                scaleY = 2*force
            case .ZoomOut:
                animateFrom = false
                opacity = 0
                scaleX = 2*force
                scaleY = 2*force
            case .Fall:
                animateFrom = false
                rotate = 15 * CGFloat(M_PI/180)
                y = 600*force
            case .Shake:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "position.x"
                animation.values = [0, 30*force, -30*force, 30*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.timingFunction = getTimingFunction(curve)
                animation.duration = CFTimeInterval(duration)
                animation.additive = true
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(animation, forKey: "shake")
            case .Pop:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.scale"
                animation.values = [0, 0.2*force, -0.2*force, 0.2*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.timingFunction = getTimingFunction(curve)
                animation.duration = CFTimeInterval(duration)
                animation.additive = true
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(animation, forKey: "pop")
            case .FlipX:
                rotate = 0
                scaleX = 1
                scaleY = 1
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
                animation.timingFunction = getTimingFunction(curve)
                layer.addAnimation(animation, forKey: "3d")
            case .FlipY:
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
                animation.timingFunction = getTimingFunction(curve)
                layer.addAnimation(animation, forKey: "3d")
            case .Morph:
                let morphX = CAKeyframeAnimation()
                morphX.keyPath = "transform.scale.x"
                morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
                morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphX.timingFunction = getTimingFunction(curve)
                morphX.duration = CFTimeInterval(duration)
                morphX.repeatCount = repeatCount
                morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(morphX, forKey: "morphX")

                let morphY = CAKeyframeAnimation()
                morphY.keyPath = "transform.scale.y"
                morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
                morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphY.timingFunction = getTimingFunction(curve)
                morphY.duration = CFTimeInterval(duration)
                morphY.repeatCount = repeatCount
                morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(morphY, forKey: "morphY")
            case .Squeeze:
                let morphX = CAKeyframeAnimation()
                morphX.keyPath = "transform.scale.x"
                morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
                morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphX.timingFunction = getTimingFunction(curve)
                morphX.duration = CFTimeInterval(duration)
                morphX.repeatCount = repeatCount
                morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(morphX, forKey: "morphX")

                let morphY = CAKeyframeAnimation()
                morphY.keyPath = "transform.scale.y"
                morphY.values = [1, 0.5, 1, 0.5, 1]
                morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphY.timingFunction = getTimingFunction(curve)
                morphY.duration = CFTimeInterval(duration)
                morphY.repeatCount = repeatCount
                morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(morphY, forKey: "morphY")
            case .Flash:
                let animation = CABasicAnimation()
                animation.keyPath = "opacity"
                animation.fromValue = 1
                animation.toValue = 0
                animation.duration = CFTimeInterval(duration)
                animation.repeatCount = repeatCount * 2.0
                animation.autoreverses = true
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(animation, forKey: "flash")
            case .Wobble:
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
                x.timingFunction = getTimingFunction(curve)
                x.duration = CFTimeInterval(duration)
                x.additive = true
                x.repeatCount = repeatCount
                x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(x, forKey: "x")
            case .Swing:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.rotation"
                animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.additive = true
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.addAnimation(animation, forKey: "swing")
            }
        }
    }

    func getTimingFunction(curve: String) -> CAMediaTimingFunction {
        if let curve = AnimationCurve(rawValue: curve) {
            switch curve {
            case .EaseIn: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            case .EaseOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            case .EaseInOut: return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            case .Linear: return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            case .Spring: return CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(force/3), 1, 1)
            case .EaseInSine: return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
            case .EaseOutSine: return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
            case .EaseInOutSine: return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
            case .EaseInQuad: return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
            case .EaseOutQuad: return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
            case .EaseInOutQuad: return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
            case .EaseInCubic: return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            case .EaseOutCubic: return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
            case .EaseInOutCubic: return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
            case .EaseInQuart: return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
            case .EaseOutQuart: return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            case .EaseInOutQuart: return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
            case .EaseInQuint: return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
            case .EaseOutQuint: return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
            case .EaseInOutQuint: return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
            case .EaseInExpo: return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
            case .EaseOutExpo: return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
            case .EaseInOutExpo: return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
            case .EaseInCirc: return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
            case .EaseOutCirc: return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
            case .EaseInOutCirc: return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
            case .EaseInBack: return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
            case .EaseOutBack: return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            case .EaseInOutBack: return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
            }
        }
        return CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    }

    func getAnimationOptions(curve: String) -> UIViewAnimationOptions {
        if let curve = AnimationCurve(rawValue: curve) {
            switch curve {
            case .EaseIn: return UIViewAnimationOptions.CurveEaseIn
            case .EaseOut: return UIViewAnimationOptions.CurveEaseOut
            case .EaseInOut: return UIViewAnimationOptions.CurveEaseInOut
            default: break
            }
        }
        return UIViewAnimationOptions.CurveLinear
    }

    public func animate() {
        animateFrom = true
        animatePreset()
        setView {}
    }

    public func animateNext(completion: () -> ()) {
        animateFrom = true
        animatePreset()
        setView {
            completion()
        }
    }

    public func animateTo() {
        animateFrom = false
        animatePreset()
        setView {}
    }

    public func animateToNext(completion: () -> ()) {
        animateFrom = false
        animatePreset()
        setView {
            completion()
        }
    }
    
    public func customAwakeFromNib() {
        if autohide {
            alpha = 0
        }
    }
    
    public func customLayoutSubviews() {
        if shouldAnimateInLayoutSubviews {
            shouldAnimateInLayoutSubviews = false
            if autostart {
                if UIApplication.sharedApplication().applicationState != .Active {
                    shouldAnimateAfterActive = true
                    return
                }
                alpha = 0
                animate()
            }
        }
    }

    func setView(completion: () -> ()) {
        if animateFrom {
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
            options: [getAnimationOptions(curve), UIViewAnimationOptions.AllowUserInteraction],
            animations: { [weak self] in
            if let _self = self
            {
                if _self.animateFrom {
                    _self.transform = CGAffineTransformIdentity
                    _self.alpha = 1
                }
                else {
                    let translate = CGAffineTransformMakeTranslation(_self.x, _self.y)
                    let scale = CGAffineTransformMakeScale(_self.scaleX, _self.scaleY)
                    let rotate = CGAffineTransformMakeRotation(_self.rotate)
                    let translateAndScale = CGAffineTransformConcat(translate, scale)
                    _self.transform = CGAffineTransformConcat(rotate, translateAndScale)
                    
                    _self.alpha = _self.opacity
                }
                
            }
            
            }, completion: { [weak self] finished in
                
                completion()
                self?.resetAll()
                
            })
        
    }

    func reset() {
        x = 0
        y = 0
        opacity = 1
    }

    func resetAll() {
        x = 0
        y = 0
        animation = ""
        opacity = 1
        scaleX = 1
        scaleY = 1
        rotate = 0
        damping = 0.7
        velocity = 0.7
        repeatCount = 1
        delay = 0
        duration = 0.7
    }

}