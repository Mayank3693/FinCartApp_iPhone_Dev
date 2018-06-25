//
//  KycScanOrManualVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 1/31/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton
import AVFoundation

class KycScanOrManualVC: UIViewController {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var scanAadharBtn = PressableButton()
    var fillManualBtn = PressableButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageDesign()
        
        // Do any additional setup after loading the view.
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addNav()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="ADDRESS DETAILS"
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
        let QRScanRectLayer = CAShapeLayer()
        QRScanRectLayer.path = UIBezierPath(roundedRect: CGRect(x: 15, y: 15, width: dimensions.SCREEN_WIDTH-30, height: dimensions.SCREEN_HEIGHT/2-52), cornerRadius: 0).cgPath
        QRScanRectLayer.fillColor = UIColor.white.cgColor
        QRScanRectLayer.strokeColor=UIColor.black.cgColor
        QRScanRectLayer.borderWidth=1
        
        let fillManualRectLayer = CAShapeLayer()
        fillManualRectLayer.path = UIBezierPath(roundedRect: CGRect(x: 15, y: dimensions.SCREEN_HEIGHT/2-27, width: dimensions.SCREEN_WIDTH-30, height: dimensions.SCREEN_HEIGHT/2-52), cornerRadius: 0).cgPath
        fillManualRectLayer.fillColor = UIColor.white.cgColor
        fillManualRectLayer.strokeColor=UIColor.black.cgColor
        fillManualRectLayer.borderWidth=1
        
        scanAadharBtn = PressableButton(frame: CGRect(x:25,y:dimensions.SCREEN_HEIGHT/2-100,width:dimensions.SCREEN_WIDTH-50,height:50))
        scanAadharBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        scanAadharBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        scanAadharBtn.setTitle("SCAN AADHAR QR CODE", for: .normal)
        scanAadharBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        scanAadharBtn.shadowHeight = 3
        scanAadharBtn.cornerRadius = 5
        scanAadharBtn.addTarget(self, action: #selector(KycScanOrManualVC.scanAadhar(_:)), for: .touchUpInside)
        
        let qrCodeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2-60,y:35,width:120,height:120))
        qrCodeImg.image=images.qrCode
        
        fillManualBtn = PressableButton(frame: CGRect(x:25,y:dimensions.SCREEN_HEIGHT-140,width:dimensions.SCREEN_WIDTH-50,height:50))
        fillManualBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        fillManualBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        fillManualBtn.setTitle("FILL MANUALLY", for: .normal)
        fillManualBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        fillManualBtn.shadowHeight = 3
        fillManualBtn.cornerRadius = 5
        fillManualBtn.addTarget(self, action: #selector(KycScanOrManualVC.fillManualBtnAction(_:)), for: .touchUpInside)
        
        let fillManualImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2-60,y:dimensions.SCREEN_HEIGHT/2-7,width:120,height:120))
        fillManualImg.image=images.file
        
        view.layer.addSublayer(QRScanRectLayer)
        view.layer.addSublayer(fillManualRectLayer)
        view.addSubview(scanAadharBtn)
        view.addSubview(fillManualBtn)
        view.addSubview(qrCodeImg)
        view.addSubview(fillManualImg)

    }
    
    @objc func scanAadhar(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "KycScanVC") as! KycScanVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func fillManualBtnAction(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "KycBasicDetailsFormVC") as! KycBasicDetailsFormVC
        controller.controller="fillManual"
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
