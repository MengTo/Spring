![](http://cl.ly/image/012R0D3R3x2g/download/springswift2.jpg)

## Updated for Swift 2
This update will be in this branch until Swift 2 is out of beta.

## Installation
Drop in the Spring folder to your Xcode project.

Or via CocoaPods:
```
use_frameworks!
pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift2'
```


## Usage with Storyboard
In Identity Inspector, connect the UIView to SpringView Class and set the animation properties in Attribute Inspector.

![](http://cl.ly/image/241o0G1G3S36/download/springsetup.jpg)

## Usage with Code
    layer.animation = "squeezeDown"
    layer.animate()

## Demo The Animations
![](http://cl.ly/image/1n1E2j3W3y24/springscreen.jpg)

## Chaining Animations
    layer.y = -50
    animateToNext {
      layer.animation = "fall"
      layer.animateTo()
    }

## Functions
    animate()
    animateNext { ... }
    animateTo()
    animateToNext { ... }

## Animation
    shake
    pop
    morph
    squeeze
    wobble
    swing
    flipX
    flipY
    fall
    squeezeLeft
    squeezeRight
    squeezeDown
    squeezeUp
    slideLeft
    slideRight
    slideDown
    slideUp
    fadeIn
    fadeOut
    fadeInLeft
    fadeInRight
    fadeInDown
    fadeInUp
    zoomIn
    zoomOut
    flash

## Curve
    spring
    linear
    easeIn
    easeOut
    easeInOut

## Properties
    force
    duration
    delay
    damping
    velocity
    repeatCount
    scale
    x
    y
    rotate

\* Not all properties work together. Play with the demo app.


## Autostart
Allows you to animate without code. Don't need to use this is if you plan to start the animation in code.

## Autohide
Saves you the hassle of adding a line "layer.alpha = 0" in viewDidLoad().

## Known issue
Animations won't autostart when view is reached via performSegueWithIdentifier.

Animations using IBInspectables are currently not working in iOS 7. iOS 8 is supported. We're looking for a fix. Animations in code works for both iOS 7 and 8.

This project now requires Xcode 6.3 and Swift 1.2. For old version please download [1.0.2](https://github.com/MengTo/Spring/tree/1.0.2)

## Tutorials
- Tutorials available on [Design+Code](https://designcode.io/swiftapp).
- [Integrate Spring to existing Objective-C projects](https://medium.com/ios-apprentice/using-swift-in-objective-c-projects-f7e7a09f8be)

## ChangeLog
- At [ChangeLog](https://github.com/MengTo/Spring/wiki/CHANGELOG) wiki page

## License

Spring is released under the MIT license. See LICENSE for details.
