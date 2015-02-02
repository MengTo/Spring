![](http://cl.ly/image/3a1r1d3l3D1j/spring-logo.jpg)

## Installation
Drop in the Spring folder to your Xcode project.

### OR via CocoaPods (pre-release)

```
pod 'Spring', '~> 1.0.0'
```

---

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

## Presets
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

## Tutorials
- Tutorials available on [Design+Code](https://designcode.io/swiftapp).
- [Integrate Spring to existing Objective-C projects](https://medium.com/ios-apprentice/using-swift-in-objective-c-projects-f7e7a09f8be)

## License

Spring is released under the MIT license. See LICENSE for details.

