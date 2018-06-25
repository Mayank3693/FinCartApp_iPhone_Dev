//
//  RoundRectUIButton.swift
//  Fincart
//
//  Created by Kamal on 28/12/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import Foundation

@IBDesignable

class RoundRectUIButton: UIButton{
 
    override func draw(_ rect: CGRect){
        setButton()
    }
    
    @IBInspectable var cornerRadius:CGFloat = 8.0{
        didSet {
            self.setNeedsLayout()
        }
    }
    
    func getCornerRadius()-> CGFloat {
        return cornerRadius;
    }
    
    @IBInspectable var buttonColor: UIColor = UIColor.blue{
        didSet{
            self.setNeedsLayout()
        }
    }
    
    func getButtonColor() -> CGColor {
        return buttonColor.cgColor;
    }
    
    public func setButton(){
        let roundRectLayer : CAShapeLayer? = CAShapeLayer()
        if let existingLayer = roundRectLayer {
            existingLayer.removeFromSuperlayer()
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: getCornerRadius()).cgPath
        shapeLayer.fillColor = getButtonColor()
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.layer.masksToBounds = true
        self.contentMode=UIViewContentMode.redraw
    }
}
