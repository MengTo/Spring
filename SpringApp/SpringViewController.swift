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
    
    @IBAction func forceSliderChanged(_ sender: AnyObject) {
        selectedForce = sender.value(forKey: "value") as! CGFloat
        animateView()
        forceLabel.text = String(format: "Force: %.1f", Double(selectedForce))
    }
    @IBAction func durationSliderChanged(_ sender: AnyObject) {
        selectedDuration = sender.value(forKey: "value") as! CGFloat
        animateView()
        durationLabel.text = String(format: "Duration: %.1f", Double(selectedDuration))
    }
    @IBAction func delaySliderChanged(_ sender: AnyObject) {
        selectedDelay = sender.value(forKey: "value") as! CGFloat
        animateView()
        delayLabel.text = String(format: "Delay: %.1f", Double(selectedDelay))
    }

    func dampingSliderChanged(_ sender: AnyObject) {
        selectedDamping = sender.value(forKey: "value") as! CGFloat
        animateView()
    }
    
    func velocitySliderChanged(_ sender: AnyObject) {
        selectedVelocity = sender.value(forKey: "value") as! CGFloat
        animateView()
    }
    
    func scaleSliderChanged(_ sender: AnyObject) {
        selectedScale = sender.value(forKey: "value") as! CGFloat
        animateView()
    }
    
    func xSliderChanged(_ sender: AnyObject) {
        selectedX = sender.value(forKey: "value") as! CGFloat
        animateView()
    }
    
    func ySliderChanged(_ sender: AnyObject) {
        selectedY = sender.value(forKey: "value") as! CGFloat
        animateView()
    }
    
    func rotateSliderChanged(_ sender: AnyObject) {
        selectedRotate = sender.value(forKey: "value") as! CGFloat
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
    
    func minimizeView(_ sender: AnyObject) {
        SpringAnimation.spring(duration: 0.7, animations: {
            self.view.transform = CGAffineTransform(scaleX: 0.935, y: 0.935)
        })
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
    
    func maximizeView(_ sender: AnyObject) {
        SpringAnimation.spring(duration: 0.7, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
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
    
    @IBAction func ballButtonPressed(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.1, animations: {
            self.ballView.backgroundColor = UIColor(hex: "69DBFF")
        }, completion: { finished in
            UIView.animate(withDuration: 0.5, animations: {
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
        ballView.layer.add(animation, forKey: "radius")
    }
    
    @IBAction func shapeButtonPressed(_ sender: AnyObject) {
        changeBall()
    }
    
    func resetButtonPressed(_ sender: AnyObject) {
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? animations.count : animationCurves.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? animations[row].rawValue : animationCurves[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedRow = row
            animateView()
        default:
            selectedEasing = row
            animateView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let optionsViewController = segue.destination as? OptionsViewController {
            optionsViewController.delegate = self
            setOptions()
            optionsViewController.data = ballView
        }
        else if let codeViewController = segue.destination as? CodeViewController {
            setOptions()
            codeViewController.data = ballView
        }
    }
}
