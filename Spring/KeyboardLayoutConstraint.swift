// The MIT License (MIT)
//
// Copyright (c) 2015 James Tang (j@jamztang.com)
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
public class KeyboardLayoutConstraint: NSLayoutConstraint {
    private var offset: CGFloat = 0
    
    private var visibleKeyboardHeight: CGFloat = 0 {
        didSet {
            constant = offset + visibleKeyboardHeight
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        offset = constant
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShowNotification),
            name: .UIKeyboardWillShow,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHideNotification),
            name: .UIKeyboardWillHide,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        guard let frame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        visibleKeyboardHeight = frame.size.height
        
        animateChanges(accordingTo: userInfo)
    }
    
    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        visibleKeyboardHeight = 0
        
        animateChanges(accordingTo: userInfo)
    }
    
    private func animateChanges(accordingTo userInfo: [AnyHashable: Any]) {
        guard
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let options = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
            else { return }
        
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: UIView.AnimationOptions(rawValue: options),
            animations: UIApplication.shared.keyWindow!.layoutIfNeeded
        )
    }
}
#endif
