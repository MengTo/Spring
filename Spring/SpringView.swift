//
//  SpringView.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-01.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

class SpringView: UIView, Springable {

    @IBInspectable var animation: String = ""

    @IBInspectable var force: CGFloat = 1
    @IBInspectable var delay: CGFloat = 0
    @IBInspectable var duration: CGFloat = 0.7
    @IBInspectable var damping: CGFloat = 0.7
    @IBInspectable var velocity: CGFloat = 0.7
    @IBInspectable var x: CGFloat = 0
    @IBInspectable var y: CGFloat = 0
    @IBInspectable var scaleX: CGFloat = 1
    @IBInspectable var scaleY: CGFloat = 1
    @IBInspectable var rotate: CGFloat = 0
    @IBInspectable var opacity: CGFloat = 1
    @IBInspectable var animateFrom: Bool = false
    @IBInspectable var curve: String = ""

    lazy private var spring : Spring = Spring(self)

    override func awakeFromNib() {
        super.awakeFromNib()
        self.spring.awakeFromNib()
    }

    func animate() {
        self.spring.animate()
    }

    func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }

    func animateTo() {
        self.spring.animateTo()
    }

    func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}