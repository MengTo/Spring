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
    func animateNext(completion: @escaping () -> ())
    func animateTo()
    func animateToNext(completion: @escaping () -> ())
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
        NotificationCenter.default.addObserver(self, selector: #selector(Spring.didBecomeActiveNotification(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func didBecomeActiveNotification(_ notification: NSNotification) {
        if shouldAnimateAfterActive {
            alpha = 0
            animate()
            shouldAnimateAfterActive = false
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
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
        case slideLeft
        case slideRight
        case slideDown
        case slideUp
        case squeezeLeft
        case squeezeRight
        case squeezeDown
        case squeezeUp
        case fadeIn
        case fadeOut
        case fadeOutIn
        case fadeInLeft
        case fadeInRight
        case fadeInDown
        case fadeInUp
        case zoomIn
        case zoomOut
        case fall
        case shake
        case pop
        case flipX
        case flipY
        case morph
        case squeeze
        case flash
        case wobble
        case swing
    }
    
    public enum AnimationCurve: String {
        case easeIn
        case easeOut
        case easeInOut
        case linear
        case spring
        case easeInSine
        case easeOutSine
        case easeInOutSine
        case easeInQuad
        case easeOutQuad
        case easeInOutQuad
        case easeInCubic
        case easeOutCubic
        case easeInOutCubic
        case easeInQuart
        case easeOutQuart
        case easeInOutQuart
        case easeInQuint
        case easeOutQuint
        case easeInOutQuint
        case easeInExpo
        case easeOutExpo
        case easeInOutExpo
        case easeInCirc
        case easeOutCirc
        case easeInOutCirc
        case easeInBack
        case easeOutBack
        case easeInOutBack
    }
    
    func animatePreset() {
        alpha = 0.99
        if let animation = AnimationPreset(rawValue: animation) {
            switch animation {
            case .slideLeft:
                x = 300*force
            case .slideRight:
                x = -300*force
            case .slideDown:
                y = -300*force
            case .slideUp:
                y = 300*force
            case .squeezeLeft:
                x = 300
                scaleX = 3*force
            case .squeezeRight:
                x = -300
                scaleX = 3*force
            case .squeezeDown:
                y = -300
                scaleY = 3*force
            case .squeezeUp:
                y = 300
                scaleY = 3*force
            case .fadeIn:
                opacity = 0
            case .fadeOut:
                animateFrom = false
                opacity = 0
            case .fadeOutIn:
                let animation = CABasicAnimation()
                animation.keyPath = "opacity"
                animation.fromValue = 1
                animation.toValue = 0
                animation.timingFunction = getTimingFunction(curve: curve)
                animation.duration = CFTimeInterval(duration)
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                animation.autoreverses = true
                layer.add(animation, forKey: "fade")
            case .fadeInLeft:
                opacity = 0
                x = 300*force
            case .fadeInRight:
                x = -300*force
                opacity = 0
            case .fadeInDown:
                y = -300*force
                opacity = 0
            case .fadeInUp:
                y = 300*force
                opacity = 0
            case .zoomIn:
                opacity = 0
                scaleX = 2*force
                scaleY = 2*force
            case .zoomOut:
                animateFrom = false
                opacity = 0
                scaleX = 2*force
                scaleY = 2*force
            case .fall:
                animateFrom = false
                rotate = 15 * CGFloat(CGFloat.pi/180)
                y = 600*force
            case .shake:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "position.x"
                animation.values = [0, 30*force, -30*force, 30*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.timingFunction = getTimingFunction(curve: curve)
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(animation, forKey: "shake")
            case .pop:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.scale"
                animation.values = [0, 0.2*force, -0.2*force, 0.2*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.timingFunction = getTimingFunction(curve: curve)
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(animation, forKey: "pop")
            case .flipX:
                rotate = 0
                scaleX = 1
                scaleY = 1
                var perspective = CATransform3DIdentity
                perspective.m34 = -1.0 / layer.frame.size.width/2
                
                let animation = CABasicAnimation()
                animation.keyPath = "transform"
                animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(0, 0, 0, 0))
                animation.toValue = NSValue(caTransform3D:
                    CATransform3DConcat(perspective, CATransform3DMakeRotation(CGFloat(CGFloat.pi), 0, 1, 0)))
                animation.duration = CFTimeInterval(duration)
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                animation.timingFunction = getTimingFunction(curve: curve)
                layer.add(animation, forKey: "3d")
            case .flipY:
                var perspective = CATransform3DIdentity
                perspective.m34 = -1.0 / layer.frame.size.width/2
                
                let animation = CABasicAnimation()
                animation.keyPath = "transform"
                animation.fromValue = NSValue(caTransform3D:
                    CATransform3DMakeRotation(0, 0, 0, 0))
                animation.toValue = NSValue(caTransform3D:
                    CATransform3DConcat(perspective,CATransform3DMakeRotation(CGFloat(CGFloat.pi), 1, 0, 0)))
                animation.duration = CFTimeInterval(duration)
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                animation.timingFunction = getTimingFunction(curve: curve)
                layer.add(animation, forKey: "3d")
            case .morph:
                let morphX = CAKeyframeAnimation()
                morphX.keyPath = "transform.scale.x"
                morphX.values = [1, 1.3*force, 0.7, 1.3*force, 1]
                morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphX.timingFunction = getTimingFunction(curve: curve)
                morphX.duration = CFTimeInterval(duration)
                morphX.repeatCount = repeatCount
                morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(morphX, forKey: "morphX")
                
                let morphY = CAKeyframeAnimation()
                morphY.keyPath = "transform.scale.y"
                morphY.values = [1, 0.7, 1.3*force, 0.7, 1]
                morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphY.timingFunction = getTimingFunction(curve: curve)
                morphY.duration = CFTimeInterval(duration)
                morphY.repeatCount = repeatCount
                morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(morphY, forKey: "morphY")
            case .squeeze:
                let morphX = CAKeyframeAnimation()
                morphX.keyPath = "transform.scale.x"
                morphX.values = [1, 1.5*force, 0.5, 1.5*force, 1]
                morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphX.timingFunction = getTimingFunction(curve: curve)
                morphX.duration = CFTimeInterval(duration)
                morphX.repeatCount = repeatCount
                morphX.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(morphX, forKey: "morphX")
                
                let morphY = CAKeyframeAnimation()
                morphY.keyPath = "transform.scale.y"
                morphY.values = [1, 0.5, 1, 0.5, 1]
                morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                morphY.timingFunction = getTimingFunction(curve: curve)
                morphY.duration = CFTimeInterval(duration)
                morphY.repeatCount = repeatCount
                morphY.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(morphY, forKey: "morphY")
            case .flash:
                let animation = CABasicAnimation()
                animation.keyPath = "opacity"
                animation.fromValue = 1
                animation.toValue = 0
                animation.duration = CFTimeInterval(duration)
                animation.repeatCount = repeatCount * 2.0
                animation.autoreverses = true
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(animation, forKey: "flash")
            case .wobble:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.rotation"
                animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(animation, forKey: "wobble")
                
                let x = CAKeyframeAnimation()
                x.keyPath = "position.x"
                x.values = [0, 30*force, -30*force, 30*force, 0]
                x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                x.timingFunction = getTimingFunction(curve: curve)
                x.duration = CFTimeInterval(duration)
                x.isAdditive = true
                x.repeatCount = repeatCount
                x.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(x, forKey: "x")
            case .swing:
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.rotation"
                animation.values = [0, 0.3*force, -0.3*force, 0.3*force, 0]
                animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
                animation.duration = CFTimeInterval(duration)
                animation.isAdditive = true
                animation.repeatCount = repeatCount
                animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
                layer.add(animation, forKey: "swing")
            }
        }
    }
    
    func getTimingFunction(curve: String) -> CAMediaTimingFunction {
        if let curve = AnimationCurve(rawValue: curve) {
            switch curve {
            case .easeIn: return CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
            case .easeOut: return CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            case .easeInOut: return CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            case .linear: return CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            case .spring: return CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(force/3), 1, 1)
            case .easeInSine: return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
            case .easeOutSine: return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
            case .easeInOutSine: return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
            case .easeInQuad: return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
            case .easeOutQuad: return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
            case .easeInOutQuad: return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
            case .easeInCubic: return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
            case .easeOutCubic: return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
            case .easeInOutCubic: return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
            case .easeInQuart: return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
            case .easeOutQuart: return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
            case .easeInOutQuart: return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
            case .easeInQuint: return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
            case .easeOutQuint: return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
            case .easeInOutQuint: return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
            case .easeInExpo: return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
            case .easeOutExpo: return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
            case .easeInOutExpo: return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
            case .easeInCirc: return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
            case .easeOutCirc: return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
            case .easeInOutCirc: return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
            case .easeInBack: return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
            case .easeOutBack: return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
            case .easeInOutBack: return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
            }
        }
        return CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
    }
    
    func getAnimationOptions(curve: String) -> UIView.AnimationOptions {
        if let curve = AnimationCurve(rawValue: curve) {
            switch curve {
            case .easeIn: return UIView.AnimationOptions.curveEaseIn
            case .easeOut: return UIView.AnimationOptions.curveEaseOut
            case .easeInOut: return UIView.AnimationOptions()
            default: break
            }
        }
        return UIView.AnimationOptions.curveLinear
    }
    
    public func animate() {
        animateFrom = true
        animatePreset()
        setView {}
    }
    
    public func animateNext(completion: @escaping () -> ()) {
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
    
    public func animateToNext(completion: @escaping () -> ()) {
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
                if UIApplication.shared.applicationState != .active {
                    shouldAnimateAfterActive = true
                    return
                }
                alpha = 0
                animate()
            }
        }
    }
    
    func setView(completion: @escaping () -> ()) {
        if animateFrom {
            let translate = CGAffineTransform(translationX: self.x, y: self.y)
            let scale = CGAffineTransform(scaleX: self.scaleX, y: self.scaleY)
            let rotate = CGAffineTransform(rotationAngle: self.rotate)
            let translateAndScale = translate.concatenating(scale)
            self.transform = rotate.concatenating(translateAndScale)
            
            self.alpha = self.opacity
        }
        
        UIView.animate( withDuration: TimeInterval(duration),
                        delay: TimeInterval(delay),
                        usingSpringWithDamping: damping,
                        initialSpringVelocity: velocity,
                        options: [getAnimationOptions(curve: curve), UIView.AnimationOptions.allowUserInteraction],
                        animations: { [weak self] in
                            if let _self = self
                            {
                                if _self.animateFrom {
                                    _self.transform = CGAffineTransform.identity
                                    _self.alpha = 1
                                }
                                else {
                                    let translate = CGAffineTransform(translationX: _self.x, y: _self.y)
                                    let scale = CGAffineTransform(scaleX: _self.scaleX, y: _self.scaleY)
                                    let rotate = CGAffineTransform(rotationAngle: _self.rotate)
                                    let translateAndScale = translate.concatenating(scale)
                                    _self.transform = rotate.concatenating(translateAndScale)
                                    
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
