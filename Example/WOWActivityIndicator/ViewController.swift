//
//  ViewController.swift
//  WOWActivityIndicator
//
//  Created by Zhou Hao on 12/06/2016.
//  Copyright (c) 2016 Zhou Hao. All rights reserved.
//

import UIKit
import WOWActivityIndicator

class ViewController: UIViewController {

    @IBOutlet weak var indicator1: WOWActivityIndicator!
    @IBOutlet weak var indicator2: WOWActivityIndicator!
    @IBOutlet weak var indicator3: WOWActivityIndicator!
    @IBOutlet weak var indicator4: WOWActivityIndicator!
    var indicator5 : WOWActivityIndicator!
    
    var started: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        indicator5 = WOWActivityIndicator(frame: CGRect(x: 20,y: 20,width: 80,height: 80))
        self.view.addSubview(indicator5)
        indicator5.backgroundColor = UIColor.clear
        indicator5.tintColor = UIColor.purple
        indicator5.markerCount = 8
        indicator5.markerRadiusFactor = 1
        indicator5.thickness = 8
        indicator5.length = 8        
        
        startAnimation()
    }

    func startAnimation() {
        if !self.started {
            indicator1.startAnimation()
            indicator2.startAnimation()
            indicator3.startAnimation()
            indicator4.startAnimation()
            indicator5.startAnimation()
        }
    }
    
    func stopAnimation() {
        if self.started {
            indicator1.stopAnimation()
            indicator2.stopAnimation()
            indicator3.stopAnimation()
            indicator4.stopAnimation()
            indicator5.stopAnimation()
        }
    }
    
    
}

