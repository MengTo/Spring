//
//  OptionsViewController.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-04.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit
import Spring

protocol OptionsViewControllerDelegate: class {
    func dampingSliderChanged(sender: AnyObject)
    func velocitySliderChanged(sender: AnyObject)
    func scaleSliderChanged(sender: AnyObject)
    func xSliderChanged(sender: AnyObject)
    func ySliderChanged(sender: AnyObject)
    func rotateSliderChanged(sender: AnyObject)
    func resetButtonPressed(sender: AnyObject)
}

class OptionsViewController: UIViewController {
    
    @IBOutlet weak var modalView: SpringView!
    
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var rotateLabel: UILabel!
    
    @IBOutlet weak var dampingSlider: UISlider!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var xSlider: UISlider!
    @IBOutlet weak var ySlider: UISlider!
    @IBOutlet weak var rotateSlider: UISlider!
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 0.7
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0
    var selectedY: CGFloat = 0
    var selectedRotate: CGFloat = 0
    
    weak var delegate: OptionsViewControllerDelegate?
    var data: SpringView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalView.transform = CGAffineTransformMakeTranslation(0, 300)
        
        dampingSlider.setValue(Float(data.damping), animated: true)
        velocitySlider.setValue(Float(data.velocity), animated: true)
        scaleSlider.setValue(Float(data.scaleX), animated: true)
        xSlider.setValue(Float(data.x), animated: true)
        ySlider.setValue(Float(data.y), animated: true)
        rotateSlider.setValue(Float(data.rotate), animated: true)
                
        dampingLabel.text = getString("Damping", value: data.damping)
        velocityLabel.text = getString("Velocity", value: data.velocity)
        scaleLabel.text = getString("Scale", value: data.scaleX)
        xLabel.text = getString("x", value: data.x)
        yLabel.text = getString("y", value: data.y)
        rotateLabel.text = getString("Rotate", value: data.rotate)
    }

    @IBAction func dampingSliderChanged(sender: AnyObject) {
        selectedDamping = sender.valueForKey("value") as! CGFloat
        delegate?.dampingSliderChanged(sender)
        dampingLabel.text = getString("Damping", value: selectedDamping)
    }
    
    @IBAction func velocitySliderChanged(sender: AnyObject) {
        selectedVelocity = sender.valueForKey("value") as! CGFloat
        delegate?.velocitySliderChanged(sender)
        velocityLabel.text = getString("Velocity", value: selectedVelocity)
    }
    
    @IBAction func scaleSliderChanged(sender: AnyObject) {
        selectedScale = sender.valueForKey("value") as! CGFloat
        delegate?.scaleSliderChanged(sender)
        scaleLabel.text = getString("Scale", value: selectedScale)
    }
    
    @IBAction func xSliderChanged(sender: AnyObject) {
        selectedX = sender.valueForKey("value") as! CGFloat
        delegate?.xSliderChanged(sender)
        xLabel.text = getString("X", value: selectedX)
    }
    
    @IBAction func ySliderChanged(sender: AnyObject) {
        selectedY = sender.valueForKey("value") as! CGFloat
        delegate?.ySliderChanged(sender)
        yLabel.text = getString("Y", value: selectedY)
    }
    
    @IBAction func rotateSliderChanged(sender: AnyObject) {
        selectedRotate = sender.valueForKey("value") as! CGFloat
        delegate?.rotateSliderChanged(sender)
        rotateLabel.text = getString("Rotate", value: selectedRotate)
    }
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        delegate?.resetButtonPressed(sender)
        dismissViewControllerAnimated(true, completion: nil)
        
        UIApplication.sharedApplication().sendAction("maximizeView:", to: nil, from: self, forEvent: nil)
    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        UIApplication.sharedApplication().sendAction("maximizeView:", to: nil, from: self, forEvent: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        UIApplication.sharedApplication().sendAction("minimizeView:", to: nil, from: self, forEvent: nil)
        
        modalView.animate()
    }
    
    func getString(name: String, value: CGFloat) -> String {
        return String(format: "\(name): %.1f", Double(value))
    }
}
