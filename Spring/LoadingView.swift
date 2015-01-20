//
//  LoadingView.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-10.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

public class LoadingView: UIView {

    @IBOutlet public weak var indicatorView: SpringView!

    override public func awakeFromNib() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = degreesToRadians(0)
        animation.toValue = degreesToRadians(360)
        animation.duration = 0.9
        animation.repeatCount = HUGE
        indicatorView.layer.addAnimation(animation, forKey: "")
    }

    class func designCodeLoadingView() -> UIView {
        return NSBundle(forClass: self).loadNibNamed("LoadingView", owner: self, options: nil)[0] as UIView
    }
}

public extension UIView {

    struct LoadingViewConstants {
        static let Tag = 1000
    }

    public func showLoading() {

        if let loadingXibView = self.viewWithTag(LoadingViewConstants.Tag) {
            // If loading view is already found in current view hierachy, do nothing
            return
        }

        let loadingXibView = LoadingView.designCodeLoadingView()
        loadingXibView.frame = self.bounds
        loadingXibView.tag = LoadingViewConstants.Tag
        self.addSubview(loadingXibView)

        loadingXibView.alpha = 0
        spring(0.7, {
            loadingXibView.alpha = 1
        })
    }

    public func hideLoading() {

        if let loadingXibView = self.viewWithTag(LoadingViewConstants.Tag) {
            loadingXibView.alpha = 1

            springWithCompletion(0.7, {
                loadingXibView.alpha = 0
                loadingXibView.transform = CGAffineTransformMakeScale(3, 3)
            }, { (completed) -> Void in
                loadingXibView.removeFromSuperview()
            })
        }
    }

}
