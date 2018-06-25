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
import PopupDialog

class FinCartKYCCheckVC: FinCartViewController,UITextFieldDelegate {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    var investorTypeBtn=UIButton()
    var panCardTextField=UITextField()
    var checkKYCButton = PressableButton()
    var utils=Utils()
    var responseData=String()
    var KYCMsg1=UILabel()
    var KYCMsg2=UILabel()
    var KYCMsg3=UILabel()
    var KYCMsg4=UILabel()
    var rectLayer = CAShapeLayer()
    var errorLbl=UILabel()
    var kycActiveLbl=UILabel()
    var rectLayer2 = CAShapeLayer()
    var lbl=UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOpaqueNavigationBar()
        setUpBackButton()
        self.navigationItem.title="PAN CARD VERIFICATION"
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.white]
        self.pageDesign()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        panCardTextField.text = ""
        rectLayer.isHidden=true
        KYCMsg1.isHidden=true
        KYCMsg2.isHidden=true
        KYCMsg3.isHidden=true
        KYCMsg4.isHidden=true
    }
    
    @objc func logoutAction(_ sender:UIButton){
        UserDefaults.standard.removeObject(forKey: "investorType")
        UserDefaults.standard.removeObject(forKey: "occupation")
        UserDefaults.standard.removeObject(forKey: "income")
        UserDefaults.standard.removeObject(forKey: FinCartMacros.kInvestorType)
        UserDefaults.standard.removeObject(forKey: "countryName")
        UserDefaults.standard.removeObject(forKey: "accountType")
        UserDefaults.standard.removeObject(forKey: "incomeSource")
        UserDefaults.standard.removeObject(forKey: "politicallyExposed")
        UserDefaults.standard.removeObject(forKey: "nriCountryName")
        UserDefaults.standard.removeObject(forKey: "controllerFlag")
        UserDefaults.standard.removeObject(forKey: "fatkaController")
        UserDefaults.standard.removeObject(forKey: "bankName")
        
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "userLoginScreen") as! FinCartLoginVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func pageDesign(){
        
        investorTypeBtn=UIButton(frame:CGRect(x:10,y:10,width:dimensions.SCREEN_WIDTH-20,height:60))
        investorTypeBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        investorTypeBtn.setTitleColor(UIColor.black, for: .normal)
        investorTypeBtn.layer.cornerRadius=6
        investorTypeBtn.layer.masksToBounds=true
        investorTypeBtn.layer.borderColor=UIColor.lightGray.cgColor
        investorTypeBtn.layer.borderWidth=0.6
        investorTypeBtn.setImage(images.rightArrow, for: .normal)
        investorTypeBtn.imageEdgeInsets = UIEdgeInsetsMake(20, investorTypeBtn.frame.size.width - 24, 20, 0);
        investorTypeBtn.contentHorizontalAlignment = .left
        investorTypeBtn.setTitle("Investor Type", for: .normal)
        investorTypeBtn.setTitleColor(UIColor.lightGray, for: .normal)
        investorTypeBtn.addTarget(self, action: #selector(FinCartKYCCheckVC.showInvestorType(_:)), for: .touchUpInside)
        panCardTextField=UITextField(frame:CGRect(x:15,y:90,width:dimensions.SCREEN_WIDTH-30,height:44))
        panCardTextField.placeholder="Pan Number"
        panCardTextField.layer.cornerRadius=20
        panCardTextField.layer.masksToBounds=true
        panCardTextField.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        panCardTextField.layer.borderWidth=1
        panCardTextField.autocapitalizationType = .allCharacters
        panCardTextField.delegate=self
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        panCardTextField.attributedPlaceholder = NSAttributedString(string: "Pan Number", attributes:attributes)
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 44))
        panCardTextField.leftView = indentView
        panCardTextField.leftViewMode = .always
        
        let clearTxtField=UIButton(frame:CGRect(x:panCardTextField.frame.size.width-85,y:panCardTextField.frame.origin.y,width:100,height:44))
        clearTxtField.setTitle("CHANGE", for: .normal)
        clearTxtField.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        clearTxtField.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        clearTxtField.backgroundColor=colors.APP_THEME_COLOR
        clearTxtField.layer.cornerRadius=20
        clearTxtField.layer.masksToBounds=true
        clearTxtField.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        clearTxtField.layer.borderWidth=0.6
        clearTxtField.addTarget(self, action: #selector(FinCartKYCCheckVC.clearTxtInput(_:)), for: .touchUpInside)
        
        checkKYCButton = PressableButton(frame: CGRect(x:10,y:dimensions.SCREEN_HEIGHT-124,width:dimensions.SCREEN_WIDTH-20,height:50))
        checkKYCButton.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        checkKYCButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        checkKYCButton.setTitle("CHECK KYC", for: .normal)
        checkKYCButton.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        checkKYCButton.shadowHeight = 3
        checkKYCButton.addTarget(self, action: #selector(FinCartKYCCheckVC.checkKycBtnAction(_:)), for: .touchUpInside)
        checkKYCButton.cornerRadius = 5
        
        KYCMsg1=UILabel(frame:CGRect(x:20,y:panCardTextField.frame.origin.y+panCardTextField.frame.size.height+10,width:dimensions.SCREEN_WIDTH-40,height:80))
        KYCMsg1.isHidden=true
        KYCMsg1.text="Oops.! \nYour KYC needs to be done \nbefore you start investing."
        KYCMsg1.numberOfLines=0
        KYCMsg1.textColor=colors.APP_THEME_COLOR
        
        KYCMsg2=UILabel(frame:CGRect(x
            :20,y:KYCMsg1.frame.origin.y+KYCMsg1.frame.size.height,width:dimensions.SCREEN_WIDTH-40,height:60))
        KYCMsg2.isHidden=true
        KYCMsg2.text="Don't worry \nIt's Quick, easy and paperless"
        KYCMsg2.numberOfLines=0
        KYCMsg2.textColor=UIColor.black
        
        KYCMsg3=UILabel(frame:CGRect(x:25,y:KYCMsg2.frame.origin.y+KYCMsg2.frame.size.height+5,width:dimensions.SCREEN_WIDTH-40,height:25))
        KYCMsg3.isHidden=true
        KYCMsg3.text="You just need to have"
        KYCMsg3.numberOfLines=0
        KYCMsg3.textColor=UIColor.lightGray
        
        KYCMsg4=UILabel(frame:CGRect(x:20,y:KYCMsg3.frame.origin.y+KYCMsg3.frame.size.height+5,width:dimensions.SCREEN_WIDTH-40,height:50))
        KYCMsg4.isHidden=true
        KYCMsg4.text="\t-Aadhar Number \n\t-Mobile Number(Aadhar Linked)"
        KYCMsg4.numberOfLines=0
        KYCMsg4.textColor=UIColor.black
        
        rectLayer = CAShapeLayer()
        rectLayer.path = UIBezierPath(roundedRect: CGRect(x: 15, y: KYCMsg2.frame.origin.y+KYCMsg2.frame.size.height, width: dimensions.SCREEN_WIDTH-30, height: 100), cornerRadius: 6).cgPath
        rectLayer.fillColor = UIColor.white.cgColor
        rectLayer.strokeColor=UIColor.lightGray.cgColor
        rectLayer.borderWidth=0.6
        rectLayer.isHidden=true
        
        errorLbl=UILabel()
        errorLbl.textColor=UIColor.red
        errorLbl.textAlignment = .center
        errorLbl.font=UIFont.boldSystemFont(ofSize: 14)
        errorLbl.isHidden=true
        
        kycActiveLbl=UILabel(frame:CGRect(x:15,y:panCardTextField.frame.size.height+panCardTextField.frame.origin.y+50,width:dimensions.SCREEN_WIDTH-30,height:20))
        kycActiveLbl.textColor=UIColor.black
        kycActiveLbl.textAlignment = .left
        kycActiveLbl.font=UIFont.boldSystemFont(ofSize: 18)
        kycActiveLbl.text="Hurray! Your Kyc Active."
        kycActiveLbl.isHidden=true
        
        rectLayer2 = CAShapeLayer()
        rectLayer2.path = UIBezierPath(roundedRect: CGRect(x: 15, y: kycActiveLbl.frame.origin.y+kycActiveLbl.frame.size.height+10, width: dimensions.SCREEN_WIDTH-30, height: 40), cornerRadius: 6).cgPath
        rectLayer2.fillColor = UIColor.white.cgColor
        rectLayer2.strokeColor=UIColor.lightGray.cgColor
        rectLayer2.borderWidth=0.6
        rectLayer2.isHidden=true
        
        lbl=UILabel(frame:CGRect(x:20,y:kycActiveLbl.frame.size.height+kycActiveLbl.frame.origin.y+20,width:dimensions.SCREEN_WIDTH-40,height:20))
        lbl.textColor=UIColor.lightGray
        lbl.textAlignment = .center
        lbl.font=UIFont.systemFont(ofSize: 14)
        lbl.text="You Can Proceed To Complete Profile"
        lbl.isHidden=true
        
        view.addSubview(investorTypeBtn)
        view.addSubview(panCardTextField)
        view.addSubview(clearTxtField)
        view.addSubview(KYCMsg1)
        view.addSubview(KYCMsg2)
        view.layer.addSublayer(rectLayer)
        rectLayer.addSublayer(KYCMsg3.layer)
        rectLayer.addSublayer(KYCMsg4.layer)
        
        view.addSubview(checkKYCButton)
        view.addSubview(errorLbl)
        view.addSubview(kycActiveLbl)

        view.layer.addSublayer(rectLayer2)
        view.addSubview(lbl)

    }
    
    @objc func checkKycBtnAction(_ sender:UIButton){
        
        if self.investorTypeBtn.currentTitle == "Investor Type" {
        self.utils.popUp(title: "", message: "Select Investor Type")
        self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if panCardTextField.text?.isEmpty == true {
            self.utils.popUp(title: "", message: "Pan card cannot be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if (panCardTextField.text?.count)! < 10 {
            self.utils.popUp(title: "", message: "Invalid pan card length")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if self.checkKYCButton.currentTitle == "CONTINUE" {
            self.goToBasicDetailsForm()
            return
            
        }
        if self.checkKYCButton.currentTitle == "CONTINUE FOR KYC"{
            self.continueForKYC();
            return
        }
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: "Checking...")
        
        FinCartUserDefaults.sharedInstance.savePan(panCardTextField.text!)
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        let urlString="\(FinCartMacros.kBaseUrl)\(FinCartMacros.kFinCheckPanStatusUrl)/\(panCardTextField.text!)"
        print(urlString)
        
        // i9PT8MP5TG3nAdNo_1FPWk8vC-Jzs3rCNciB_VcKpwWMRXThsif9WNkfgJB6zSnmkpo6cc1Y5tREnmi5qCuZz1QzB-Zc-H5IrRFCEHA1gtZOoPdcT_KTzs1LH7yD-DWTs9N_71f5mCsNIYePSlfd7i6ZGbGbQ3sB6UEcmjRYgjh4JG-G7Jy8kLWHvgEVu-kcdqv4I8HfKfCfEd4L4lRE6tf0Km6fxygjNtlQf7DOvJBbxAeu_Kxq9l8Fa82wzIi-Jvy0HNh5G-a5lpL3J5yaoXov3za0qxgOe9AXLhJGKDHaXst3h5quZSFbTlAFZct0CaiU-mV_uWYJwJ8Zct-dgcSbXjdNUk6nHaoOvZ9YMLLZFP2z73SVq-A34Mw58jol
        //let headers=["Authorization":"Bearer \(String(describing: finCartUserDefaults.retrieveAccessToken()))"]
//        let headers=["Authorization":"bearer lLI_ZPDcR28uMXDYViYKeRAF_qX2WM8ud4j7zsu3gQPixuUeM2gd875UcoJMQZyVvmjUrp__lsM8KENpN355Gjqn3dyHeYPDQpvzFeaGWhnH6Z6jCwlXQN7WqlvoDRMqhiv6K6m3WN8ENp_zw-AsPRBNMoRQEFu7Hj0KLYxvPLvT7IiyCTu1LCawGbf57-zvbH6Jm8FK0meyP_8wX4sXHTmR9DsGcXTrnFuBdHm0nW_zk3xdgBkfOGTYBLBhB7IpeTjhrwLqF3yxgO7g8pERmj6zJlZ1gu7IGUuBv9ZgCQp-Db88CWKs7d_fFv57RCl6-L_wKoQ7WdaJKuZv6mU25Rm_UcV-MQsbAOTqRlujH-ucJqiZk_5xvUJQg7idgViH"]
        
        let headers=["Authorization":"bearer " + finCartUserDefaults.retrieveAccessToken()!]
        print(headers)
        
        //lLI_ZPDcR28uMXDYViYKeRAF_qX2WM8ud4j7zsu3gQPixuUeM2gd875UcoJMQZyVvmjUrp__lsM8KENpN355Gjqn3dyHeYPDQpvzFeaGWhnH6Z6jCwlXQN7WqlvoDRMqhiv6K6m3WN8ENp_zw-AsPRBNMoRQEFu7Hj0KLYxvPLvT7IiyCTu1LCawGbf57-zvbH6Jm8FK0meyP_8wX4sXHTmR9DsGcXTrnFuBdHm0nW_zk3xdgBkfOGTYBLBhB7IpeTjhrwLqF3yxgO7g8pERmj6zJlZ1gu7IGUuBv9ZgCQp-Db88CWKs7d_fFv57RCl6-L_wKoQ7WdaJKuZv6mU25Rm_UcV-MQsbAOTqRlujH-ucJqiZk_5xvUJQg7idgViH
        Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON{
            response in
            
            if response.result.isSuccess {
                print(response.result.value!)
                
                if(response.result.value as! Bool == false){
                    self.checkKycStatus()
                   
                }
                else {
                    SVProgressHUD.dismiss()
                    self.errorLbl.text="Pan Number Already Registered"
                    self.errorLbl.isHidden=false
                    self.errorLbl.frame=CGRect(x:10,y:self.dimensions.SCREEN_HEIGHT-154,width:self.dimensions.SCREEN_WIDTH-20,height:20)
                }
                
            }
            else if response.result.isFailure{
                
                if let data = response.data {
                    do {
                        SVProgressHUD.dismiss()

                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        let dict:NSDictionary=json! as NSDictionary
                        self.responseData=dict.value(forKey: "Message") as! String
                        print(dict)
                    } catch {
                        
                    }
                }
                let popup = PopupDialog(title: "", message: "Your session has expired. Please login again.")
                
                let buttonOne = CancelButton(title: "OK"){
                    
//                    let controller=self.storyboard?.instantiateViewController(withIdentifier: "userLoginScreen") as! FinCartLoginVC
//                    self.navigationController?.pushViewController(controller, animated: true)
                }
                popup.addButtons([buttonOne])
                self.present(popup, animated: true, completion: nil)
                
            }
        }
    }
    func checkKycStatus(){
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        let urlString="\(FinCartMacros.kBaseUrl)\(FinCartMacros.kFinKYCStatusUrl)/\(panCardTextField.text!)"
//        let headers=["Authorization":"Bearer \(String(describing: finCartUserDefaults.retrieveAccessToken()))"]
        let headers=["Authorization":"bearer " + finCartUserDefaults.retrieveAccessToken()!]
        Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON{
            response in
            
            if response.result.isSuccess {
                SVProgressHUD.dismiss()
                print(response.result.value!)
                FinCartUserDefaults.sharedInstance.saveKycStatus((response.result.value as! NSDictionary).value(forKey: "KYC_STATUS") as! String)

                if (response.result.value as! NSDictionary).value(forKey: "KYC_STATUS") as! String == "Y"{
                    self.KYCMsg1.isHidden=true
                    self.KYCMsg2.isHidden=true
                    self.KYCMsg3.isHidden=true
                    self.KYCMsg4.isHidden=true
                    self.rectLayer.isHidden=true
                    self.errorLbl.isHidden=true
                    self.lbl.isHidden=false
                    self.kycActiveLbl.isHidden=false
                    self.rectLayer2.isHidden=false

                    self.checkKYCButton.setTitle("CONTINUE", for: .normal)
                    
                    FinCartUserDefaults.sharedInstance.saveName((response.result.value as! NSDictionary).value(forKey: "PAN_NAME") as! String)
                    FinCartUserDefaults.sharedInstance.savePan((response.result.value as! NSDictionary).value(forKey: "PAN_NUMBER") as! String)

                }
                else {
                    self.KYCMsg1.isHidden=false
                    self.KYCMsg2.isHidden=false
                    self.KYCMsg3.isHidden=false
                    self.KYCMsg4.isHidden=false
                    self.rectLayer.isHidden=false
                    self.errorLbl.isHidden=true
                    self.lbl.isHidden=true
                    self.kycActiveLbl.isHidden=true
                    self.rectLayer2.isHidden=true
                    self.checkKYCButton.setTitle("CONTINUE FOR KYC", for: .normal)
                }
            }
            else if response.result.isFailure{
                
                if let data = response.data {
                    do {
                        SVProgressHUD.dismiss()
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        let dict:NSDictionary=json! as NSDictionary
                        self.responseData=dict.value(forKey: "Message") as! String
                        print(dict)
                    } catch {
                        
                    }
                }
                let popup = PopupDialog(title: "", message: "Your session has expired. Please login again.")
                
                let buttonOne = CancelButton(title: "OK"){
                    
//                    let controller=self.storyboard?.instantiateViewController(withIdentifier: "userLoginScreen") as! FinCartLoginVC
//                    self.navigationController?.pushViewController(controller, animated: true)
                }
                popup.addButtons([buttonOne])
                self.present(popup, animated: true, completion: nil)
            }
        }
    }
    func goToBasicDetailsForm(){
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        
        if investorTypeBtn.currentTitle == "INDIVIDUAL"{
            finCartUserDefaults.saveInvestorTypeKey("01")
        }
        else  if investorTypeBtn.currentTitle == "ON BEHALF OF MINOR"{
            finCartUserDefaults.saveInvestorTypeKey("02")
        }
        else  if investorTypeBtn.currentTitle == "HINDU UNDIVIDED FAMILY (HUF)"{
            finCartUserDefaults.saveInvestorTypeKey("03")
        }
        else {
            finCartUserDefaults.saveInvestorTypeKey("24")
        }
        UserDefaults.standard.removeObject(forKey: "error")

        let controller=self.storyboard?.instantiateViewController(withIdentifier: "KycBasicDetailsFormVC") as! KycBasicDetailsFormVC
        controller.controller="fillManual"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func continueForKYC(){
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance

        if investorTypeBtn.currentTitle == "INDIVIDUAL"{
            finCartUserDefaults.saveInvestorTypeKey("01")
        }
        else  if investorTypeBtn.currentTitle == "ON BEHALF OF MINOR"{
            finCartUserDefaults.saveInvestorTypeKey("02")
        }
        else  if investorTypeBtn.currentTitle == "HINDU UNDIVIDED FAMILY (HUF)"{
            finCartUserDefaults.saveInvestorTypeKey("03")
        }
        else {
            finCartUserDefaults.saveInvestorTypeKey("24")
        }
        UserDefaults.standard.removeObject(forKey: "error")

        let controller=self.storyboard?.instantiateViewController(withIdentifier: "EKycFormVC") as! EKycFormVC
        controller.panCardTextField.text=self.panCardTextField.text!
        controller.mobileText=finCartUserDefaults.retrieveMobile()!
        controller.emailText=finCartUserDefaults.retrieveUserName()!
        controller.panCardText=panCardTextField.text!

        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func showInvestorType(_ sender:UIButton){
        UserDefaults.standard.removeObject(forKey: "error")
        let alert = UIAlertController(title: "Select Investor", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "INDIVIDUAL", style: .default, handler: { (action) in
            self.investorTypeBtn.setTitle("INDIVIDUAL", for: .normal)
            self.investorTypeBtn.setTitleColor(UIColor.black, for: .normal)
            self.checkKYCButton.setTitle("CHECK KYC", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "ON BEHALF OF MINOR", style: .default, handler: { (action) in
            self.investorTypeBtn.setTitle("ON BEHALF OF MINOR", for: .normal)
            self.investorTypeBtn.setTitleColor(UIColor.black, for: .normal)
            self.checkKYCButton.setTitle("CHECK KYC", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "HINDU UNDIVIDED FAMILY(HUF)", style: .default, handler: { (action) in
            self.investorTypeBtn.setTitle("HINDU UNDIVIDED FAMILY(HUF)", for: .normal)
            self.investorTypeBtn.setTitleColor(UIColor.black, for: .normal)
            self.checkKYCButton.setTitle("CHECK KYC", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "NON-RESIDENT INDIAN(NRI)", style: .default, handler: { (action) in
            self.investorTypeBtn.setTitle("NON-RESIDENT INDIAN(NRI)", for: .normal)
            self.investorTypeBtn.setTitleColor(UIColor.black, for: .normal)
            self.checkKYCButton.setTitle("CONTINUE", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: {
                print("alert dismissed")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc  func clearTxtInput(_ sender:UIButton){
        panCardTextField.text=""
        self.KYCMsg1.isHidden=true
        self.KYCMsg2.isHidden=true
        self.KYCMsg3.isHidden=true
        self.KYCMsg4.isHidden=true
        self.rectLayer.isHidden=true
        self.errorLbl.isHidden=true
        self.lbl.isHidden=true
        self.kycActiveLbl.isHidden=true
        self.rectLayer2.isHidden=true
        self.checkKYCButton.setTitle("CHECK KYC", for: .normal)

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = panCardTextField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.panCardTextField.resignFirstResponder()
        return true
    }
    
    //MARKS:- Old code
//    func addNav()
//    {
//        self.navigationController?.navigationBar.isHidden=false
//        self.navigationController?.navigationBar.isTranslucent=false
//        self.navigationItem.title="PAN CARD VERIFICATION"
//        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
//        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
//        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
//        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        self.navigationController?.navigationBar.layer.shadowRadius = 2
//        self.navigationController?.navigationBar.layer.masksToBounds=false
//        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
//
//        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:20,height:20))
//        back_btn.setImage(images.backBtn, for: UIControlState.normal)
//        back_btn.addTarget(self, action: #selector(FinCartKYCCheckVC.backAction(_:)), for: UIControlEvents.touchUpInside)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
//
//    }
    
//    @objc func backAction(_ sender:UIButton){
//        _ = self.navigationController?.popViewController(animated: true)
//    }
}
