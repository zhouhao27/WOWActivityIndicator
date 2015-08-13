//
//  ViewController.swift
//  WOWActivityIndicatorDemo
//
//  Created by Zhou Hao on 11/08/15.
//  Copyright © 2015年 Zeus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicator1: WOWActivityIndicator!
    @IBOutlet weak var indicator2: WOWActivityIndicator!
    @IBOutlet weak var indicator3: WOWActivityIndicator!
    @IBOutlet weak var indicator4: WOWActivityIndicator!

    var indicator5 : WOWActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        indicator5 = WOWActivityIndicator(frame: CGRectMake(20,20,80,80))
        self.view.addSubview(indicator5)
        indicator5.backgroundColor = UIColor.clearColor()
        indicator5.tintColor = UIColor.orangeColor()
        indicator5.markerCount = 8
        indicator5.markerRadiusFactor = 0
        indicator5.thickness = 8
        indicator5.length = 8
        
        indicator5.startAnimation()
        
        indicator1.startAnimation()
        indicator2.startAnimation()
        indicator3.startAnimation()
        indicator4.startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopAnimation(sender: AnyObject) {
        
        indicator1.stopAnimation()
        indicator2.stopAnimation()
        indicator3.stopAnimation()
        indicator4.stopAnimation()
    }

}

