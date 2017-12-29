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

public protocol Springable : class {

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
    
    var spring : Spring { get set }
}

public extension Springable {
    
    public func animate() {
        spring.animate()
    }
    
    public func animateNext(completion : @escaping () -> ()) {
        spring.animateNext(completion: completion)
    }
    
    public func animateTo() {
        spring.animateTo()
    }
    
    public func animateToNext(completion : @escaping () -> ()) {
        spring.animateToNext(completion: completion)
    }
}

