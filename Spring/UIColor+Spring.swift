// The MIT License (MIT)
//
// Copyright (c) 2015 Giacomo Piva (me@giacomopiva.com)
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

extension UIColor {

    // This method returns a UIColor from a Hex string (eg. #ffffff)
    // Usage: let whiteColor = UIColor.fromHexString("#ffffff")
    //
    class func fromHexString(hexString:String) -> UIColor {
        var str:String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet)
        var rgb:UInt32 = 0
        str = str.uppercaseString
        if (str.hasPrefix("#")) {
            str = str.substringFromIndex(advance(str.startIndex, 1))
        }
        if (countElements(str) != 6) {
            if countElements(str) == 3 {
                str = "".stringByAppendingString("\(str[0])")
                    .stringByAppendingString("\(str[0])")
                    .stringByAppendingString("\(str[1])")
                    .stringByAppendingString("\(str[1])")
                    .stringByAppendingString("\(str[2])")
                    .stringByAppendingString("\(str[2])")
            } else {
                return UIColor.grayColor()
            }
        }
        NSScanner(string: str).scanHexInt(&rgb)
        return UIColor(
            red:    CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue:   CGFloat(rgb & 0x0000FF) / 255.0,
            alpha:  CGFloat(1.0)
        )
    }
}

extension String {
    
    // "abcde"[0] === 'a'
    //
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
}
