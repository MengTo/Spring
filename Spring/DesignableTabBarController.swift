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

    @IBInspectable var normalTint: UIColor = .clear {
        didSet {
            UITabBar.appearance().tintColor = normalTint
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: normalTint], for: UIControl.State())
        }
    }

    @IBInspectable var selectedTint: UIColor = UIColor.clear {
        didSet {
            UITabBar.appearance().tintColor = selectedTint
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: selectedTint], for: .selected)
        }
    }

    @IBInspectable var fontName: String = "" {
        didSet {
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: normalTint, .font: UIFont(name: fontName, size: 11)!], for: UIControl.State())
        }
    }

    @IBInspectable var firstSelectedImage: UIImage? {
        didSet {
            if let image = firstSelectedImage {
                var tabBarItems = tabBar.items
                tabBarItems?[0].selectedImage = image.withRenderingMode(.alwaysTemplate)
            }
        }
    }

    @IBInspectable var secondSelectedImage: UIImage? {
        didSet {
            if let image = secondSelectedImage {
                var tabBarItems = tabBar.items
                tabBarItems?[1].selectedImage = image.withRenderingMode(.alwaysTemplate)
            }
        }
    }

    @IBInspectable var thirdSelectedImage: UIImage? {
        didSet {
            if let image = thirdSelectedImage {
                var tabBarItems = tabBar.items
                tabBarItems?[2].selectedImage = image.withRenderingMode(.alwaysTemplate)
            }
        }
    }

    @IBInspectable var fourthSelectedImage: UIImage? {
        didSet {
            if let image = fourthSelectedImage {
                var tabBarItems = tabBar.items
                tabBarItems?[3].selectedImage = image.withRenderingMode(.alwaysTemplate)
            }
        }
    }

    @IBInspectable var fifthSelectedImage: UIImage? {
        didSet {
            if let image = fifthSelectedImage {
                var tabBarItems = tabBar.items
                tabBarItems?[4].selectedImage = image.withRenderingMode(.alwaysTemplate)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tabBarItems = tabBar.items {

            for item in tabBarItems {
                if let image = item.image {
                    item.image = image.imageWithColor(tintColor: normalTint).withRenderingMode(.alwaysOriginal)
                }
            }
        }
    }
}

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)

        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        context!.setBlendMode(.normal)

        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.clip(to: rect, mask: cgImage!)
        tintColor.setFill()
        context!.fill(rect)

        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return newImage
    }
}
