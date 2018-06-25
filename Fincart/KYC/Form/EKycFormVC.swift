//
//  FinCartKYCCheckVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 1/30/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton
import Alamofire
import SwiftSoup

class EKycFormVC: UIViewController,UITextFieldDelegate,UIWebViewDelegate {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var investorTypeBtn=UIButton()
    var panCardTextField=UITextField()
    var nameTextField=UITextField()
    var emailTextField=UITextField()
    var mobileTextField=UITextField()
    var aadharTextField=UITextField()
    var mobileText=String()
    var emailText=String()
    var panCardText=String()
    var proceedButton = PressableButton()
    var skipButton = PressableButton()
    var errorLbl=UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        self.pageDesign()
        
    }
    
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="E-KYC"
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:10,height:10))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(KYCInvestorTypeVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
    }
    
    @objc func backAction(_ sender:UIButton){
        UserDefaults.standard.removeObject(forKey: "error")

        _ = self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SVProgressHUD.dismiss()

        let errorUserDefaults=UserDefaults.standard
        if(errorUserDefaults.value(forKey: "error") != nil){
            errorLbl.text=errorUserDefaults.value(forKey: "error") as? String
            errorLbl.isHidden=false
        }
    }
    func pageDesign(){
        
        panCardTextField=UITextField(frame:CGRect(x:15,y:15,width:dimensions.SCREEN_WIDTH-30,height:44))
        panCardTextField.layer.cornerRadius=6
        panCardTextField.layer.masksToBounds=true
        panCardTextField.layer.borderColor=UIColor.lightGray.cgColor
        panCardTextField.layer.borderWidth=0.6
        panCardTextField.delegate=self
        panCardTextField.text=panCardText
        panCardTextField.font=UIFont.systemFont(ofSize: 14)
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        panCardTextField.autocapitalizationType = .allCharacters

        panCardTextField.attributedPlaceholder = NSAttributedString(string: "Pan Card Number", attributes:attributes)
        let panCardIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 44))
        panCardTextField.leftView = panCardIndentView
        panCardTextField.leftViewMode = .always
        
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        
        let nameIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 44))
        nameTextField=UITextField(frame:CGRect(x:15,y:panCardTextField.frame.origin.y+panCardTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-30,height:44))
        nameTextField.layer.cornerRadius=6
        nameTextField.layer.masksToBounds=true
        nameTextField.layer.borderColor=UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth=0.6
        nameTextField.delegate=self
        nameTextField.leftView = nameIndentView
        nameTextField.leftViewMode = .always
        nameTextField.font=UIFont.systemFont(ofSize: 14)
        
        let aadharIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 44))
        aadharTextField=UITextField(frame:CGRect(x:15,y:nameTextField.frame.origin.y+nameTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-30,height:44))
        aadharTextField.layer.cornerRadius=6
        aadharTextField.layer.masksToBounds=true
        aadharTextField.layer.borderColor=UIColor.lightGray.cgColor
        aadharTextField.layer.borderWidth=0.6
        aadharTextField.delegate=self
        aadharTextField.keyboardType = .numberPad
        aadharTextField.leftView = aadharIndentView
        aadharTextField.leftViewMode = .always
        aadharTextField.font=UIFont.systemFont(ofSize: 14)

        if finCartUserDefaults.retrieveInvestorTypeKey() == "02"{
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Guardian Name (Name On Pan Card)", attributes:attributes)
            aadharTextField.attributedPlaceholder = NSAttributedString(string: "Guardian Aadhar Number", attributes:attributes)
            
        }
        else {
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Your Name (Name On Pan Card)", attributes:attributes)
            aadharTextField.attributedPlaceholder = NSAttributedString(string: "Aadhar Number", attributes:attributes)
            
        }
        
        let emailIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 44))
        emailTextField=UITextField(frame:CGRect(x:15,y:aadharTextField.frame.origin.y+aadharTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-30,height:44))
        emailTextField.layer.cornerRadius=6
        emailTextField.layer.masksToBounds=true
        emailTextField.layer.borderColor=UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth=0.6
        emailTextField.delegate=self
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Investor Email", attributes:attributes)
        emailTextField.leftView = emailIndentView
        emailTextField.leftViewMode = .always
        emailTextField.text=emailText
        emailTextField.font=UIFont.systemFont(ofSize: 14)

        let mobileIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 44))
        mobileTextField=UITextField(frame:CGRect(x:15,y:emailTextField.frame.origin.y+emailTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-30,height:44))
        mobileTextField.layer.cornerRadius=6
        mobileTextField.layer.masksToBounds=true
        mobileTextField.layer.borderColor=UIColor.lightGray.cgColor
        mobileTextField.layer.borderWidth=0.6
        mobileTextField.delegate=self
        mobileTextField.attributedPlaceholder = NSAttributedString(string: "Mobile (Mobile On Aadhar Card)", attributes:attributes)
        mobileTextField.leftView = mobileIndentView
        mobileTextField.leftViewMode = .always
        mobileTextField.text=mobileText
        mobileTextField.font=UIFont.systemFont(ofSize: 14)
        mobileTextField.keyboardType = .numberPad
        
        proceedButton = PressableButton(frame: CGRect(x:15,y:mobileTextField.frame.origin.y+mobileTextField.frame.size.height+30,width:dimensions.SCREEN_WIDTH/2-25,height:44))
        proceedButton.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        proceedButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        proceedButton.setTitle("PROCEED TO E-KYC", for: .normal)
        proceedButton.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        proceedButton.shadowHeight = 3
        proceedButton.addTarget(self, action: #selector(EKycFormVC.proceedToEKyc(_:)), for: .touchUpInside)
        proceedButton.cornerRadius = 5
        
        skipButton = PressableButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+10,y:mobileTextField.frame.origin.y+mobileTextField.frame.size.height+30,width:dimensions.SCREEN_WIDTH/2-25,height:44))
        skipButton.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        skipButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        skipButton.setTitle("SKIP", for: .normal)
        skipButton.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        skipButton.shadowHeight = 3
        skipButton.cornerRadius = 5
        skipButton.addTarget(self, action: #selector(EKycFormVC.skipKYC(_:)), for: .touchUpInside)
        
        errorLbl=UILabel(frame:CGRect(x:15,y:proceedButton.frame.origin.y+proceedButton.frame.size.height,width:dimensions.SCREEN_WIDTH-30,height:100))
        errorLbl.textColor=UIColor.red
        errorLbl.font=UIFont.boldSystemFont(ofSize: 14)
        errorLbl.numberOfLines=0
        errorLbl.textAlignment = .center
        errorLbl.isHidden=true
        
        view.addSubview(panCardTextField)
        view.addSubview(nameTextField)
        view.addSubview(aadharTextField)
        view.addSubview(emailTextField)
        view.addSubview(mobileTextField)
        view.addSubview(errorLbl)
        view.addSubview(proceedButton)
        view.addSubview(skipButton)
    }
    @objc func proceedToEKyc(_ sender:UIButton){
        
        if self.aadharTextField.text?.isEmpty == true {
            self.utils.popUp(title: "", message: "Aadhar card cannot be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if self.nameTextField.text?.isEmpty == true {
            self.utils.popUp(title: "", message: "User Name cannot be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }              
        if (panCardTextField.text?.count)! < 10 {
            self.utils.popUp(title: "", message: "Invalid pan card length")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        UserDefaults.standard.removeObject(forKey: "error")
        
        FinCartUserDefaults.sharedInstance.saveAadhar(aadharTextField.text!)
        FinCartUserDefaults.sharedInstance.saveName(nameTextField.text!)

        let controller=self.storyboard?.instantiateViewController(withIdentifier: "EKYCWebView") as! EKYCWebView
        controller.panDetails=panCardTextField.text!
        controller.email=emailTextField.text!
        controller.aadhar=aadharTextField.text!
        controller.mobile=mobileTextField.text!

        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func skipKYC(_ sender:UIButton){
      
        if self.aadharTextField.text?.isEmpty == true {
            self.utils.popUp(title: "", message: "Aadhar card cannot be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if self.nameTextField.text?.isEmpty == true {
            self.utils.popUp(title: "", message: "User Name cannot be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if (panCardTextField.text?.count)! < 10 {
            self.utils.popUp(title: "", message: "Invalid pan card length")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        UserDefaults.standard.removeObject(forKey: "error")
        FinCartUserDefaults.sharedInstance.saveAadhar(aadharTextField.text!)
        FinCartUserDefaults.sharedInstance.saveName(nameTextField.text!)

        let controller=self.storyboard?.instantiateViewController(withIdentifier: "KycScanOrManualVC") as! KycScanOrManualVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.panCardTextField.resignFirstResponder()
        self.aadharTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.nameTextField.resignFirstResponder()
        self.mobileTextField.resignFirstResponder()

        return true
    }
}
