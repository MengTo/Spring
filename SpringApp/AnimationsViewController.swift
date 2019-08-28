//
//  AnimationsViewController.swift
//  SpringApp
//
//  Created by 杨璨 on 2019/8/28.
//  Copyright © 2019 Meng To. All rights reserved.
//

import UIKit
import Spring

class AnimationsViewController: UIViewController {
    
    @IBOutlet weak var AnimsLabel: SpringLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(3000), execute: {
            self.AnimsLabel.text = "3"
            self.AnimsLabel.animations = ["slideUp", "fadeOut"]
            self.AnimsLabel.duration = 3
            self.AnimsLabel.animateNext {
                self.AnimsLabel.text = "2"
                self.AnimsLabel.clearAllAnimations()
                self.AnimsLabel.animation = "fadeOut"
                self.AnimsLabel.duration = 3
                self.AnimsLabel.animateNext {
                    self.AnimsLabel.text = "1"
                    self.AnimsLabel.animation = "fadeOut"
                    self.AnimsLabel.duration = 3
                    self.AnimsLabel.animateNext {
                        self.AnimsLabel.text = "Go!"
                        self.AnimsLabel.sizeToFit()
                        self.AnimsLabel.animations = ["slideDown", "fadeOut"]
                        self.AnimsLabel.duration = 3
                        self.AnimsLabel.animateTo()
                    }
                }
            }
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
