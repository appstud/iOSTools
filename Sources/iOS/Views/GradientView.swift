//
//  GradientView.swift
//  iOSTools
//
//  Created by Vladas Zakrevskis on 12/27/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import UIKit

//Leo Dabus
//https://stackoverflow.com/questions/24380535/how-to-apply-gradient-to-background-view-of-ios-swift-app

public class GradientView : UIView {
    
    @IBInspectable public var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable public var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable public var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable public var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable public var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable public var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
