## Installation
Put all the files in a folder called Spring and drag the folder to your Xcode project.

## Usage with Storyboard
Connect the UIView or UIButton and set the animation properties.

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
