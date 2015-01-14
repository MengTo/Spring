## Installation
Drag and drop the Spring folder to your Xcode project.

## Usage with Storyboard
In Identity Inspector, connect the UIView to SpringView Class and set the animation properties in Attribute Inspector.

![](http://cl.ly/image/1006331m1L11/class.png)

![](http://cl.ly/image/40142G3d1u3N/attribute.png)

## Usage with Code
    layer.animation = "squeezeDown"
    layer.animate()

## Chaining Animations
    layer.y = -50
    animateToNext() {
      layer.animation = "fall"
      layer.animateTo()
    }

## Presets
        "shake",
        "pop",
        "morph",
        "squeeze",
        "wobble",
        "swing",
        "flipX",
        "flipY",
        "fall",
        "squeezeLeft",
        "squeezeRight",
        "squeezeDown",
        "squeezeUp",
        "slideLeft",
        "slideRight",
        "slideDown",
        "slideUp",
        "fadeIn",
        "fadeOut",
        "fadeInLeft",
        "fadeInRight",
        "fadeInDown",
        "fadeInUp",
        "zoomIn",
        "zoomOut",
        "flash",

## Curve
      "spring", 
      "linear", 
      "easeIn", 
      "easeOut", 
      "easeInOut"

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

* Not all properties work together. Play with the demo app.
