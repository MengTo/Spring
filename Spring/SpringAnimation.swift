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

@objc public class SpringAnimation: NSObject {
    public class func spring(_ duration: TimeInterval, animations: () -> Void) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            },
            completion: nil
        )
    }

    public class func springEaseIn(_ duration: TimeInterval, animations: (() -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                animations()
            },
            completion: nil
        )
    }

    public class func springEaseOut(_ duration: TimeInterval, animations: (() -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                animations()
            }, completion: nil
        )
    }

    public class func springEaseInOut(_ duration: TimeInterval, animations: (() -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: UIViewAnimationOptions(),
            animations: {
                animations()
            }, completion: nil
        )
    }

    public class func springLinear(_ duration: TimeInterval, animations: (() -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: .curveLinear,
            animations: {
                animations()
            }, completion: nil
        )
    }

    public class func springWithDelay(_ duration: TimeInterval, delay: TimeInterval, animations: (() -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            }, completion: nil
        )
    }

    public class func springWithCompletion(_ duration: TimeInterval, animations: (() -> Void)!, completion: ((Bool) -> Void)!) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.7,
            options: [],
            animations: {
                animations()
            }, completion: { finished in
                completion(finished)
            }
        )
    }
}
