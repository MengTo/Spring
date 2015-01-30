//
//  KeyboardLayoutConstraint.swift
//  DesignerNewsApp
//
//  Created by James Tang on 30/1/15.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit

public class KeyboardLayoutConstraint: NSLayoutConstraint {

    private var offset : CGFloat = 0
    private var keyboardVisibleHeight : CGFloat = 0

    override public func awakeFromNib() {
        super.awakeFromNib()

        offset = constant

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // MARK: Notification

    func keyboardWillShowNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let frameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
                let frame = frameValue.CGRectValue()
                keyboardVisibleHeight = frame.size.height
            }

            self.updateConstant()
            switch (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber) {
            case let (.Some(duration), .Some(curve)):

                let options = UIViewAnimationOptions(curve.unsignedLongValue)

                UIView.animateWithDuration(
                    NSTimeInterval(duration.doubleValue),
                    delay: 0,
                    options: options,
                    animations: {
                        UIApplication.sharedApplication().keyWindow?.layoutIfNeeded()
                        return
                    }, completion: { finished in
                })
            default:

                break
            }

        }

    }

    func keyboardWillHideNotification(notification: NSNotification) {
        keyboardVisibleHeight = 0
        self.updateConstant()

        if let userInfo = notification.userInfo {

            switch (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber) {
            case let (.Some(duration), .Some(curve)):

                let options = UIViewAnimationOptions(curve.unsignedLongValue)

                UIView.animateWithDuration(
                    NSTimeInterval(duration.doubleValue),
                    delay: 0,
                    options: options,
                    animations: {
                        UIApplication.sharedApplication().keyWindow?.layoutIfNeeded()
                        return
                    }, completion: { finished in
                })
            default:
                break
            }
        }
    }

    func updateConstant() {
        self.constant = offset + keyboardVisibleHeight
    }

}
