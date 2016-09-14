//
//  CodeViewController.swift
//  DesignerNewsApp
//
//  Created by Meng To on 2015-01-05.
//  Copyright (c) 2015 Meng To. All rights reserved.
//

import UIKit
import Spring

class CodeViewController: UIViewController {

    @IBOutlet weak var modalView: SpringView!
    @IBOutlet weak var codeTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    var codeText: String = ""
    var data: SpringView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalView.transform = CGAffineTransform(translationX: -300, y: 0)
        
        if data.animation != "" {
            codeText += "layer.animation = \"\(data.animation)\"\n"
        }
        if data.curve != "" {
            codeText += "layer.curve = \"\(data.curve)\"\n"
        }
        if data.force != 1 {
            codeText += String(format: "layer.force =  %.1f\n", Double(data.force))
        }
        if data.duration != 0.7 {
            codeText += String(format: "layer.duration =  %.1f\n", Double(data.duration))
        }
        if data.delay != 0 {
            codeText += String(format: "layer.delay =  %.1f\n", Double(data.delay))
        }
        if data.scaleX != 1 {
            codeText += String(format: "layer.scaleX =  %.1f\n", Double(data.scaleX))
        }
        if data.scaleY != 1 {
            codeText += String(format: "layer.scaleY =  %.1f\n", Double(data.scaleY))
        }
        if data.rotate != 0 {
            codeText += String(format: "layer.rotate =  %.1f\n", Double(data.rotate))
        }
        if data.damping != 0.7 {
            codeText += String(format: "layer.damping =  %.1f\n", Double(data.damping))
        }
        if data.velocity != 0.7 {
            codeText += String(format: "layer.velocity =  %.1f\n", Double(data.velocity))
        }
        codeText += "layer.animate()"
        
        codeTextView.text = codeText
    }
    
    @IBAction func closeButtonPressed(_ sender: AnyObject) {
        UIApplication.shared.sendAction(#selector(SpringViewController.maximizeView(_:)), to: nil, from: self, for: nil)
        
        modalView.animation = "slideRight"
        modalView.animateFrom = false
        modalView.animateToNext(completion: {
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        modalView.animate()
        
        UIApplication.shared.sendAction(#selector(SpringViewController.minimizeView(_:)), to: nil, from: self, for: nil)
    }
}
