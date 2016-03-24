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

@IBDesignable class DesignableTabBarController: UITabBarController {
    
    @IBInspectable var normalTint: UIColor = UIColor.clearColor() {
        didSet {
            UITabBar.appearance().tintColor = normalTint
            UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: normalTint], forState: UIControlState.Normal)
        }
    }
    
    @IBInspectable var selectedTint: UIColor = UIColor.clearColor() {
        didSet {
            UITabBar.appearance().tintColor = selectedTint
            UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedTint], forState:UIControlState.Selected)
        }
    }
    
    @IBInspectable var fontName: String = "" {
        didSet {
            UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: normalTint, NSFontAttributeName: UIFont(name: fontName, size: 11)!], forState: UIControlState.Normal)
        }
    }
    
    @IBInspectable var firstSelectedImage: UIImage? {
        didSet {
            if let image = firstSelectedImage {
                var tabBarItems = self.tabBar.items as! [UITabBarItem]
                tabBarItems[0].selectedImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            }
        }
    }
    
    @IBInspectable var secondSelectedImage: UIImage? {
        didSet {
            if let image = secondSelectedImage {
                var tabBarItems = self.tabBar.items as! [UITabBarItem]
                tabBarItems[1].selectedImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            }
        }
    }
    
    @IBInspectable var thirdSelectedImage: UIImage? {
        didSet {
            if let image = thirdSelectedImage {
                var tabBarItems = self.tabBar.items as! [UITabBarItem]
                tabBarItems[2].selectedImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            }
        }
    }
    
    @IBInspectable var fourthSelectedImage: UIImage? {
        didSet {
            if let image = fourthSelectedImage {
                var tabBarItems = self.tabBar.items as! [UITabBarItem]
                tabBarItems[3].selectedImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            }
        }
    }
    
    @IBInspectable var fifthSelectedImage: UIImage? {
        didSet {
            if let image = fifthSelectedImage {
                var tabBarItems = self.tabBar.items as! [UITabBarItem]
                tabBarItems[4].selectedImage = image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in self.tabBar.items as! [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithColor(self.normalTint).imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            }
        }
    }
}

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext() as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}