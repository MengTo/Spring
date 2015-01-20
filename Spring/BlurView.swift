//
//  BlurView.swift
//  ShotsDemo
//
//  Created by Meng To on 2014-07-04.
//  Copyright (c) 2014 Meng To. All rights reserved.
//

import UIKit

public func insertBlurView (view: UIView, style: UIBlurEffectStyle) {
    view.backgroundColor = UIColor.clearColor()
    
    var blurEffect = UIBlurEffect(style: style)
    var blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    view.insertSubview(blurEffectView, atIndex: 0)
}