//
//  BottomBorderUITextField.swift
//  Fincart
//
//  Created by Kamal on 28/12/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import Foundation

@IBDesignable

class BottomBorderUITextField: UITextField{
    
    override func draw(_ rect: CGRect) {
        setTextField()
    }
    
    @IBInspectable var SideImage:UIImage! {
        didSet{
            if SideImage != nil {
                let leftAddView = UIView.init(frame: CGRect(x: 0, y: 0, width : 25, height : self.frame.size.height-10))
                let leftimageView = UIImageView.init(frame: CGRect(x:0, y:0, width:20, height:20))
                //Create a imageView for left side.
                leftimageView.image = SideImage
                leftAddView.addSubview(leftimageView)
                self.leftView = leftAddView
                self.leftViewMode = UITextFieldViewMode.always
            }
        }
    }
    
    func getLeftSideImage() -> UIImage!{
        return SideImage;
    }
    
    @IBInspectable var bottomLineColor: UIColor = UIColor.black {
        didSet {
        }
    }
    
    func getBottomLineColor() -> CGColor {
        return bottomLineColor.cgColor;
    }
    
    @IBInspectable var cusborderWidth:CGFloat = 1.0{
        didSet{
        }
    }
    
    func getBorderWidth() -> CGFloat {
        return cusborderWidth;
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    public func setTextField(){
        self.borderStyle = UITextBorderStyle.roundedRect
        let borderLayer = CALayer()
        let widthOfBorder = getBorderWidth()
        let image : UIImage! = getLeftSideImage()
        if image != nil {
            borderLayer.frame = CGRect(x: 25, y : self.frame.size.height - widthOfBorder, width: self.frame.size.width+20, height : self.frame.size.height)
        }
        else{
            borderLayer.frame = CGRect(x: 0, y : self.frame.size.height - widthOfBorder, width: self.frame.size.width+20, height : self.frame.size.height)
        }
        borderLayer.borderWidth = widthOfBorder
        borderLayer.borderColor = getBottomLineColor()
        self.layer.addSublayer(borderLayer)
        self.layer.masksToBounds = true
        self.contentMode=UIViewContentMode.redraw
    }
}
