//
//  UILabel+DynamicType.swift
//  SpringApp
//
//  Created by Tiago Mergulhão on 29/12/17.
//  Copyright © 2017 Meng To. All rights reserved.
//

import UIKit

@available(iOS 11, *)
fileprivate enum TextStyles : String {
    
    case body, caption1, caption2, footnote, headline, subheadline
    
    case title1, title2, title3, callout
    
    case largeTitle
    
    var textStyle : UIFontTextStyle {
        switch self {
        case .body: return .body
        case .caption1: return .caption1
        case .caption2: return .caption2
        case .footnote: return .footnote
        case .headline: return .headline
        case .subheadline: return .subheadline
        
        case .callout: return .callout
        case .title1: return .title1
        case .title2: return .title2
        case .title3: return .title3
            
        case .largeTitle: return .largeTitle
        }
    }
}

public extension UILabel {
    
    @IBInspectable public var scaledFont : String {
        
        set (value) {
            
            guard #available(iOS 11, *) else { return }
            
            guard let textStyle = TextStyles(rawValue: value)?.textStyle else {
                return
            }
            let scaledFont = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
            
            font = scaledFont
            
            adjustsFontForContentSizeCategory = true
        }
        get {
            return ""
        }
    }
}
