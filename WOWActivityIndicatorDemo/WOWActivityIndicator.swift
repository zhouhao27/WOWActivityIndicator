//
//  WOWActivityIndicator.swift
//  WOWActivityIndicatorDemo
//
//  Created by Zhou Hao on 11/08/15.
//  Copyright © 2015年 Zeus. All rights reserved.
//

import UIKit

@IBDesignable
public class WOWActivityIndicator: UIView {
    
    // MARK: private member variables
    var spinnerReplicator : CAReplicatorLayer!
    var marker : CALayer!
    
    // MARK: Inspectable variables
    @IBInspectable public var markerCount : Int = 6 {

        didSet {
            if markerCount < 6 {
                markerCount = 6
            }
            setup()
        }
    }
    
    @IBInspectable public var cornerRadius : CGFloat = 5.0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable public var thickness : CGFloat = 16.0 {
        didSet {
            setup()
        }
    }
    @IBInspectable public var length  : CGFloat = 24.0 {
        didSet {
            setup()
        }
    }
    @IBInspectable public var padding : CGFloat = 5.0 {
        didSet {
            setup()
        }
    }
    @IBInspectable public var markerRadiusFactor : CGFloat = 0.5 {
        didSet {
            if markerRadiusFactor > 0.5 {
                markerRadiusFactor = 0.5
            } else if markerRadiusFactor < -0.5 {
                markerRadiusFactor = -0.5
            }
            setup()
        }
    }
    @IBInspectable public var duration : Double = 1.0
    @IBInspectable public var isFading : Bool = true
    @IBInspectable public var isScaling : Bool = false
    @IBInspectable public var scaleFactor : CGFloat = 0.01

#if !TARGET_INTERFACE_BUILDER
    // This called before properties setup in IB
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
      // This called before properties setup in IB so that I won't use it
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

#endif
    
    public override func awakeFromNib() {
        
        setup()
    }
    
    // This will be called in build time in IB so that it will be shown correctly
    // in storyboard
    public override func prepareForInterfaceBuilder() {
        
        setup()
    }
    
    func setup() {
        
        if spinnerReplicator != nil {
            spinnerReplicator.removeFromSuperlayer()
        }
        
        spinnerReplicator = CAReplicatorLayer()
        spinnerReplicator.bounds = self.bounds
        spinnerReplicator.position = CGPointMake(self.frame.width/2.0,self.frame.height/2.0)
        
        let angle = CGFloat(2.0*M_PI)/CGFloat(markerCount)
        let instanceRotation = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0)
        
        spinnerReplicator.instanceCount = markerCount
        spinnerReplicator.instanceTransform = instanceRotation

        if marker != nil {
            marker.removeFromSuperlayer()
        }
        marker = CALayer()
        let radius = min(self.frame.width,self.frame.height)/2
        
        marker.bounds = CGRectMake(0, 0, thickness, length)
        marker.cornerRadius = min(thickness,length)*markerRadiusFactor
        marker.backgroundColor = tintColor.CGColor
        
        marker.position = CGPointMake(self.bounds.width*0.5,self.bounds.height*0.5 + radius - length - padding)
        
        spinnerReplicator.addSublayer(marker)
        self.layer.addSublayer(spinnerReplicator)
        
    }
    
    // MARK: public methods
    public func startAnimation() {

        let markerAnimationDuration = duration/Double(markerCount)
        spinnerReplicator.instanceDelay = markerAnimationDuration
        
        if isFading {
            marker.opacity = 0
            
            // fade effect
            let fade = CABasicAnimation(keyPath: "opacity")
            fade.fromValue = 1.0
            fade.toValue = 0.0
            fade.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            fade.repeatCount = Float.infinity
            fade.duration = duration
            
            marker.addAnimation(fade, forKey: "")
        }
        
        // shrink effect
        if isScaling {
            marker.transform = CATransform3DMakeScale(scaleFactor, scaleFactor, 1)
            let shrink = CABasicAnimation(keyPath:"transform.scale")
            shrink.fromValue = 1.0
            shrink.toValue = scaleFactor
            shrink.duration = duration
            shrink.repeatCount = Float.infinity
            
            marker.addAnimation(shrink,forKey:"")
        }
    }
    
    public func stopAnimation() {
        
        spinnerReplicator.removeFromSuperlayer()
        spinnerReplicator = nil
    }

}
