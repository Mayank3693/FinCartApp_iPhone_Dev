//
//  FatcaDetailsVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 2/4/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton

class FatcaDetailsVC: UIViewController,UITextFieldDelegate {

    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var politicallyExposedBtn=UIButton()
    var switch1=UISwitch()
    var lbl1=UILabel()
    var lbl=UILabel()
    var taxCountryBtn=UIButton()
    var idNumberTextField=UITextField()
    var idTypeBtn=UIButton()
    var removeBtn = PressableButton()
    var addTaxResidencyBtn = PressableButton()
    var removeBtn2 = PressableButton()
    var addTaxResidencyBtn2 = PressableButton()
    var removeBtn3 = PressableButton()
    var addTaxResidencyBtn3 = PressableButton()
    var scrollView=UIScrollView()
    var taxCountryBtn2=UIButton()
    var idNumberTextField2=UITextField()
    var idTypeBtn2=UIButton()
    var taxCountryBtn3=UIButton()
    var idNumberTextField3=UITextField()
    var idTypeBtn3=UIButton()
    var lbl2=UILabel()
    var lbl3=UILabel()
    var continueBtn = PressableButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addNav()
        self.pageDesign()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let politicallyExposedUserDefaults=UserDefaults.standard
        if(politicallyExposedUserDefaults.value(forKey: "politicallyExposed") != nil){
            self.politicallyExposedBtn.setTitle(politicallyExposedUserDefaults.value(forKey: "politicallyExposed") as? String, for: .normal)
            self.politicallyExposedBtn.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            self.politicallyExposedBtn.setTitle("Politically Exposed?", for: .normal)
            self.politicallyExposedBtn.setTitleColor(UIColor.lightGray, for: .normal)
        }
       
        let countryNameUserDefaults=UserDefaults.standard
        if(countryNameUserDefaults.value(forKey: "fatkaController") != nil){
            let controllerFlag=UserDefaults.standard
            if(controllerFlag.value(forKey: "nriCountryName") != nil){
                if(controllerFlag.value(forKey: "nriCountryName") as! String == "1"){
                    self.taxCountryBtn.setTitle(countryNameUserDefaults.value(forKey: "fatkaController") as? String, for: .normal)
                    self.taxCountryBtn.setTitleColor(UIColor.black, for: .normal)
                }
                else if(controllerFlag.value(forKey: "nriCountryName") as! String == "2"){
                    self.taxCountryBtn2.setTitle(countryNameUserDefaults.value(forKey: "fatkaController") as? String, for: .normal)
                    self.taxCountryBtn2.setTitleColor(UIColor.black, for: .normal)
                }
                else {
                    self.taxCountryBtn3.setTitle(countryNameUserDefaults.value(forKey: "fatkaController") as? String, for: .normal)
                    self.taxCountryBtn3.setTitleColor(UIColor.black, for: .normal)
                }
            }
            
        }
        let idCardUserDefaults=UserDefaults.standard
        if(idCardUserDefaults.value(forKey: "idCards") != nil){
            let controllerFlag=UserDefaults.standard
            if(controllerFlag.value(forKey: "controllerFlag") != nil){
                if(controllerFlag.value(forKey: "controllerFlag") as! String == "1"){
                    self.idTypeBtn.setTitle(idCardUserDefaults.value(forKey: "idCards") as? String, for: .normal)
                    self.idTypeBtn.setTitleColor(UIColor.black, for: .normal)
                }
                else if(controllerFlag.value(forKey: "controllerFlag") as! String == "2"){
                    self.idTypeBtn2.setTitle(idCardUserDefaults.value(forKey: "idCards") as? String, for: .normal)
                    self.idTypeBtn2.setTitleColor(UIColor.black, for: .normal)
                }
                else {
                    self.idTypeBtn3.setTitle(idCardUserDefaults.value(forKey: "idCards") as? String, for: .normal)
                    self.idTypeBtn3.setTitleColor(UIColor.black, for: .normal)
                }
            }
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="FATKA DETAILS"
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
    func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    func pageDesign(){
        scrollView=UIScrollView(frame:CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT-134))
        self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)
        
        politicallyExposedBtn=UIButton(frame:CGRect(x:10,y:10,width:dimensions.SCREEN_WIDTH-20,height:60))
        politicallyExposedBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        politicallyExposedBtn.setTitleColor(UIColor.black, for: .normal)
        politicallyExposedBtn.layer.cornerRadius=6
        politicallyExposedBtn.layer.masksToBounds=true
        politicallyExposedBtn.layer.borderColor=UIColor.lightGray.cgColor
        politicallyExposedBtn.layer.borderWidth=0.6
        politicallyExposedBtn.setImage(images.rightArrow, for: .normal)
        politicallyExposedBtn.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        politicallyExposedBtn.contentHorizontalAlignment = .left
        politicallyExposedBtn.addTarget(self, action: #selector(FatcaDetailsVC.showPoliticallyExposedLists(_:)), for: .touchUpInside)
        
        switch1=UISwitch()
        switch1.frame=CGRect(x:10,y:politicallyExposedBtn.frame.origin.y+politicallyExposedBtn.frame.size.height+15,width:15,height:20)
        switch1.setOn(false, animated: true)
        switch1.addTarget(self, action: #selector(BankAccountDetailsVC.handleSwitch(_:)), for: .touchUpInside)
    lbl1=UILabel(frame:CGRect(x:switch1.frame.size.width+20,y:politicallyExposedBtn.frame.origin.y+politicallyExposedBtn.frame.size.height+20,width:dimensions.SCREEN_WIDTH-switch1.frame.size.width-30,height:20))
        lbl1.text="Is Tax Country Other Than India?"
        lbl1.textColor=UIColor.black
        lbl1.textAlignment = .left
        lbl1.font=UIFont.systemFont(ofSize: 14)
        
        continueBtn = PressableButton(frame: CGRect(x:10,y:dimensions.SCREEN_HEIGHT-124,width:dimensions.SCREEN_WIDTH-20,height:50))
        continueBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        continueBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        continueBtn.setTitle("SAVE AND CONTINUE", for: .normal)
        continueBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        continueBtn.shadowHeight = 3
        continueBtn.addTarget(self, action: #selector(FatcaDetailsVC.onContinue(_:)), for: .touchUpInside)
        continueBtn.cornerRadius = 5
        
        self.firstTaxResidency()
        self.secondTaxResidency()
        self.thirdTaxResidency()
        
        view.addSubview(scrollView)
        scrollView.addSubview(politicallyExposedBtn)
        scrollView.addSubview(switch1)
        scrollView.addSubview(lbl1)
        view.addSubview(continueBtn)

    }
    func firstTaxResidency(){
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        lbl=UILabel(frame:CGRect(x:10,y:switch1.frame.origin.y+switch1.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl.text="First Tax Residency"
        lbl.textColor=colors.APP_THEME_COLOR
        
        taxCountryBtn=UIButton(frame:CGRect(x:10,y:lbl.frame.origin.y+lbl.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        taxCountryBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        taxCountryBtn.setTitleColor(UIColor.lightGray, for: .normal)
        taxCountryBtn.layer.cornerRadius=6
        taxCountryBtn.layer.masksToBounds=true
        taxCountryBtn.setTitle("Tax Country", for: .normal)
        taxCountryBtn.layer.borderColor=UIColor.lightGray.cgColor
        taxCountryBtn.layer.borderWidth=0.6
        taxCountryBtn.setImage(images.rightArrow, for: .normal)
        taxCountryBtn.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        taxCountryBtn.contentHorizontalAlignment = .left
        taxCountryBtn.addTarget(self, action: #selector(FatcaDetailsVC.showContries(_:)), for: .touchUpInside)
        taxCountryBtn.tag=1
        
        let idNumberIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        idNumberTextField=UITextField(frame:CGRect(x:10,y:taxCountryBtn.frame.origin.y+taxCountryBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        idNumberTextField.layer.cornerRadius=6
        idNumberTextField.layer.masksToBounds=true
        idNumberTextField.layer.borderColor=UIColor.lightGray.cgColor
        idNumberTextField.layer.borderWidth=0.6
        idNumberTextField.delegate=self
        idNumberTextField.attributedPlaceholder = NSAttributedString(string: "ID Number", attributes:attributes)
        idNumberTextField.leftView = idNumberIndentView
        idNumberTextField.leftViewMode = .always
        idNumberTextField.font=UIFont.systemFont(ofSize: 14)
        
        idTypeBtn=UIButton(frame:CGRect(x:10,y:idNumberTextField.frame.origin.y+idNumberTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        idTypeBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        idTypeBtn.setTitleColor(UIColor.lightGray, for: .normal)
        idTypeBtn.layer.cornerRadius=6
        idTypeBtn.layer.masksToBounds=true
        self.idTypeBtn.setTitle("ID Type", for: .normal)
        idTypeBtn.layer.borderColor=UIColor.lightGray.cgColor
        idTypeBtn.layer.borderWidth=0.6
        idTypeBtn.setImage(images.rightArrow, for: .normal)
        idTypeBtn.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        idTypeBtn.contentHorizontalAlignment = .left
        idTypeBtn.addTarget(self, action: #selector(FatcaDetailsVC.showIdCards(_:)), for: .touchUpInside)
        idTypeBtn.tag=1
        
        removeBtn = PressableButton(frame: CGRect(x:10,y:idTypeBtn.frame.origin.y+idTypeBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50))
        removeBtn.colors = .init(button: UIColor.white, shadow: UIColor.white)
        removeBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        removeBtn.setTitle("REMOVE", for: .normal)
        removeBtn.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        removeBtn.shadowHeight = 3
        removeBtn.layer.borderWidth=1
        removeBtn.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        removeBtn.addTarget(self, action: #selector(FatcaDetailsVC.removeBtnAction(_:)), for: .touchUpInside)
        removeBtn.layer.cornerRadius = 6
        removeBtn.tag=1
        
        addTaxResidencyBtn = PressableButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:idTypeBtn.frame.origin.y+idTypeBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50))
        addTaxResidencyBtn.colors = .init(button: UIColor.white, shadow: UIColor.white)
        addTaxResidencyBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        addTaxResidencyBtn.setTitle("ADD TAX RESIDENCY", for: .normal)
        addTaxResidencyBtn.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        addTaxResidencyBtn.shadowHeight = 3
        addTaxResidencyBtn.layer.borderWidth=1
        addTaxResidencyBtn.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        addTaxResidencyBtn.addTarget(self, action: #selector(FatcaDetailsVC.addTaxResidency(_:)), for: .touchUpInside)
        addTaxResidencyBtn.layer.cornerRadius = 6
        addTaxResidencyBtn.tag=1
        
        lbl.isHidden=true
        taxCountryBtn.isHidden=true
        idNumberTextField.isHidden=true
        idTypeBtn.isHidden=true
        removeBtn.isHidden=true
        addTaxResidencyBtn.isHidden=true
        
        scrollView.addSubview(lbl)
        scrollView.addSubview(taxCountryBtn)
        scrollView.addSubview(idNumberTextField)
        scrollView.addSubview(idTypeBtn)
        scrollView.addSubview(removeBtn)
        scrollView.addSubview(addTaxResidencyBtn)
        
        
    }
    
    func secondTaxResidency(){
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        lbl2=UILabel(frame:CGRect(x:10,y:idTypeBtn.frame.origin.y+idTypeBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl2.text="Second Tax Residency"
        lbl2.textColor=colors.APP_THEME_COLOR
        
        taxCountryBtn2=UIButton(frame:CGRect(x:10,y:lbl2.frame.origin.y+lbl2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        taxCountryBtn2.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        taxCountryBtn2.setTitleColor(UIColor.lightGray, for: .normal)
        taxCountryBtn2.layer.cornerRadius=6
        taxCountryBtn2.layer.masksToBounds=true
        taxCountryBtn2.setTitle("Tax Country", for: .normal)
        taxCountryBtn2.layer.borderColor=UIColor.lightGray.cgColor
        taxCountryBtn2.layer.borderWidth=0.6
        taxCountryBtn2.setImage(images.rightArrow, for: .normal)
        taxCountryBtn2.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        taxCountryBtn2.contentHorizontalAlignment = .left
        taxCountryBtn2.addTarget(self, action: #selector(FatcaDetailsVC.showContries(_:)), for: .touchUpInside)
        taxCountryBtn2.tag=2
        
        let idNumberIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        idNumberTextField2=UITextField(frame:CGRect(x:10,y:taxCountryBtn2.frame.origin.y+taxCountryBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        idNumberTextField2.layer.cornerRadius=6
        idNumberTextField2.layer.masksToBounds=true
        idNumberTextField2.layer.borderColor=UIColor.lightGray.cgColor
        idNumberTextField2.layer.borderWidth=0.6
        idNumberTextField2.delegate=self
        idNumberTextField2.attributedPlaceholder = NSAttributedString(string: "ID Number", attributes:attributes)
        idNumberTextField2.leftView = idNumberIndentView
        idNumberTextField2.leftViewMode = .always
        idNumberTextField2.font=UIFont.systemFont(ofSize: 14)
        
        idTypeBtn2=UIButton(frame:CGRect(x:10,y:idNumberTextField2.frame.origin.y+idNumberTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        idTypeBtn2.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        idTypeBtn2.setTitleColor(UIColor.lightGray, for: .normal)
        idTypeBtn2.layer.cornerRadius=6
        idTypeBtn2.layer.masksToBounds=true
        idTypeBtn2.setTitle("ID Type", for: .normal)
        idTypeBtn2.layer.borderColor=UIColor.lightGray.cgColor
        idTypeBtn2.layer.borderWidth=0.6
        idTypeBtn2.setImage(images.rightArrow, for: .normal)
        idTypeBtn2.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        idTypeBtn2.contentHorizontalAlignment = .left
        idTypeBtn2.addTarget(self, action: #selector(FatcaDetailsVC.showIdCards(_:)), for: .touchUpInside)
        idTypeBtn2.tag=2
        
        removeBtn2 = PressableButton(frame: CGRect(x:10,y:idTypeBtn2.frame.origin.y+idTypeBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50))
        removeBtn2.colors = .init(button: UIColor.white, shadow: UIColor.white)
        removeBtn2.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        removeBtn2.setTitle("REMOVE", for: .normal)
        removeBtn2.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        removeBtn2.shadowHeight = 3
        removeBtn2.layer.borderWidth=1
        removeBtn2.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        removeBtn2.addTarget(self, action: #selector(FatcaDetailsVC.removeBtnAction(_:)), for: .touchUpInside)
        removeBtn2.layer.cornerRadius = 6
        removeBtn2.tag=2
        
        addTaxResidencyBtn2 = PressableButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:idTypeBtn2.frame.origin.y+idTypeBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50))
        addTaxResidencyBtn2.colors = .init(button: UIColor.white, shadow: UIColor.white)
        addTaxResidencyBtn2.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        addTaxResidencyBtn2.setTitle("ADD TAX RESIDENCY", for: .normal)
        addTaxResidencyBtn2.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        addTaxResidencyBtn2.shadowHeight = 3
        addTaxResidencyBtn2.layer.borderWidth=1
        addTaxResidencyBtn2.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        addTaxResidencyBtn2.addTarget(self, action: #selector(FatcaDetailsVC.addTaxResidency(_:)), for: .touchUpInside)
        addTaxResidencyBtn2.layer.cornerRadius = 6
        addTaxResidencyBtn2.tag=2
        
        lbl2.isHidden=true
        taxCountryBtn2.isHidden=true
        idNumberTextField2.isHidden=true
        removeBtn2.isHidden=true
        addTaxResidencyBtn2.isHidden=true
        idTypeBtn2.isHidden=true
        
        scrollView.addSubview(lbl2)
        scrollView.addSubview(taxCountryBtn2)
        scrollView.addSubview(idNumberTextField2)
        scrollView.addSubview(idTypeBtn2)
        scrollView.addSubview(removeBtn2)
        scrollView.addSubview(addTaxResidencyBtn2)
        
        
    }
    func thirdTaxResidency(){
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        lbl3=UILabel(frame:CGRect(x:10,y:idTypeBtn2.frame.origin.y+idTypeBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl3.text="Third Tax Residency"
        lbl3.textColor=colors.APP_THEME_COLOR
        
        taxCountryBtn3=UIButton(frame:CGRect(x:10,y:lbl3.frame.origin.y+lbl3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        taxCountryBtn3.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        taxCountryBtn3.setTitleColor(UIColor.lightGray, for: .normal)
        taxCountryBtn3.layer.cornerRadius=6
        taxCountryBtn3.layer.masksToBounds=true
        taxCountryBtn3.layer.borderColor=UIColor.lightGray.cgColor
        taxCountryBtn3.layer.borderWidth=0.6
        taxCountryBtn3.setTitle("Tax Country", for: .normal)
        taxCountryBtn3.setImage(images.rightArrow, for: .normal)
        taxCountryBtn3.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        taxCountryBtn3.contentHorizontalAlignment = .left
        taxCountryBtn3.addTarget(self, action: #selector(FatcaDetailsVC.showContries(_:)), for: .touchUpInside)
        taxCountryBtn3.tag=3
        
        let idNumberIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        idNumberTextField3=UITextField(frame:CGRect(x:10,y:taxCountryBtn2.frame.origin.y+taxCountryBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        idNumberTextField3.layer.cornerRadius=6
        idNumberTextField3.layer.masksToBounds=true
        idNumberTextField3.layer.borderColor=UIColor.lightGray.cgColor
        idNumberTextField3.layer.borderWidth=0.6
        idNumberTextField3.delegate=self
        idNumberTextField3.attributedPlaceholder = NSAttributedString(string: "ID Number", attributes:attributes)
        idNumberTextField3.leftView = idNumberIndentView
        idNumberTextField3.leftViewMode = .always
        idNumberTextField3.font=UIFont.systemFont(ofSize: 14)
        
        idTypeBtn3=UIButton(frame:CGRect(x:10,y:idNumberTextField3.frame.origin.y+idNumberTextField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        idTypeBtn3.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        idTypeBtn3.setTitleColor(UIColor.lightGray, for: .normal)
        idTypeBtn3.layer.cornerRadius=6
        idTypeBtn3.layer.masksToBounds=true
        idTypeBtn3.setTitle("ID Type", for: .normal)
        idTypeBtn3.layer.borderColor=UIColor.lightGray.cgColor
        idTypeBtn3.layer.borderWidth=0.6
        idTypeBtn3.setImage(images.rightArrow, for: .normal)
        idTypeBtn3.imageEdgeInsets = UIEdgeInsetsMake(20, politicallyExposedBtn.frame.size.width - 24, 20, 0);
        idTypeBtn3.contentHorizontalAlignment = .left
        idTypeBtn3.addTarget(self, action: #selector(FatcaDetailsVC.showIdCards(_:)), for: .touchUpInside)
        idTypeBtn3.tag=3
        
        removeBtn3 = PressableButton(frame: CGRect(x:10,y:idTypeBtn3.frame.origin.y+idTypeBtn3.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50))
        removeBtn3.colors = .init(button: UIColor.white, shadow: UIColor.white)
        removeBtn3.titleLabel?.font=UIFont.boldSystemFont(ofSize: 12)
        removeBtn3.setTitle("REMOVE", for: .normal)
        removeBtn3.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        removeBtn3.shadowHeight = 3
        removeBtn3.layer.borderWidth=1
        removeBtn3.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        removeBtn3.addTarget(self, action: #selector(FatcaDetailsVC.removeBtnAction(_:)), for: .touchUpInside)
        removeBtn3.layer.cornerRadius = 6
        removeBtn3.tag=3
        
        lbl3.isHidden=true
        taxCountryBtn3.isHidden=true
        idNumberTextField3.isHidden=true
        removeBtn3.isHidden=true
        addTaxResidencyBtn3.isHidden=true
        idTypeBtn3.isHidden=true

        scrollView.addSubview(lbl3)
        scrollView.addSubview(taxCountryBtn3)
        scrollView.addSubview(idNumberTextField3)
        scrollView.addSubview(idTypeBtn3)
        scrollView.addSubview(removeBtn3)
        
    }
    
    func handleSwitch(_ sender:UISwitch){
        if sender.isOn == true{
            lbl.isHidden=false
            taxCountryBtn.isHidden=false
            idNumberTextField.isHidden=false
            idTypeBtn.isHidden=false
            removeBtn.isHidden=false
            addTaxResidencyBtn.isHidden=false
            if(self.idTypeBtn.isHidden==false){
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 460)
                
            }
            else {
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)
                
            }
        }
        else {
            lbl.isHidden=true
            taxCountryBtn.isHidden=true
            idNumberTextField.isHidden=true
            idTypeBtn.isHidden=true
            removeBtn.isHidden=true
            addTaxResidencyBtn.isHidden=true
            
            lbl2.isHidden=true
            taxCountryBtn2.isHidden=true
            idNumberTextField2.isHidden=true
            idTypeBtn2.isHidden=true
            removeBtn2.isHidden=true
            addTaxResidencyBtn2.isHidden=true
            
            lbl3.isHidden=true
            taxCountryBtn3.isHidden=true
            idNumberTextField3.isHidden=true
            idTypeBtn3.isHidden=true
            removeBtn3.isHidden=true
            addTaxResidencyBtn3.isHidden=true
            self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)

        }
    }
    @objc func addTaxResidency(_ sender:UIButton){
        if sender.tag == 1{
            lbl2.isHidden=false
            taxCountryBtn2.isHidden=false
            idNumberTextField2.isHidden=false
            idTypeBtn2.isHidden=false
            removeBtn2.isHidden=false
            addTaxResidencyBtn2.isHidden=false
            
            removeBtn.isHidden=true
            addTaxResidencyBtn.isHidden=true
            
            lbl2.frame=CGRect(x:10,y:idTypeBtn.frame.origin.y+idTypeBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
            taxCountryBtn2.frame=CGRect(x:10,y:lbl2.frame.origin.y+lbl2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            idNumberTextField2.frame=CGRect(x:10,y:taxCountryBtn2.frame.origin.y+taxCountryBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            idTypeBtn2.frame=CGRect(x:10,y:idNumberTextField2.frame.origin.y+idNumberTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            removeBtn2.frame=CGRect(x:10,y:idTypeBtn2.frame.origin.y+idTypeBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50)
            addTaxResidencyBtn2.frame=CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:idTypeBtn2.frame.origin.y+idTypeBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50)
            
            if(self.idTypeBtn2.isHidden==false){
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 740)
                
            }
            else {
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 460)
                
            }
        }
        else if sender.tag == 2{
            lbl3.isHidden=false
            taxCountryBtn3.isHidden=false
            idNumberTextField3.isHidden=false
            idTypeBtn3.isHidden=false
            removeBtn3.isHidden=false
            addTaxResidencyBtn3.isHidden=false
            
            removeBtn2.isHidden=true
            addTaxResidencyBtn2.isHidden=true
            
            lbl3.frame=CGRect(x:10,y:idTypeBtn2.frame.origin.y+idTypeBtn2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
            taxCountryBtn3.frame=CGRect(x:10,y:lbl3.frame.origin.y+lbl3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            idNumberTextField3.frame=CGRect(x:10,y:taxCountryBtn3.frame.origin.y+taxCountryBtn3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            idTypeBtn3.frame=CGRect(x:10,y:idNumberTextField3.frame.origin.y+idNumberTextField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            removeBtn3.frame=CGRect(x:10,y:idTypeBtn3.frame.origin.y+idTypeBtn3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:50)
            
            if(self.idTypeBtn3.isHidden==false){
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1010)
                
            }
            else {
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 740)
                
            }
        }
    }
    @objc func removeBtnAction(_ sender:UIButton){
        if sender.tag == 1{
            lbl.isHidden=true
            taxCountryBtn.isHidden=true
            idNumberTextField.isHidden=true
            idTypeBtn.isHidden=true
            removeBtn.isHidden=true
            addTaxResidencyBtn.isHidden=true
            
            lbl2.isHidden=true
            taxCountryBtn2.isHidden=true
            idNumberTextField2.isHidden=true
            idTypeBtn2.isHidden=true
            removeBtn2.isHidden=true
            addTaxResidencyBtn2.isHidden=true
            
            lbl3.isHidden=true
            taxCountryBtn3.isHidden=true
            idNumberTextField3.isHidden=true
            idTypeBtn3.isHidden=true
            removeBtn3.isHidden=true
            addTaxResidencyBtn3.isHidden=true
            
            self.switch1.isOn=false
            self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)
        }
        else if sender.tag == 2{
           
            lbl2.isHidden=true
            taxCountryBtn2.isHidden=true
            idNumberTextField2.isHidden=true
            idTypeBtn2.isHidden=true
            removeBtn2.isHidden=true
            addTaxResidencyBtn2.isHidden=true
            
            removeBtn.isHidden=false
            addTaxResidencyBtn.isHidden=false
            
            self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 460)
        }
        
        else {
            lbl3.isHidden=true
            taxCountryBtn3.isHidden=true
            idNumberTextField3.isHidden=true
            idTypeBtn3.isHidden=true
            removeBtn3.isHidden=true
            addTaxResidencyBtn3.isHidden=true
            removeBtn.isHidden=true
            addTaxResidencyBtn.isHidden=true
            
            removeBtn2.isHidden=false
            addTaxResidencyBtn2.isHidden=false
            
            self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 740)
        }
    }
    @objc func onContinue(_ sender:UIButton){
        if politicallyExposedBtn.currentTitle == "Politically Exposed?"{
            self.utils.popUp(title: "", message: "Select Politically Exposed")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
       
        if switch1.isOn == true &&  taxCountryBtn.isHidden == false{
            if taxCountryBtn.currentTitle == "Tax Country"{
                self.utils.popUp(title: "", message: "Select First Tax Residency Country")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveFirstTaxCountry(taxCountryBtn.currentTitle)
            }
            if idNumberTextField.text?.isEmpty == true{
                self.utils.popUp(title: "", message: "First Tax Residency ID Number can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveFirstIdNo(idNumberTextField.text!)
            }
            if idTypeBtn.currentTitle == "ID Type"{
                self.utils.popUp(title: "", message: "Select First Tax Residency ID Type")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                
                if idTypeBtn.currentTitle == "Company Identification Number"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("C1")
                }
                else if idTypeBtn.currentTitle == "Driving License"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("E")
                }
                else if idTypeBtn.currentTitle == "Election ID Card"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("B")
                }
                else if idTypeBtn.currentTitle == "Global Entity Identification Number"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("E1")
                }
                else if idTypeBtn.currentTitle == "ID Card"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("D")
                }
                else if idTypeBtn.currentTitle == "Not categorized"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("X")
                }
                else if idTypeBtn.currentTitle == "NREGA Job Card"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("H")
                }
                else if idTypeBtn.currentTitle == "Others"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("O")
                }
                else if idTypeBtn.currentTitle == "PAN Card"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("C")
                }
                else if idTypeBtn.currentTitle == "Passport"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("A")
                }
                else if idTypeBtn.currentTitle == "TIN(Tax Payer Identification Number)"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("T")
                }
                else if idTypeBtn.currentTitle == "UIDIA/Aadhar letter"{
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("G")
                }
                else {
                    FinCartUserDefaults.sharedInstance.saveFirstIdType("G1")
                }
                
            }
        }
        if switch1.isOn == true &&  taxCountryBtn2.isHidden == false{
            if taxCountryBtn2.currentTitle == "Tax Country"{
                self.utils.popUp(title: "", message: "Select Second Tax Residency Country")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveSecondTaxCountry(taxCountryBtn2.currentTitle)
            }
            if idNumberTextField2.text?.isEmpty == true{
                self.utils.popUp(title: "", message: "Second Tax Residency ID Number can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveSecondIdNo(idNumberTextField2.text!)
            }
            if idTypeBtn2.currentTitle == "ID Type"{
                self.utils.popUp(title: "", message: "Select Second Tax Residency ID Type")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                
                if idTypeBtn2.currentTitle == "Company Identification Number"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("C1")
                }
                else if idTypeBtn2.currentTitle == "Driving License"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("E")
                }
                else if idTypeBtn2.currentTitle == "Election ID Card"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("B")
                }
                else if idTypeBtn2.currentTitle == "Global Entity Identification Number"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("E1")
                }
                else if idTypeBtn2.currentTitle == "ID Card"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("D")
                }
                else if idTypeBtn2.currentTitle == "Not categorized"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("X")
                }
                else if idTypeBtn2.currentTitle == "NREGA Job Card"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("H")
                }
                else if idTypeBtn2.currentTitle == "Others"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("O")
                }
                else if idTypeBtn2.currentTitle == "PAN Card"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("C")
                }
                else if idTypeBtn2.currentTitle == "Passport"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("A")
                }
                else if idTypeBtn2.currentTitle == "TIN(Tax Payer Identification Number)"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("T")
                }
                else if idTypeBtn2.currentTitle == "UIDIA/Aadhar letter"{
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("G")
                }
                else {
                    FinCartUserDefaults.sharedInstance.saveSecondIdType("G1")
                }
                
            }
        }
        if switch1.isOn == true &&  taxCountryBtn3.isHidden == false{
            if taxCountryBtn3.currentTitle == "Tax Country"{
                self.utils.popUp(title: "", message: "Select Third Tax Residency Country")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveThirdTaxCountry(taxCountryBtn3.currentTitle)
            }
            if idNumberTextField3.text?.isEmpty == true{
                self.utils.popUp(title: "", message: "Third Tax Residency ID Number can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveThirdIdNo(idNumberTextField3.text!)
            }
            if idTypeBtn3.currentTitle == "ID Type"{
                self.utils.popUp(title: "", message: "Select Third Tax Residency ID Type")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                
                if idTypeBtn3.currentTitle == "Company Identification Number"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("C1")
                }
                else if idTypeBtn3.currentTitle == "Driving License"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("E")
                }
                else if idTypeBtn3.currentTitle == "Election ID Card"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("B")
                }
                else if idTypeBtn3.currentTitle == "Global Entity Identification Number"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("E1")
                }
                else if idTypeBtn3.currentTitle == "ID Card"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("D")
                }
                else if idTypeBtn3.currentTitle == "Not categorized"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("X")
                }
                else if idTypeBtn3.currentTitle == "NREGA Job Card"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("H")
                }
                else if idTypeBtn3.currentTitle == "Others"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("O")
                }
                else if idTypeBtn3.currentTitle == "PAN Card"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("C")
                }
                else if idTypeBtn3.currentTitle == "Passport"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("A")
                }
                else if idTypeBtn3.currentTitle == "TIN(Tax Payer Identification Number)"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("T")
                }
                else if idTypeBtn3.currentTitle == "UIDIA/Aadhar letter"{
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("G")
                }
                else {
                    FinCartUserDefaults.sharedInstance.saveThirdIdType("G1")
                }
                
            }
        }
        
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        
        if politicallyExposedBtn.currentTitle == "Yes"{
            finCartUserDefaults.savePoliticallyExposedKey("Yes")
        }
        else if politicallyExposedBtn.currentTitle == "Related"{
            finCartUserDefaults.savePoliticallyExposedKey("Related")
        }
        else {
            finCartUserDefaults.savePoliticallyExposedKey("No")
        }
        
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "DigitalSignatureProceed") as! DigitalSignatureProceed
        controller.controllerName="Fatca"
        self.navigationController?.pushViewController(controller, animated: true)

    }
    @objc func showContries(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "CountryLists") as! CountryLists
        controller.controllerName="Fatka"
        if sender.tag == 1{
            controller.countryFlag=1
        }
        else if sender.tag == 2{
            controller.countryFlag=2
        }
        else {
            controller.countryFlag=3
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func showIdCards(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "IDCardsLists") as! IDCardsLists
        if sender.tag == 1{
            controller.controllerFlag=1
        }
        else if sender.tag == 2{
            controller.controllerFlag=2
        }
        else {
            controller.controllerFlag=3
        }
        self.navigationController?.pushViewController(controller, animated: true)

    }
    @objc func showPoliticallyExposedLists(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "PoliticallyExposedLists") as! PoliticallyExposedLists
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
