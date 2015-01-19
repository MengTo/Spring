//
//  loadingView.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-10.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

class loadingView: UIView {
    
    @IBOutlet weak var loadingView: SpringView!
    
    override func awakeFromNib() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.fromValue = degreesToRadians(0)
        animation.toValue = degreesToRadians(360)
        animation.duration = 0.9
        animation.repeatCount = HUGE
        loadingView.layer.addAnimation(animation, forKey: "")
    }
}

var loadingXibView: UIView!

func showLoading(view: UIView) {
    loadingXibView =
    NSBundle.mainBundle().loadNibNamed("loadingView", owner: view, options: nil)[0] as UIView
    loadingXibView.frame = view.bounds;
    view.addSubview(loadingXibView)
    
    loadingXibView.alpha = 0
    spring(0.7, {
        loadingXibView.alpha = 1
    })
}

func hideLoading() {
    if loadingXibView != nil {
        loadingXibView.alpha = 1
        spring(0.7, {
            loadingXibView.alpha = 0
            loadingXibView.transform = CGAffineTransformMakeScale(3, 3)
        })
    }
}
