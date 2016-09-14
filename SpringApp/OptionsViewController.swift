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
    func dampingSliderChanged(_ sender: AnyObject)
    func velocitySliderChanged(_ sender: AnyObject)
    func scaleSliderChanged(_ sender: AnyObject)
    func xSliderChanged(_ sender: AnyObject)
    func ySliderChanged(_ sender: AnyObject)
    func rotateSliderChanged(_ sender: AnyObject)
    func resetButtonPressed(_ sender: AnyObject)
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
        
        modalView.transform = CGAffineTransform(translationX: 0, y: 300)
        
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

    @IBAction func dampingSliderChanged(_ sender: AnyObject) {
        selectedDamping = sender.value(forKey: "value") as! CGFloat
        delegate?.dampingSliderChanged(sender)
        dampingLabel.text = getString("Damping", value: selectedDamping)
    }
    
    @IBAction func velocitySliderChanged(_ sender: AnyObject) {
        selectedVelocity = sender.value(forKey: "value") as! CGFloat
        delegate?.velocitySliderChanged(sender)
        velocityLabel.text = getString("Velocity", value: selectedVelocity)
    }
    
    @IBAction func scaleSliderChanged(_ sender: AnyObject) {
        selectedScale = sender.value(forKey: "value") as! CGFloat
        delegate?.scaleSliderChanged(sender)
        scaleLabel.text = getString("Scale", value: selectedScale)
    }
    
    @IBAction func xSliderChanged(_ sender: AnyObject) {
        selectedX = sender.value(forKey: "value") as! CGFloat
        delegate?.xSliderChanged(sender)
        xLabel.text = getString("X", value: selectedX)
    }
    
    @IBAction func ySliderChanged(_ sender: AnyObject) {
        selectedY = sender.value(forKey: "value") as! CGFloat
        delegate?.ySliderChanged(sender)
        yLabel.text = getString("Y", value: selectedY)
    }
    
    @IBAction func rotateSliderChanged(_ sender: AnyObject) {
        selectedRotate = sender.value(forKey: "value") as! CGFloat
        delegate?.rotateSliderChanged(sender)
        rotateLabel.text = getString("Rotate", value: selectedRotate)
    }
    
    @IBAction func resetButtonPressed(_ sender: AnyObject) {
        delegate?.resetButtonPressed(sender)
        dismiss(animated: true, completion: nil)
        
        UIApplication.shared.sendAction(#selector(SpringViewController.maximizeView(_:)), to: nil, from: self, for: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
        UIApplication.shared.sendAction(#selector(SpringViewController.maximizeView(_:)), to: nil, from: self, for: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIApplication.shared.sendAction(#selector(SpringViewController.minimizeView(_:)), to: nil, from: self, for: nil)
        
        modalView.animate()
    }
    
    func getString(_ name: String, value: CGFloat) -> String {
        return String(format: "\(name): %.1f", Double(value))
    }
}
