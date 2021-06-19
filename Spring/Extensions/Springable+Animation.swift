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

import Foundation

/**
 An extension for convenience methods applicable to all Springable objects relating to animation.
 */
public extension Springable {
    
    /**
     A convenience method for animating any Springable object directly with the given `Spring.AnimationPreset` with an additional optional completion handler.

     - Parameter animation: The animation type to animate from `Spring.AnimationPreset`. This will overwrite any previously set animations.
     - Parameter completion: Optional completion handler for this method. Defaults to nil.
     */
    func animate(withAnimation animation: Spring.AnimationPreset,
                 withCompletion completion: (() -> ())? = nil) {
        self.animation = animation.rawValue
        self.animateNext {
            completion?()
        }
    }
    
}
