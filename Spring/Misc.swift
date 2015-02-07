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

public extension String {
    public var length: Int { return countElements(self) }

    public func toURL() -> NSURL? {
        return NSURL(string: self)
    }
}

public func htmlToAttributedString(text: String) -> NSAttributedString! {
    let htmlData = text.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    let htmlString = NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil, error: nil)
    
    return htmlString
}

public func degreesToRadians(degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(M_PI / 180)
}

public func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

public func imageFromURL(URL: String) -> UIImage {
    let url = NSURL(string: URL)
    let data = NSData(contentsOfURL: url!)
    return UIImage(data: data!)!
}

public extension UIColor {
    convenience init(hex: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if hex.hasPrefix("#") {
            let index   = advance(hex.startIndex, 1)
            let hex     = hex.substringFromIndex(index)
            let scanner = NSScanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexLongLong(&hexValue) {
                switch (countElements(hex)) {
                case 3:
                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
                case 4:
                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
                case 6:
                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                case 8:
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                default:
                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                println("Scan hex error")
            }
        } else {
            print("Invalid RGB string, missing '#' as prefix")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

public func rgbaToUIColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
    
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

public func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

var dateFormatter : NSDateFormatter?

public func stringFromDate(date: NSDate, format: String) -> String {

    if dateFormatter == nil {
        dateFormatter = NSDateFormatter()
    }

    dateFormatter!.dateFormat = format
    return dateFormatter!.stringFromDate(date)
}

public func dateFromString(date: String, format: String) -> NSDate {

    if dateFormatter == nil {
        dateFormatter = NSDateFormatter()
    }

    dateFormatter!.dateFormat = format
    return dateFormatter!.dateFromString(date)!
}

public func randomStringWithLength (len : Int) -> NSString {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    var randomString : NSMutableString = NSMutableString(capacity: len)
    
    for (var i=0; i < len; i++){
        var length = UInt32 (letters.length)
        var rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    
    return randomString
}

public func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
    let calendar = NSCalendar.currentCalendar()
    let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
    let now = NSDate()
    let earliest = now.earlierDate(date)
    let latest = now.laterDate(date)
    let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)
    
    if (components.year >= 2) {
        return "\(components.year)y"
    } else if (components.year >= 1){
        if (numericDates){
            return "1y"
        } else {
            return "1y"
        }
    } else if (components.month >= 2) {
        return "\(components.month)"
    } else if (components.month >= 1){
        if (numericDates){
            return "1M"
        } else {
            return "1M"
        }
    } else if (components.weekOfYear >= 2) {
        return "\(components.weekOfYear)w"
    } else if (components.weekOfYear >= 1){
        if (numericDates){
            return "1w"
        } else {
            return "1w"
        }
    } else if (components.day >= 2) {
        return "\(components.day)d"
    } else if (components.day >= 1){
        if (numericDates){
            return "1d"
        } else {
            return "1d"
        }
    } else if (components.hour >= 2) {
        return "\(components.hour)h"
    } else if (components.hour >= 1){
        if (numericDates){
            return "1h"
        } else {
            return "1h"
        }
    } else if (components.minute >= 2) {
        return "\(components.minute)m"
    } else if (components.minute >= 1){
        if (numericDates){
            return "1m"
        } else {
            return "1m"
        }
    } else if (components.second >= 3) {
        return "\(components.second)s"
    } else {
        return "now"
    }
    
}