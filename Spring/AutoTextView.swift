//
//  AutoTextView.swift
//  SpringApp
//
//  Created by Meng To on 2015-03-27.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

class AutoTextView: UITextView {
    override func intrinsicContentSize() -> CGSize {
        var size = self.sizeThatFits(CGSizeMake(self.frame.size.width, CGFloat.max))
        size.width = self.frame.size.width
        if text.length == 0 {
            size.height = 0
        }
        
        contentInset = UIEdgeInsetsMake(-4, -4, -4, -4)
        layoutIfNeeded()
        
        return size
    }
}