//
//  SpringViewController.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-02.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit
import Spring

class SpringViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, OptionsViewControllerDelegate {

    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var delaySlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var forceSlider: UISlider!
    @IBOutlet weak var ballView: SpringView!
    @IBOutlet weak var animationPicker: UIPickerView!
    
    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 1
    var selectedDuration: CGFloat = 1
    var selectedDelay: CGFloat = 0
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 0.7
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0
    var selectedY: CGFloat = 0
    var selectedRotate: CGFloat = 0
    
    @IBAction func forceSliderChanged(sender: AnyObject) {
        selectedForce = sender.valueForKey("value") as! CGFloat
        animateView()
        forceLabel.text = String(format: "Force: %.1f", Double(selectedForce))
    }
    @IBAction func durationSliderChanged(sender: AnyObject) {
        selectedDuration = sender.valueForKey("value") as! CGFloat
        animateView()
        durationLabel.text = String(format: "Duration: %.1f", Double(selectedDuration))
    }
    @IBAction func delaySliderChanged(sender: AnyObject) {
        selectedDelay = sender.valueForKey("value") as! CGFloat
        animateView()
        delayLabel.text = String(format: "Delay: %.1f", Double(selectedDelay))
    }

    func dampingSliderChanged(sender: AnyObject) {
        selectedDamping = sender.valueForKey("value") as! CGFloat
        animateView()
    }
    
    func velocitySliderChanged(sender: AnyObject) {
        selectedVelocity = sender.valueForKey("value") as! CGFloat
        animateView()
    }
    
    func scaleSliderChanged(sender: AnyObject) {
        selectedScale = sender.valueForKey("value") as! CGFloat
        animateView()
    }
    
    func xSliderChanged(sender: AnyObject) {
        selectedX = sender.valueForKey("value") as! CGFloat
        animateView()
    }
    
    func ySliderChanged(sender: AnyObject) {
        selectedY = sender.valueForKey("value") as! CGFloat
        animateView()
    }
    
    func rotateSliderChanged(sender: AnyObject) {
        selectedRotate = sender.valueForKey("value") as! CGFloat
        animateView()
    }
    
    func animateView() {
        setOptions()
        ballView.animate()
    }
    
    func setOptions() {
        ballView.force = selectedForce
        ballView.duration = selectedDuration
        ballView.delay = selectedDelay
        
        ballView.damping = selectedDamping
        ballView.velocity = selectedVelocity
        ballView.scaleX = selectedScale
        ballView.scaleY = selectedScale
        ballView.x = selectedX
        ballView.y = selectedY
        ballView.rotate = selectedRotate
        
        ballView.animation = animations[selectedRow].rawValue
        ballView.curve = animationCurves[selectedEasing].rawValue
    }
    
    func minimizeView(sender: AnyObject) {
        SpringAnimation.spring(0.7, animations: {
            self.view.transform = CGAffineTransformMakeScale(0.935, 0.935)
        })
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    }
    
    func maximizeView(sender: AnyObject) {
        SpringAnimation.spring(0.7, animations: {
            self.view.transform = CGAffineTransformMakeScale(1, 1)
        })
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
    }

    let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]

    var animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationPicker.delegate = self
        animationPicker.dataSource = self
        animationPicker.showsSelectionIndicator = true
    }
    
    @IBAction func ballButtonPressed(sender: AnyObject) {
        
        UIView.animateWithDuration(0.1, animations: {
            self.ballView.backgroundColor = UIColor(hex: "69DBFF")
        }, completion: { finished in
            UIView.animateWithDuration(0.5, animations: {
                self.ballView.backgroundColor = UIColor(hex: "#279CEB")
            })
        })
        
        animateView()
    }
    
    var isBall = false
    func changeBall() {
        isBall = !isBall
        let animation = CABasicAnimation()
        let halfWidth = ballView.frame.width / 2
        let cornerRadius: CGFloat = isBall ? halfWidth : 10
        animation.keyPath = "cornerRadius"
        animation.fromValue = isBall ? 10 : halfWidth
        animation.toValue = cornerRadius
        animation.duration = 0.2
        ballView.layer.cornerRadius = cornerRadius
        ballView.layer.addAnimation(animation, forKey: "radius")
    }
    
    @IBAction func shapeButtonPressed(sender: AnyObject) {
        changeBall()
    }
    
    func resetButtonPressed(sender: AnyObject) {
        selectedForce = 1
        selectedDuration = 1
        selectedDelay = 0
        
        selectedDamping = 0.7
        selectedVelocity = 0.7
        selectedScale = 1
        selectedX = 0
        selectedY = 0
        selectedRotate = 0
        
        forceSlider.setValue(Float(selectedForce), animated: true)
        durationSlider.setValue(Float(selectedDuration), animated: true)
        delaySlider.setValue(Float(selectedDelay), animated: true)
        
        forceLabel.text = String(format: "Force: %.1f", Double(selectedForce))
        durationLabel.text = String(format: "Duration: %.1f", Double(selectedDuration))
        delayLabel.text = String(format: "Delay: %.1f", Double(selectedDelay))
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? animations.count : animationCurves.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? animations[row].rawValue : animationCurves[row].rawValue
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedRow = row
            animateView()
        default:
            selectedEasing = row
            animateView()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let optionsViewController = segue.destinationViewController as? OptionsViewController {
            optionsViewController.delegate = self
            setOptions()
            optionsViewController.data = ballView
        }
        else if let codeViewController = segue.destinationViewController as? CodeViewController {
            setOptions()
            codeViewController.data = ballView
        }
    }
}