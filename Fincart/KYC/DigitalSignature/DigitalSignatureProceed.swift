//
//  DigitalSignatureProceed.swift
//  Fincart
//
//  Created by Ankit Bisht on 2/4/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton

class DigitalSignatureProceed: UIViewController {

    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var proceedBtn = PressableButton()
    var controllerName=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        self.pageDesign()

        // Do any additional setup after loading the view.
    }
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="DIGITAL SIGNATURE"
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:20,height:20))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(KYCInvestorTypeVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
    }
    @objc func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    func pageDesign(){
        let rectLayer = CAShapeLayer()
        rectLayer.path = UIBezierPath(roundedRect: CGRect(x: 5, y: 40, width: dimensions.SCREEN_WIDTH-10, height: dimensions.SCREEN_HEIGHT-184), cornerRadius: 0).cgPath
        rectLayer.fillColor = UIColor.white.cgColor
        rectLayer.strokeColor=UIColor.black.cgColor
        rectLayer.borderWidth=1
        
        let lbl=UILabel(frame:CGRect(x:10,y:50,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl.text="Give Your Signature"
        lbl.textColor=colors.APP_THEME_COLOR
        lbl.font=UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .center
        
        let signatureImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2-80,y:dimensions.SCREEN_HEIGHT-440,width:160,height:180))
        signatureImg.image=images.signature
        
        let lbl2=UILabel(frame:CGRect(x:10,y:dimensions.SCREEN_HEIGHT-244,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl2.text="Make sure your signature fit within the frame."
        lbl2.textColor=UIColor.black
        lbl2.font=UIFont.systemFont(ofSize: 13)
        lbl2.textAlignment = .center
        
        proceedBtn = PressableButton(frame: CGRect(x:10,y:dimensions.SCREEN_HEIGHT-210,width:dimensions.SCREEN_WIDTH-20,height:50))
        proceedBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        proceedBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        proceedBtn.setTitle("PROCEED", for: .normal)
        proceedBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        proceedBtn.shadowHeight = 3
        proceedBtn.addTarget(self, action: #selector(DigitalSignatureProceed.proceedBtnAction(_:)), for: .touchUpInside)
        proceedBtn.cornerRadius = 5
        
        view.layer.addSublayer(rectLayer)
        view.addSubview(lbl)
        view.addSubview(signatureImg)
        view.addSubview(proceedBtn)
        view.addSubview(lbl2)

    }
    @objc func proceedBtnAction(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "DigitalSignatureVC") as! DigitalSignatureVC
        controller.controllerName=controllerName
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

}
