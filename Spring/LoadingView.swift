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

#if !os(tvOS)
@available(tvOS, unavailable)
public class LoadingView: UIView {

    @IBOutlet public weak var indicatorView: SpringView!

    override public func awakeFromNib() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = degreesToRadians(degrees: 0)
        animation.toValue = degreesToRadians(degrees: 360)
        animation.duration = 0.9
        animation.repeatCount = HUGE
        indicatorView.layer.add(animation, forKey: "")
    }

    class func designCodeLoadingView() -> UIView {
        
        return Bundle(for: self).loadNibNamed("LoadingView", owner: self, options: nil)![0] as! UIView
    }
}

public extension UIView {

    struct LoadingViewConstants {
        static let Tag = 1000
    }

    func showLoading() {

        if self.viewWithTag(LoadingViewConstants.Tag) != nil {
            // If loading view is already found in current view hierachy, do nothing
            return
        }

        let loadingXibView = LoadingView.designCodeLoadingView()
        loadingXibView.frame = self.bounds
        loadingXibView.tag = LoadingViewConstants.Tag
        self.addSubview(loadingXibView)

        loadingXibView.alpha = 0
        SpringAnimation.spring(duration: 0.7, animations: {
            loadingXibView.alpha = 1
        })
    }

    func hideLoading() {

        if let loadingXibView = self.viewWithTag(LoadingViewConstants.Tag) {
            loadingXibView.alpha = 1

            SpringAnimation.springWithCompletion(duration: 0.7, animations: {
                loadingXibView.alpha = 0
                loadingXibView.transform = CGAffineTransform(scaleX: 3, y: 3)
            }, completion: { (completed) -> Void in
                loadingXibView.removeFromSuperview()
            })
        }
    }

}
#endif
