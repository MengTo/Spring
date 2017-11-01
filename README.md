## Updated for Swift 4
Requires Xcode 9 and Swift 4.

## Installation
Drop in the Spring folder to your Xcode project (make sure to enable "Copy items if needed" and "Create groups").

Or via CocoaPods:
```
use_frameworks!
pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
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
Allows you to animate without code. Don't need to use this if you plan to start the animation in code.

## Autohide
Saves you the hassle of adding a line "layer.alpha = 0" in viewDidLoad().

## Known issue
Animations won't autostart when view is reached via performSegueWithIdentifier.

## Tutorials
- Tutorials available on [Design+Code](https://designcode.io/swiftapp).
- [Integrate Spring to existing Objective-C projects](https://medium.com/ios-apprentice/using-swift-in-objective-c-projects-f7e7a09f8be)

## ChangeLog
- At [ChangeLog](https://github.com/MengTo/Spring/wiki/CHANGELOG) wiki page

## License

Spring is released under the MIT license. See LICENSE for details.
