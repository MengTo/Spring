//
//  LoadingView.swift
//  SpringApp
//
//  Created by André Schneider on 15.01.15.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

class LoadingIndicatorView: UIImageView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareAnimation()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareAnimation()
    }

    private func prepareAnimation() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = degreesToRadians(0)
        animation.toValue = degreesToRadians(360)
        animation.duration = 0.5
        animation.repeatCount = MAXFLOAT
        self.layer.addAnimation(animation, forKey: "Spinning")
    }

    func show() {
        hidden = false
        self.transform = CGAffineTransformIdentity
        spring(0.7) {
            self.alpha = 1
        }
    }

    func hide() {
        spring(0.7) {
            self.alpha = 0
            self.transform = CGAffineTransformMakeScale(3, 3)
        }
    }
}


