//
//  Springable+AnimateTests.swift
//  SpringAppTests
//
//  Created by Joshua James Varghese on 19.06.21.
//  Copyright © 2021 Meng To. All rights reserved.
//

import Foundation
import XCTest
import Spring

class SpringableAnimateTests: XCTestCase {
    
    let springView = SpringView()

    func testAnimationPropertySetCorrectly() {
        for animationType in Spring.AnimationPreset.allCases {
            springView.animate(withAnimation: animationType)
            
            XCTAssertEqual(springView.animation, animationType.rawValue)
        }
    }

}

