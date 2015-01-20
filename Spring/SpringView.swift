//
//  SpringView.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-01.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

public class SpringView: UIView, Springable {
    @IBInspectable public var autostart: Bool = false
    @IBInspectable public var autohide: Bool = false
    @IBInspectable public var animation: String = ""
    @IBInspectable public var force: CGFloat = 1
    @IBInspectable public var delay: CGFloat = 0
    @IBInspectable public var duration: CGFloat = 0.7
    @IBInspectable public var damping: CGFloat = 0.7
    @IBInspectable public var velocity: CGFloat = 0.7
    @IBInspectable public var x: CGFloat = 0
    @IBInspectable public var y: CGFloat = 0
    @IBInspectable public var scaleX: CGFloat = 1
    @IBInspectable public var scaleY: CGFloat = 1
    @IBInspectable public var rotate: CGFloat = 0
    @IBInspectable public var curve: String = ""
    public var opacity: CGFloat = 1
    public var animateFrom: Bool = false

    lazy private var spring : Spring = Spring(self)

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.spring.customAwakeFromNib()
    }
    
    override public func didMoveToWindow() {
        super.didMoveToWindow()
        self.spring.customDidMoveToWindow()
    }
    
    public func animate() {
        self.spring.animate()
    }

    public func animateNext(completion: () -> ()) {
        self.spring.animateNext(completion)
    }

    public func animateTo() {
        self.spring.animateTo()
    }

    public func animateToNext(completion: () -> ()) {
        self.spring.animateToNext(completion)
    }
}