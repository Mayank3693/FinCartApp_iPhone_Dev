//
//  BankAccountDetailsVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 2/2/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton
import Alamofire
import PopupDialog

class BankAccountDetailsVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var dobTxtField=UITextField()
    var ifscTxtField=UITextField()
    var bankAccountTypeBtn=UIButton()
    var accNoTxtField=UITextField()
    var accHolderNameTxtField=UITextField()
    var incomeSourceBtn=UIButton()
    var continueBtn = PressableButton()
    var scrollView=UIScrollView()
    var switch1=UISwitch()
    var nameTxtField=UITextField()
    var datePickerView=UIDatePicker()
    var shareTextField=UITextField()
    var relationTextField=UITextField()
    var removeBtn = PressableButton()
    var addNomineeBtn = PressableButton()
    var lbl=UILabel()
    var yearDiff=Int()
    var yearDiff2=Int()
    var yearDiff3=Int()
    var nameTxtField2=UITextField()
    var datePickerView2=UIDatePicker()
    var shareTextField2=UITextField()
    var relationTextField2=UITextField()
    var removeBtn2 = PressableButton()
    var addNomineeBtn2 = PressableButton()
    var lbl2=UILabel()
    var dobTxtField2=UITextField()
    var nameTxtField3=UITextField()
    var datePickerView3=UIDatePicker()
    var shareTextField3=UITextField()
    var relationTextField3=UITextField()
    var removeBtn3 = PressableButton()
    var addNomineeBtn3 = PressableButton()
    var lbl3=UILabel()
    var dobTxtField3=UITextField()
    var bankAddressTxtField=UITextField()
    var bankNameBtn=UIButton()
    var bankCityTxtField=UITextField()
    var micrTxtField=UITextField()
    var responseData=String()
    var lbl1=UILabel()
    var errorLbl=UILabel()
    var resetBtn = PressableButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        self.pageDesign()
        
        yearDiff=1
        yearDiff2=1
        yearDiff3=1
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="BANK ACCOUNT DETAILS"
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:20,height:20))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(BankAccountDetailsVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
    }
    @objc func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bankAccountUserDefaults=UserDefaults.standard
        if(bankAccountUserDefaults.value(forKey: "accountType") != nil){
            self.bankAccountTypeBtn.setTitle(bankAccountUserDefaults.value(forKey: "accountType") as? String, for: .normal)
            bankAccountTypeBtn.setTitleColor(UIColor.black, for: .normal)

        }
        else{
            self.bankAccountTypeBtn.setTitle("Bank Account Type", for: .normal)
            bankAccountTypeBtn.setTitleColor(UIColor.lightGray, for: .normal)

        }
        let incomeSrcUserDefaults=UserDefaults.standard
        if(incomeSrcUserDefaults.value(forKey: "incomeSource") != nil){
            self.incomeSourceBtn.setTitle(incomeSrcUserDefaults.value(forKey: "incomeSource") as? String, for: .normal)
            incomeSourceBtn.setTitleColor(UIColor.black, for: .normal)
            
        }
        else{
            self.incomeSourceBtn.setTitle("Income Source", for: .normal)
            incomeSourceBtn.setTitleColor(UIColor.lightGray, for: .normal)
            
        }
        let bankNameUserDefaults=UserDefaults.standard
        if(bankNameUserDefaults.value(forKey: "bankName") != nil){
            self.bankNameBtn.setTitle(bankNameUserDefaults.value(forKey: "bankName") as? String, for: .normal)
            bankNameBtn.setTitleColor(UIColor.black, for: .normal)
            
        }
        else{
            self.bankNameBtn.setTitle("Bank Name", for: .normal)
            bankNameBtn.setTitleColor(UIColor.lightGray, for: .normal)
            
        }
    }
    func pageDesign(){
        
        scrollView=UIScrollView(frame:CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT-134))
        self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)

        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        let ifscIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        ifscTxtField=UITextField(frame:CGRect(x:10,y:15,width:dimensions.SCREEN_WIDTH-20,height:60))
        ifscTxtField.layer.cornerRadius=6
        ifscTxtField.layer.masksToBounds=true
        ifscTxtField.layer.borderColor=UIColor.lightGray.cgColor
        ifscTxtField.layer.borderWidth=0.6
        ifscTxtField.delegate=self
        ifscTxtField.attributedPlaceholder = NSAttributedString(string: "IFSC", attributes:attributes)
        ifscTxtField.leftView = ifscIndentView
        ifscTxtField.leftViewMode = .always
        ifscTxtField.font=UIFont.systemFont(ofSize: 14)
        ifscTxtField.autocapitalizationType = .allCharacters
        
        bankAccountTypeBtn=UIButton(frame:CGRect(x:10,y:ifscTxtField.frame.origin.y+ifscTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        bankAccountTypeBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        bankAccountTypeBtn.layer.cornerRadius=6
        bankAccountTypeBtn.layer.masksToBounds=true
        bankAccountTypeBtn.layer.borderColor=UIColor.lightGray.cgColor
        bankAccountTypeBtn.layer.borderWidth=0.6
        bankAccountTypeBtn.setImage(images.rightArrow, for: .normal)
        bankAccountTypeBtn.contentHorizontalAlignment = .left
        bankAccountTypeBtn.imageEdgeInsets = UIEdgeInsetsMake(20, bankAccountTypeBtn.frame.size.width - 24, 20, 0);
        bankAccountTypeBtn.addTarget(self, action: #selector(BankAccountDetailsVC.selectBankAccountType(_:)), for: .touchUpInside)
        
        let accountNoIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        accNoTxtField=UITextField(frame:CGRect(x:10,y:bankAccountTypeBtn.frame.origin.y+bankAccountTypeBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        accNoTxtField.layer.cornerRadius=6
        accNoTxtField.layer.masksToBounds=true
        accNoTxtField.keyboardType = .numberPad
        accNoTxtField.layer.borderColor=UIColor.lightGray.cgColor
        accNoTxtField.layer.borderWidth=0.6
        accNoTxtField.delegate=self
        accNoTxtField.attributedPlaceholder = NSAttributedString(string: "Account Number", attributes:attributes)
        accNoTxtField.leftView = accountNoIndentView
        accNoTxtField.leftViewMode = .always
        accNoTxtField.font=UIFont.systemFont(ofSize: 14)
        
        let accountHolderNameIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        accHolderNameTxtField=UITextField(frame:CGRect(x:10,y:accNoTxtField.frame.origin.y+accNoTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        accHolderNameTxtField.layer.cornerRadius=6
        accHolderNameTxtField.layer.masksToBounds=true
        accHolderNameTxtField.layer.borderColor=UIColor.lightGray.cgColor
        accHolderNameTxtField.layer.borderWidth=0.6
        accHolderNameTxtField.delegate=self
        accHolderNameTxtField.attributedPlaceholder = NSAttributedString(string: "Account Holder Name", attributes:attributes)
        accHolderNameTxtField.leftView = accountHolderNameIndentView
        accHolderNameTxtField.leftViewMode = .always
        accHolderNameTxtField.font=UIFont.systemFont(ofSize: 14)
        
        incomeSourceBtn=UIButton(frame:CGRect(x:10,y:accHolderNameTxtField.frame.origin.y+accHolderNameTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        incomeSourceBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        incomeSourceBtn.setTitleColor(UIColor.black, for: .normal)
        incomeSourceBtn.layer.cornerRadius=6
        incomeSourceBtn.layer.masksToBounds=true
        incomeSourceBtn.layer.borderColor=UIColor.lightGray.cgColor
        incomeSourceBtn.layer.borderWidth=0.6
        incomeSourceBtn.setImage(images.rightArrow, for: .normal)
        incomeSourceBtn.contentHorizontalAlignment = .left
        incomeSourceBtn.imageEdgeInsets = UIEdgeInsetsMake(20, bankAccountTypeBtn.frame.size.width - 24, 20, 0);
        incomeSourceBtn.addTarget(self, action: #selector(BankAccountDetailsVC.selectIncomeSource(_:)), for: .touchUpInside)
        
        let bankAddressIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        bankAddressTxtField=UITextField(frame:CGRect(x:10,y:incomeSourceBtn.frame.origin.y+incomeSourceBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        bankAddressTxtField.layer.cornerRadius=6
        bankAddressTxtField.layer.masksToBounds=true
        bankAddressTxtField.layer.borderColor=UIColor.lightGray.cgColor
        bankAddressTxtField.layer.borderWidth=0.6
        bankAddressTxtField.delegate=self
        bankAddressTxtField.attributedPlaceholder = NSAttributedString(string: "Bank Address", attributes:attributes)
        bankAddressTxtField.leftView = bankAddressIndentView
        bankAddressTxtField.leftViewMode = .always
        bankAddressTxtField.font=UIFont.systemFont(ofSize: 14)
        bankAddressTxtField.isHidden=true
        
        bankNameBtn=UIButton(frame:CGRect(x:10,y:bankAddressTxtField.frame.origin.y+bankAddressTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        bankNameBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        bankNameBtn.setTitleColor(UIColor.black, for: .normal)
        bankNameBtn.layer.cornerRadius=6
        bankNameBtn.layer.masksToBounds=true
        bankNameBtn.layer.borderColor=UIColor.lightGray.cgColor
        bankNameBtn.layer.borderWidth=0.6
        bankNameBtn.setImage(images.rightArrow, for: .normal)
        bankNameBtn.contentHorizontalAlignment = .left
        bankNameBtn.imageEdgeInsets = UIEdgeInsetsMake(20, bankNameBtn.frame.size.width - 24, 20, 0);
        bankNameBtn.addTarget(self, action: #selector(BankAccountDetailsVC.showBankNames(_:)), for: .touchUpInside)
        bankNameBtn.isHidden=true
        
        let bankCityIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        bankCityTxtField=UITextField(frame:CGRect(x:10,y:bankNameBtn.frame.origin.y+bankNameBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        bankCityTxtField.layer.cornerRadius=6
        bankCityTxtField.layer.masksToBounds=true
        bankCityTxtField.layer.borderColor=UIColor.lightGray.cgColor
        bankCityTxtField.layer.borderWidth=0.6
        bankCityTxtField.delegate=self
        bankCityTxtField.attributedPlaceholder = NSAttributedString(string: "Bank City", attributes:attributes)
        bankCityTxtField.leftView = bankCityIndentView
        bankCityTxtField.leftViewMode = .always
        bankCityTxtField.font=UIFont.systemFont(ofSize: 14)
        bankCityTxtField.isHidden=true
        
        let micrIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        micrTxtField=UITextField(frame:CGRect(x:10,y:bankCityTxtField.frame.origin.y+bankCityTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        micrTxtField.layer.cornerRadius=6
        micrTxtField.layer.masksToBounds=true
        micrTxtField.layer.borderColor=UIColor.lightGray.cgColor
        micrTxtField.layer.borderWidth=0.6
        micrTxtField.delegate=self
        micrTxtField.attributedPlaceholder = NSAttributedString(string: "MICR", attributes:attributes)
        micrTxtField.leftView = micrIndentView
        micrTxtField.leftViewMode = .always
        micrTxtField.font=UIFont.systemFont(ofSize: 14)
        micrTxtField.isHidden=true
        
        switch1=UISwitch()
        switch1.frame=CGRect(x:10,y:incomeSourceBtn.frame.origin.y+accHolderNameTxtField.frame.size.height+15,width:15,height:20)
        switch1.setOn(false, animated: true)
        switch1.addTarget(self, action: #selector(BankAccountDetailsVC.handleSwitch(_:)), for: .touchUpInside)
        switch1.tag=1
        
    lbl1=UILabel(frame:CGRect(x:switch1.frame.size.width+20,y:incomeSourceBtn.frame.origin.y+accHolderNameTxtField.frame.size.height+20,width:dimensions.SCREEN_WIDTH-switch1.frame.size.width-30,height:20))
        lbl1.text="Do you wish to nominate?"
        lbl1.textColor=UIColor.black
        lbl1.textAlignment = .left
        lbl1.font=UIFont.systemFont(ofSize: 14)
        
        errorLbl=UILabel(frame:CGRect(x:10,y:continueBtn.frame.origin.y-40,width:dimensions.SCREEN_WIDTH-20,height:40))
        errorLbl.font=UIFont.boldSystemFont(ofSize: 14)
        errorLbl.textAlignment = .center
        errorLbl.numberOfLines=2
        errorLbl.isHidden=true
        
        continueBtn = PressableButton(frame: CGRect(x:10,y:dimensions.SCREEN_HEIGHT-124,width:dimensions.SCREEN_WIDTH-20,height:50))
        continueBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        continueBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        continueBtn.setTitle("CHECK IFSC", for: .normal)
        continueBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        continueBtn.shadowHeight = 3
        continueBtn.addTarget(self, action: #selector(BankAccountDetailsVC.onContinue(_:)), for: .touchUpInside)
        continueBtn.cornerRadius = 5
        
        resetBtn = PressableButton()
        resetBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        resetBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        resetBtn.setTitle("RESET", for: .normal)
        resetBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        resetBtn.shadowHeight = 3
        resetBtn.addTarget(self, action: #selector(BankAccountDetailsVC.resetBtnAction(_:)), for: .touchUpInside)
        resetBtn.cornerRadius = 5
        resetBtn.isHidden=true
        
        self.firstNominee()
        self.secondNominee()
        self.thirdNominee()

        view.addSubview(scrollView)
        scrollView.addSubview(ifscTxtField)
        scrollView.addSubview(bankAccountTypeBtn)
        scrollView.addSubview(accNoTxtField)
        scrollView.addSubview(accHolderNameTxtField)
        scrollView.addSubview(incomeSourceBtn)
        scrollView.addSubview(bankAddressTxtField)
        scrollView.addSubview(bankNameBtn)
        scrollView.addSubview(bankCityTxtField)
        scrollView.addSubview(micrTxtField)

        scrollView.addSubview(switch1)
        scrollView.addSubview(lbl1)
        
        view.addSubview(errorLbl)
        view.addSubview(continueBtn)
        view.addSubview(resetBtn)


    }
    func firstNominee(){
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        lbl=UILabel()
        lbl.text="First Nominee"
        lbl.textColor=UIColor.red
        
        let nameIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        nameTxtField=UITextField()
        nameTxtField.layer.cornerRadius=6
        nameTxtField.layer.masksToBounds=true
        nameTxtField.layer.borderColor=UIColor.lightGray.cgColor
        nameTxtField.layer.borderWidth=0.6
        nameTxtField.delegate=self
        nameTxtField.attributedPlaceholder = NSAttributedString(string: "Name", attributes:attributes)
        nameTxtField.leftView = nameIndentView
        nameTxtField.leftViewMode = .always
        nameTxtField.font=UIFont.systemFont(ofSize: 14)
        let currentDateTime=NSDate()
        let formatter=DateFormatter()
        formatter.dateFormat="E, d MMM h:mm a"
        
        let toolbar=UIToolbar()
        toolbar.backgroundColor=colors.APP_THEME_COLOR
        toolbar.barTintColor=colors.APP_THEME_COLOR
        toolbar.tintColor=UIColor.white
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(BankAccountDetailsVC.barBtnAction(_:)))
        doneButton.tag=1
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL"  , style: UIBarButtonItemStyle.done, target: self, action:  #selector(BankAccountDetailsVC.cancelBtnAction(_:)))
        cancelButton.tag=1
        
        toolbar.items=[doneButton,spaceButton,cancelButton]
        
        datePickerView=UIDatePicker()
        datePickerView.datePickerMode=UIDatePickerMode.date
        datePickerView.backgroundColor=UIColor.white
        datePickerView.maximumDate=currentDateTime as Date
        datePickerView.tintColor=UIColor.black
        datePickerView.tag=1
        datePickerView.addTarget(self, action: #selector(BankAccountDetailsVC.datePickerAction(_:)), for: UIControlEvents.valueChanged)
        
        let dobIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        dobTxtField=UITextField(frame:CGRect(x:10,y:nameTxtField.frame.origin.y+nameTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        dobTxtField.layer.cornerRadius=6
        dobTxtField.layer.masksToBounds=true
        dobTxtField.layer.borderColor=UIColor.lightGray.cgColor
        dobTxtField.layer.borderWidth=0.6
        dobTxtField.delegate=self
        dobTxtField.attributedPlaceholder = NSAttributedString(string: "Date of birth", attributes:attributes)
        dobTxtField.leftView = dobIndentView
        dobTxtField.leftViewMode = .always
        dobTxtField.font=UIFont.systemFont(ofSize: 14)
        dobTxtField.inputView=datePickerView
        dobTxtField.inputAccessoryView=toolbar
        
        let shareIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        shareTextField=UITextField(frame:CGRect(x:10,y:dobTxtField.frame.origin.y+dobTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        shareTextField.keyboardType = .numberPad
        shareTextField.layer.cornerRadius=6
        shareTextField.layer.masksToBounds=true
        shareTextField.layer.borderColor=UIColor.lightGray.cgColor
        shareTextField.layer.borderWidth=0.6
        shareTextField.delegate=self
        shareTextField.attributedPlaceholder = NSAttributedString(string: "Share %", attributes:attributes)
        shareTextField.leftView = shareIndentView
        shareTextField.leftViewMode = .always
        shareTextField.font=UIFont.systemFont(ofSize: 14)
        
        let relationIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        relationTextField=UITextField(frame:CGRect(x:10,y:shareTextField.frame.origin.y+shareTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        relationTextField.layer.cornerRadius=6
        relationTextField.layer.masksToBounds=true
        relationTextField.layer.borderColor=UIColor.lightGray.cgColor
        relationTextField.layer.borderWidth=0.6
        relationTextField.delegate=self
        relationTextField.attributedPlaceholder = NSAttributedString(string: "Relation", attributes:attributes)
        relationTextField.leftView = relationIndentView
        relationTextField.leftViewMode = .always
        relationTextField.font=UIFont.systemFont(ofSize: 14)
        
        removeBtn = PressableButton(frame: CGRect(x:10,y:relationTextField.frame.origin.y+relationTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50))
        removeBtn.colors = .init(button: UIColor.white, shadow: UIColor.white)
        removeBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        removeBtn.setTitle("REMOVE", for: .normal)
        removeBtn.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        removeBtn.shadowHeight = 3
        removeBtn.layer.borderWidth=1
        removeBtn.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        removeBtn.addTarget(self, action: #selector(BankAccountDetailsVC.removeBtnAction(_:)), for: .touchUpInside)
        removeBtn.layer.cornerRadius = 6
        removeBtn.tag=1
        
        addNomineeBtn = PressableButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:relationTextField.frame.origin.y+relationTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50))
        addNomineeBtn.colors = .init(button: UIColor.white, shadow: UIColor.white)
        addNomineeBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        addNomineeBtn.setTitle("ADD NOMINEE", for: .normal)
        addNomineeBtn.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        addNomineeBtn.shadowHeight = 3
        addNomineeBtn.layer.borderWidth=1
        addNomineeBtn.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        addNomineeBtn.addTarget(self, action: #selector(BankAccountDetailsVC.addNominee(_:)), for: .touchUpInside)
        addNomineeBtn.layer.cornerRadius = 6
        addNomineeBtn.tag=1
        
        lbl.isHidden=true
        nameTxtField.isHidden=true
        dobTxtField.isHidden=true
        shareTextField.isHidden=true
        relationTextField.isHidden=true
        removeBtn.isHidden=true
        addNomineeBtn.isHidden=true
        
        scrollView.addSubview(lbl)
        scrollView.addSubview(nameTxtField)
        scrollView.addSubview(dobTxtField)
        scrollView.addSubview(shareTextField)
        scrollView.addSubview(relationTextField)
        scrollView.addSubview(removeBtn)
        scrollView.addSubview(addNomineeBtn)
        

    }
    
    func secondNominee(){
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        lbl2=UILabel()
        lbl2.text="Second Nominee"
        lbl2.textColor=UIColor.red
        
        let nameIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        nameTxtField2=UITextField(frame:CGRect(x:10,y:lbl2.frame.origin.y+lbl2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        nameTxtField2.layer.cornerRadius=6
        nameTxtField2.layer.masksToBounds=true
        nameTxtField2.layer.borderColor=UIColor.lightGray.cgColor
        nameTxtField2.layer.borderWidth=0.6
        nameTxtField2.delegate=self
        nameTxtField2.attributedPlaceholder = NSAttributedString(string: "Name", attributes:attributes)
        nameTxtField2.leftView = nameIndentView
        nameTxtField2.leftViewMode = .always
        nameTxtField2.font=UIFont.systemFont(ofSize: 14)
        let currentDateTime=NSDate()
        let formatter=DateFormatter()
        formatter.dateFormat="E, d MMM h:mm a"
        
        let toolbar=UIToolbar()
        toolbar.backgroundColor=colors.APP_THEME_COLOR
        toolbar.barTintColor=colors.APP_THEME_COLOR
        toolbar.tintColor=UIColor.white
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(BankAccountDetailsVC.barBtnAction2(_:)))
        doneButton.tag=2
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL"  , style: UIBarButtonItemStyle.done, target: self, action:  #selector(BankAccountDetailsVC.cancelBtnAction(_:)))
        cancelButton.tag=2
        
        toolbar.items=[doneButton,spaceButton,cancelButton]
        
        datePickerView2=UIDatePicker()
        datePickerView2.datePickerMode=UIDatePickerMode.date
        datePickerView2.backgroundColor=UIColor.white
        datePickerView2.maximumDate=currentDateTime as Date
        datePickerView2.tintColor=UIColor.black
        datePickerView2.tag=2
        datePickerView2.addTarget(self, action: #selector(BankAccountDetailsVC.datePickerAction(_:)), for: UIControlEvents.valueChanged)
        
        let dobIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        dobTxtField2=UITextField(frame:CGRect(x:10,y:nameTxtField2.frame.origin.y+nameTxtField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        dobTxtField2.layer.cornerRadius=6
        dobTxtField2.layer.masksToBounds=true
        dobTxtField2.layer.borderColor=UIColor.lightGray.cgColor
        dobTxtField2.layer.borderWidth=0.6
        dobTxtField2.delegate=self
        dobTxtField2.attributedPlaceholder = NSAttributedString(string: "Date of birth", attributes:attributes)
        dobTxtField2.leftView = dobIndentView
        dobTxtField2.leftViewMode = .always
        dobTxtField2.font=UIFont.systemFont(ofSize: 14)
        dobTxtField2.inputView=datePickerView2
        
        dobTxtField2.inputAccessoryView=toolbar
        
        let shareIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        shareTextField2=UITextField(frame:CGRect(x:10,y:dobTxtField2.frame.origin.y+dobTxtField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        shareTextField2.layer.cornerRadius=6
        shareTextField2.layer.masksToBounds=true
        shareTextField2.layer.borderColor=UIColor.lightGray.cgColor
        shareTextField2.layer.borderWidth=0.6
        shareTextField2.delegate=self
        shareTextField2.attributedPlaceholder = NSAttributedString(string: "Share %", attributes:attributes)
        shareTextField2.leftView = shareIndentView
        shareTextField2.leftViewMode = .always
        shareTextField2.font=UIFont.systemFont(ofSize: 14)
        shareTextField2.keyboardType = .numberPad
        
        let relationIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        relationTextField2=UITextField(frame:CGRect(x:10,y:shareTextField2.frame.origin.y+shareTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        relationTextField2.layer.cornerRadius=6
        relationTextField2.layer.masksToBounds=true
        relationTextField2.layer.borderColor=UIColor.lightGray.cgColor
        relationTextField2.layer.borderWidth=0.6
        relationTextField2.delegate=self
        relationTextField2.attributedPlaceholder = NSAttributedString(string: "Relation", attributes:attributes)
        relationTextField2.leftView = relationIndentView
        relationTextField2.leftViewMode = .always
        relationTextField2.font=UIFont.systemFont(ofSize: 14)
        
        removeBtn2 = PressableButton(frame: CGRect(x:10,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50))
        removeBtn2.colors = .init(button: UIColor.white, shadow: UIColor.white)
        removeBtn2.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        removeBtn2.setTitle("REMOVE", for: .normal)
        removeBtn2.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        removeBtn2.shadowHeight = 3
        removeBtn2.layer.borderWidth=1
        removeBtn2.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        removeBtn2.addTarget(self, action: #selector(BankAccountDetailsVC.removeBtnAction(_:)), for: .touchUpInside)
        removeBtn2.tag=2
        removeBtn2.layer.cornerRadius = 6
        
        addNomineeBtn2 = PressableButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50))
        addNomineeBtn2.colors = .init(button: UIColor.white, shadow: UIColor.white)
        addNomineeBtn2.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        addNomineeBtn2.setTitle("ADD NOMINEE", for: .normal)
        addNomineeBtn2.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        addNomineeBtn2.shadowHeight = 3
        addNomineeBtn2.layer.borderWidth=1
        addNomineeBtn2.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        addNomineeBtn2.addTarget(self, action: #selector(BankAccountDetailsVC.addNominee(_:)), for: .touchUpInside)
        addNomineeBtn2.tag=2
        addNomineeBtn2.layer.cornerRadius = 6
        
        lbl2.isHidden=true
        nameTxtField2.isHidden=true
        dobTxtField2.isHidden=true
        shareTextField2.isHidden=true
        relationTextField2.isHidden=true
        removeBtn2.isHidden=true
        addNomineeBtn2.isHidden=true
        
        scrollView.addSubview(lbl2)
        scrollView.addSubview(nameTxtField2)
        scrollView.addSubview(dobTxtField2)
        scrollView.addSubview(shareTextField2)
        scrollView.addSubview(relationTextField2)
        scrollView.addSubview(removeBtn2)
        scrollView.addSubview(addNomineeBtn2)
        
        
    }
    func thirdNominee(){
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        lbl3=UILabel(frame:CGRect(x:10,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl3.text="Third Nominee"
        lbl3.textColor=UIColor.red
        
        let nameIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        nameTxtField3=UITextField(frame:CGRect(x:10,y:lbl3.frame.origin.y+lbl3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        nameTxtField3.layer.cornerRadius=6
        nameTxtField3.layer.masksToBounds=true
        nameTxtField3.layer.borderColor=UIColor.lightGray.cgColor
        nameTxtField3.layer.borderWidth=0.6
        nameTxtField3.delegate=self
        nameTxtField3.attributedPlaceholder = NSAttributedString(string: "Name", attributes:attributes)
        nameTxtField3.leftView = nameIndentView
        nameTxtField3.leftViewMode = .always
        nameTxtField3.font=UIFont.systemFont(ofSize: 14)
        
        let currentDateTime=NSDate()
        let formatter=DateFormatter()
        formatter.dateFormat="E, d MMM h:mm a"
        
        let toolbar=UIToolbar()
        toolbar.backgroundColor=colors.APP_THEME_COLOR
        toolbar.barTintColor=colors.APP_THEME_COLOR
        toolbar.tintColor=UIColor.white
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(BankAccountDetailsVC.barBtnAction3(_:)))
        doneButton.tag=3
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL"  , style: UIBarButtonItemStyle.done, target: self, action:  #selector(BankAccountDetailsVC.cancelBtnAction(_:)))
        cancelButton.tag=3
        
        toolbar.items=[doneButton,spaceButton,cancelButton]
        
        datePickerView3=UIDatePicker()
        datePickerView3.datePickerMode=UIDatePickerMode.date
        datePickerView3.backgroundColor=UIColor.white
        datePickerView3.maximumDate=currentDateTime as Date
        datePickerView3.tintColor=UIColor.black
        datePickerView3.tag=3
        datePickerView3.addTarget(self, action: #selector(BankAccountDetailsVC.datePickerAction3(_:)), for: UIControlEvents.valueChanged)
        
        let dobIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        dobTxtField3=UITextField(frame:CGRect(x:10,y:nameTxtField3.frame.origin.y+nameTxtField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        dobTxtField3.layer.cornerRadius=6
        dobTxtField3.layer.masksToBounds=true
        dobTxtField3.layer.borderColor=UIColor.lightGray.cgColor
        dobTxtField3.layer.borderWidth=0.6
        dobTxtField3.delegate=self
        dobTxtField3.attributedPlaceholder = NSAttributedString(string: "Date of birth", attributes:attributes)
        dobTxtField3.leftView = dobIndentView
        dobTxtField3.leftViewMode = .always
        dobTxtField3.font=UIFont.systemFont(ofSize: 14)
        dobTxtField3.inputView=datePickerView3
        dobTxtField3.inputAccessoryView=toolbar
        
        let shareIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        shareTextField3=UITextField(frame:CGRect(x:10,y:dobTxtField3.frame.origin.y+dobTxtField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        shareTextField3.layer.cornerRadius=6
        shareTextField3.layer.masksToBounds=true
        shareTextField3.layer.borderColor=UIColor.lightGray.cgColor
        shareTextField3.layer.borderWidth=0.6
        shareTextField3.delegate=self
        shareTextField3.attributedPlaceholder = NSAttributedString(string: "Share %", attributes:attributes)
        shareTextField3.leftView = shareIndentView
        shareTextField3.leftViewMode = .always
        shareTextField3.font=UIFont.systemFont(ofSize: 14)
        shareTextField3.keyboardType = .numberPad

        let relationIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        relationTextField3=UITextField(frame:CGRect(x:10,y:shareTextField3.frame.origin.y+shareTextField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60))
        relationTextField3.layer.cornerRadius=6
        relationTextField3.layer.masksToBounds=true
        relationTextField3.layer.borderColor=UIColor.lightGray.cgColor
        relationTextField3.layer.borderWidth=0.6
        relationTextField3.delegate=self
        relationTextField3.attributedPlaceholder = NSAttributedString(string: "Relation", attributes:attributes)
        relationTextField3.leftView = relationIndentView
        relationTextField3.leftViewMode = .always
        relationTextField3.font=UIFont.systemFont(ofSize: 14)
        
        removeBtn3 = PressableButton(frame: CGRect(x:10,y:relationTextField3.frame.origin.y+relationTextField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:50))
        removeBtn3.colors = .init(button: UIColor.white, shadow: UIColor.white)
        removeBtn3.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        removeBtn3.setTitle("REMOVE", for: .normal)
        removeBtn3.setTitleColor(colors.APP_THEME_COLOR, for: .normal)
        removeBtn3.shadowHeight = 3
        removeBtn3.layer.borderWidth=1
        removeBtn3.layer.borderColor=colors.APP_THEME_COLOR.cgColor
        removeBtn3.addTarget(self, action: #selector(BankAccountDetailsVC.removeBtnAction(_:)), for: .touchUpInside)
        removeBtn3.tag=3
        removeBtn3.layer.cornerRadius = 6
        
        lbl3.isHidden=true
        nameTxtField3.isHidden=true
        dobTxtField3.isHidden=true
        shareTextField3.isHidden=true
        relationTextField3.isHidden=true
        removeBtn3.isHidden=true
        
        scrollView.addSubview(lbl3)
        scrollView.addSubview(nameTxtField3)
        scrollView.addSubview(dobTxtField3)
        scrollView.addSubview(shareTextField3)
        scrollView.addSubview(relationTextField3)
        scrollView.addSubview(removeBtn3)
        
        
    }
    @objc func barBtnAction(_ sender:UIButton){
        ifscTxtField.resignFirstResponder()
        accNoTxtField.resignFirstResponder()
        accHolderNameTxtField.resignFirstResponder()
        nameTxtField.resignFirstResponder()
        dobTxtField.resignFirstResponder()
        shareTextField.resignFirstResponder()
        relationTextField.resignFirstResponder()
       
        if(self.yearDiff < 18){
            self.utils.popUp(title: "", message: "Age should be greater than 18")
            self.present(self.utils.popup, animated: true, completion: nil)
                dobTxtField.text="Date of birth"
                dobTxtField.textColor=UIColor.lightGray
        }
        else{
            dobTxtField.textColor=UIColor.black
        }
    }
    @objc func barBtnAction2(_ sender:UIButton){
        
        nameTxtField2.resignFirstResponder()
        dobTxtField2.resignFirstResponder()
        shareTextField2.resignFirstResponder()
        relationTextField2.resignFirstResponder()
      
        if(self.yearDiff2 < 18){
            self.utils.popUp(title: "", message: "Age should be greater than 18")
            self.present(self.utils.popup, animated: true, completion: nil)
            dobTxtField2.text="Date of birth"
            dobTxtField2.textColor=UIColor.lightGray
        }
        else{
            dobTxtField2.textColor=UIColor.black
        }
    }
    @objc func barBtnAction3(_ sender:UIButton){
        
        nameTxtField3.resignFirstResponder()
        dobTxtField3.resignFirstResponder()
        shareTextField3.resignFirstResponder()
        relationTextField3.resignFirstResponder()
        
        if(self.yearDiff3 < 18){
            self.utils.popUp(title: "", message: "Age should be greater than 18")
            self.present(self.utils.popup, animated: true, completion: nil)
            dobTxtField3.text="Date of birth"
            dobTxtField3.textColor=UIColor.lightGray
        }
        else{
            dobTxtField3.textColor=UIColor.black
        }
    }
    @objc func cancelBtnAction(_ sender:UIButton){
        nameTxtField3.resignFirstResponder()
        dobTxtField3.resignFirstResponder()
        shareTextField3.resignFirstResponder()
        relationTextField3.resignFirstResponder()
        
        nameTxtField2.resignFirstResponder()
        dobTxtField2.resignFirstResponder()
        shareTextField2.resignFirstResponder()
        relationTextField2.resignFirstResponder()
        
        nameTxtField.resignFirstResponder()
        dobTxtField.resignFirstResponder()
        shareTextField.resignFirstResponder()
        relationTextField.resignFirstResponder()
    }
    @objc func datePickerAction(_ sender:UIDatePicker){
        
        let dateFormat=DateFormatter()
        dateFormat.dateFormat="d MMM, yyyy"
        
        let datestrFormatter=DateFormatter()
        datestrFormatter.dateFormat="yyyy-MM-dd"
        
        //dateStr=datestrFormatter.string(from: sender.date as Date)
        let calendar = Calendar.current
        let selectedYear = calendar.component(.year, from: sender.date)
        let currYear = calendar.component(.year, from: Date())
        
        if sender.tag == 1{
            self.yearDiff=currYear-selectedYear
            dobTxtField.text=dateFormat.string(from: sender.date)
        }
        else if sender.tag == 2{
            self.yearDiff2=currYear-selectedYear
            dobTxtField2.text=dateFormat.string(from: sender.date)
        }
        else {
            self.yearDiff3=currYear-selectedYear
            dobTxtField3.text=dateFormat.string(from: sender.date)
        }
    }
    func datePickerAction2(_ sender:UIDatePicker){
        
        let dateFormat=DateFormatter()
        dateFormat.dateFormat="d MMM, yyyy"
        
        let datestrFormatter=DateFormatter()
        datestrFormatter.dateFormat="yyyy-MM-dd"
        
        //dateStr=datestrFormatter.string(from: sender.date as Date)
        let calendar = Calendar.current
        let selectedYear = calendar.component(.year, from: sender.date)
        let currYear = calendar.component(.year, from: Date())
        
        self.yearDiff2=currYear-selectedYear
        dobTxtField2.text=dateFormat.string(from: sender.date)
        
    }
    @objc func datePickerAction3(_ sender:UIDatePicker){
        
        let dateFormat=DateFormatter()
        dateFormat.dateFormat="d MMM, yyyy"
        
        let datestrFormatter=DateFormatter()
        datestrFormatter.dateFormat="yyyy-MM-dd"
        
        //dateStr=datestrFormatter.string(from: sender.date as Date)
        let calendar = Calendar.current
        let selectedYear = calendar.component(.year, from: sender.date)
        let currYear = calendar.component(.year, from: Date())
        
        self.yearDiff3=currYear-selectedYear
        
        dobTxtField3.text=dateFormat.string(from: sender.date)
        
    }
    @objc func onContinue(_ sender:UIButton){
        
        if(ifscTxtField.text?.isEmpty == true){
            self.utils.popUp(title: "", message: "IFSC can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if switch1.isOn == true  && micrTxtField.isHidden == true && errorLbl.isHidden == true{
            self.checkIFSC()
            return
        }
        if switch1.isOn == false  && micrTxtField.isHidden == true && errorLbl.isHidden == true{
            self.checkIFSC()
            return
        }
        if resetBtn.isHidden == false {
            if(bankAccountTypeBtn.currentTitle == "Bank Account Type"){
                self.utils.popUp(title: "", message: "Select Bank Account Type")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            if(accNoTxtField.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Account Number con not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            if(accHolderNameTxtField.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Account Holder Name con not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            if(incomeSourceBtn.currentTitle == "Income Source"){
                self.utils.popUp(title: "", message: "Select Income Source")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            
            if bankAddressTxtField.isHidden == false {
                if(bankAddressTxtField.text?.isEmpty == true){
                    self.utils.popUp(title: "", message: "Bank Address can not be empty")
                    self.present(self.utils.popup, animated: true, completion: nil)
                    return
                }
                else {
                    FinCartUserDefaults.sharedInstance.saveBankAddress(bankAddressTxtField.text!)
                }
                if(bankNameBtn.currentTitle == "Bank Name"){
                    self.utils.popUp(title: "", message: "Select Bank Name")
                    self.present(self.utils.popup, animated: true, completion: nil)
                    return
                }
                else {
                    let finCartUserDefaults = FinCartUserDefaults.sharedInstance

                    if bankNameBtn.currentTitle == "Allahabad Bank"{
                        finCartUserDefaults.saveBankName("ALB")
                    }
                    else  if bankNameBtn.currentTitle == "Andhra Bank"{
                        finCartUserDefaults.saveBankName("ADB")
                    }
                    else  if bankNameBtn.currentTitle == "Axis Bank"{
                        finCartUserDefaults.saveBankName("UTI")
                    }
                    else  if bankNameBtn.currentTitle == "Bandhan Bank Netbanking"{
                        finCartUserDefaults.saveBankName("BDN")
                    }
                    else  if bankNameBtn.currentTitle == "Bank of Bahrain and Kuwait"{
                        finCartUserDefaults.saveBankName("BBK")
                    }
                    else  if bankNameBtn.currentTitle == "Bank of Baroda"{
                        finCartUserDefaults.saveBankName("BBR")
                    }
                    else  if bankNameBtn.currentTitle == "Bank of Baroda - Corporate Banking"{
                        finCartUserDefaults.saveBankName("BBC")
                    }
                    else  if bankNameBtn.currentTitle == "Bank of Maharashtra"{
                        finCartUserDefaults.saveBankName("BOM")
                    }
                    else  if bankNameBtn.currentTitle == "Canara Bank"{
                        finCartUserDefaults.saveBankName("CNB")
                    }
                    else  if bankNameBtn.currentTitle == "Catholic Syrian Bank"{
                        finCartUserDefaults.saveBankName("CSB")
                    }
                    else  if bankNameBtn.currentTitle == "Central Bank of India"{
                        finCartUserDefaults.saveBankName("CBI")
                    }
                    else  if bankNameBtn.currentTitle == "CITI Bank"{
                        finCartUserDefaults.saveBankName("CIT")
                    }
                    else  if bankNameBtn.currentTitle == "Corporation Bank"{
                        finCartUserDefaults.saveBankName("CRP")
                    }
                    else  if bankNameBtn.currentTitle == "Cosmos Bank"{
                        finCartUserDefaults.saveBankName("COB")
                    }
                    else  if bankNameBtn.currentTitle == "DCB Bank"{
                        finCartUserDefaults.saveBankName("DCB")
                    }
                    else  if bankNameBtn.currentTitle == "Dena Bank"{
                        finCartUserDefaults.saveBankName("DEN")
                    }
                    else  if bankNameBtn.currentTitle == "Deutsche Bank"{
                        finCartUserDefaults.saveBankName("DBK")
                    }
                    else  if bankNameBtn.currentTitle == "Development Credit Bank - Corporate"{
                        finCartUserDefaults.saveBankName("DC2")
                    }
                    else  if bankNameBtn.currentTitle == "Dhanlaxmi Bank"{
                        finCartUserDefaults.saveBankName("DLB")
                    }
                    else  if bankNameBtn.currentTitle == "Federal Bank"{
                        finCartUserDefaults.saveBankName("FBK")
                    }
                    else  if bankNameBtn.currentTitle == "HDFC Bank"{
                        finCartUserDefaults.saveBankName("HDF")
                    }
                    else  if bankNameBtn.currentTitle == "HSBC Bank"{
                        finCartUserDefaults.saveBankName("HSB")
                    }
                    else  if bankNameBtn.currentTitle == "ICICI Bank"{
                        finCartUserDefaults.saveBankName("ICI")
                    }
                    else  if bankNameBtn.currentTitle == "IDBI Bank"{
                        finCartUserDefaults.saveBankName("IDB")
                    }
                    else  if bankNameBtn.currentTitle == "Indian Bank"{
                        finCartUserDefaults.saveBankName("INB")
                    }
                    else  if bankNameBtn.currentTitle == "Indian Overseas Bank"{
                        finCartUserDefaults.saveBankName("IOB")
                    }
                    else  if bankNameBtn.currentTitle == "Induslnd Bank"{
                        finCartUserDefaults.saveBankName("IDS")
                    }
                    else  if bankNameBtn.currentTitle == "ING Vysya Bank"{
                        finCartUserDefaults.saveBankName("ING")
                    }
                    else  if bankNameBtn.currentTitle == "Ju0026k Bank"{
                        finCartUserDefaults.saveBankName("JKB")
                    }
                    else  if bankNameBtn.currentTitle == "Janata Sahakari Bank"{
                        finCartUserDefaults.saveBankName("JSB")
                    }
                    else  if bankNameBtn.currentTitle == "Kalyan Janata Sahakari Bank Netbanking"{
                        finCartUserDefaults.saveBankName("KJB")
                    }
                    else  if bankNameBtn.currentTitle == "Karnataka Bank"{
                        finCartUserDefaults.saveBankName("KBL")
                    }
                    else  if bankNameBtn.currentTitle == "Karur Vysya Bank"{
                        finCartUserDefaults.saveBankName("KVB")
                    }
                    else  if bankNameBtn.currentTitle == "Kotak Mahindra Bank"{
                        finCartUserDefaults.saveBankName("162")
                    }
                    else  if bankNameBtn.currentTitle == "Laxmi Vilas Bank - Corporate Net Banking"{
                        finCartUserDefaults.saveBankName("LVC")
                    }
                    else  if bankNameBtn.currentTitle == "Laxmi Vilas Bank - Retail Net Banking"{
                        finCartUserDefaults.saveBankName("LVR")
                    }
                    else  if bankNameBtn.currentTitle == "Mehsana Urban Co-operative Bank"{
                        finCartUserDefaults.saveBankName("MSB")
                    }
                    else  if bankNameBtn.currentTitle == "NKGSB Bank"{
                        finCartUserDefaults.saveBankName("NKB")
                    }
                    else  if bankNameBtn.currentTitle == "Oriental Bank Of Commerce"{
                        finCartUserDefaults.saveBankName("OBC")
                    }
                    else  if bankNameBtn.currentTitle == "Punjab u0026 Sind Bank"{
                        finCartUserDefaults.saveBankName("PSB")
                    }
                    else  if bankNameBtn.currentTitle == "Punjab National Bank"{
                        finCartUserDefaults.saveBankName("PNB")
                    }
                    else  if bankNameBtn.currentTitle == "Punjab National Bank - Corporate Banking"{
                        finCartUserDefaults.saveBankName("CPN")
                    }
                    else  if bankNameBtn.currentTitle == "Ratnakar Bank"{
                        finCartUserDefaults.saveBankName("RTN")
                    }
                    else  if bankNameBtn.currentTitle == "RBS(The Royal Bank of Scotland)"{
                        finCartUserDefaults.saveBankName("RBS")
                    }else  if bankNameBtn.currentTitle == "Saraswat Bank"{
                        finCartUserDefaults.saveBankName("SWB")
                    }else  if bankNameBtn.currentTitle == "Shamrao Vitthal Co-operative Bank"{
                        finCartUserDefaults.saveBankName("SVC")
                    }
                    else  if bankNameBtn.currentTitle == "South Indian Bank"{
                        finCartUserDefaults.saveBankName("SIB")
                    }
                    else  if bankNameBtn.currentTitle == "Standard Chartered Bank"{
                        finCartUserDefaults.saveBankName("SCB")
                    }
                    else  if bankNameBtn.currentTitle == "State Bank Of Bikaner and Jaipur"{
                        finCartUserDefaults.saveBankName("SBJ")
                    }
                    else  if bankNameBtn.currentTitle == "State Bank of Hyderabad"{
                        finCartUserDefaults.saveBankName("SBH")
                    }
                    else  if bankNameBtn.currentTitle == "State Bank of India"{
                        finCartUserDefaults.saveBankName("SBI")
                    }
                    else  if bankNameBtn.currentTitle == "State Bank of Mysore"{
                        finCartUserDefaults.saveBankName("SBM")
                    }
                    else  if bankNameBtn.currentTitle == "State Bank of Patiala"{
                        finCartUserDefaults.saveBankName("SBP")
                    }
                    else  if bankNameBtn.currentTitle == "State Bank of Travencore"{
                        finCartUserDefaults.saveBankName("SBT")
                    }
                    else  if bankNameBtn.currentTitle == "Syndicate Bank"{
                        finCartUserDefaults.saveBankName("SYD")
                    }
                    else  if bankNameBtn.currentTitle == "Tamilnad Mercantile Bank"{
                        finCartUserDefaults.saveBankName("TMB")
                    }
                    else  if bankNameBtn.currentTitle == "Tamilnadu State Coop Bank"{
                        finCartUserDefaults.saveBankName("TNC")
                    }
                    else  if bankNameBtn.currentTitle == "UCO Bank"{
                        finCartUserDefaults.saveBankName("UCO")
                    }
                    else  if bankNameBtn.currentTitle == "Union Bank of India"{
                        finCartUserDefaults.saveBankName("UBI")
                    }else  if bankNameBtn.currentTitle == "United Bank Of India"{
                        finCartUserDefaults.saveBankName("BBC")
                    }
                    else  if bankNameBtn.currentTitle == "Vijaya Bank"{
                        finCartUserDefaults.saveBankName("VJB")
                    }
                    else {
                        finCartUserDefaults.saveBankName("YBK")
                    }
                }
                if(bankCityTxtField.text?.isEmpty == true){
                    self.utils.popUp(title: "", message: "Bank City can not be empty")
                    self.present(self.utils.popup, animated: true, completion: nil)
                    return
                }
                else {
                    FinCartUserDefaults.sharedInstance.saveBankCity(bankCityTxtField.text!)
                }
                if(micrTxtField.text?.isEmpty == true){
                    self.utils.popUp(title: "", message: "MICR can not be empty")
                    self.present(self.utils.popup, animated: true, completion: nil)
                    return
                }
                else {
                    FinCartUserDefaults.sharedInstance.saveMicr(micrTxtField.text!)
                }
            }
        }
        if self.switch1.isOn == true &&  nameTxtField.isHidden == false{
            if(nameTxtField.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "First Nominee Name can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveFirstNomineeName(nameTxtField.text!)
            }
            if(dobTxtField.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Select First Nominee DOB")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveFirstNomineeDob(dobTxtField.text!)
            }
            if(shareTextField.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "First Nominee Share can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
           
            if(relationTextField.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "First Nominee Relation can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveFirstNomineeRelation(relationTextField.text!)
            }
            if(Int(shareTextField.text!)! != 100 && shareTextField2.isHidden == true){
                self.utils.popUp(title: "", message: "Total Nominee Percentage Must Be 100")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveFirstNomineeShare(shareTextField.text!)
            }
        }
        if self.switch1.isOn == true &&  nameTxtField2.isHidden == false{
            if(nameTxtField2.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Second Nominee Name can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveSecondNomineeName(nameTxtField2.text!)
            }
            if(dobTxtField2.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Select Second Nominee DOB")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveSecondNomineeDob(dobTxtField2.text!)
            }
            if(shareTextField2.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Second Nominee Share can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            
            if(relationTextField2.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Second Nominee Relation can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveSecondNomineeRelation(relationTextField2.text!)
            }
            if((Int(shareTextField.text!)! + Int(shareTextField2.text!)! != 100) && shareTextField3.isHidden == true){
                self.utils.popUp(title: "", message: "Total Nominee Percentage Must Be 100")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveSecondNomineeShare(shareTextField2.text!)
            }
        }
        if self.switch1.isOn == true &&  nameTxtField3.isHidden == false{
            if(nameTxtField3.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Third Nominee Name can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveThirdNomineeName(nameTxtField3.text!)
            }
            if(dobTxtField3.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Select Third Nominee DOB")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveThirdNomineeDob(dobTxtField3.text!)
            }
            if(shareTextField3.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Third Nominee Share can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            if(relationTextField3.text?.isEmpty == true){
                self.utils.popUp(title: "", message: "Third Nominee Relation can not be empty")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveThirdNomineeRelation(relationTextField3.text!)
            }
            if(Int(shareTextField.text!)! + Int(shareTextField2.text!)! + Int(shareTextField3.text!)! != 100){
                self.utils.popUp(title: "", message: "Total Nominee Percentage Must Be 100")
                self.present(self.utils.popup, animated: true, completion: nil)
                return
            }
            else {
                FinCartUserDefaults.sharedInstance.saveThirdNomineeShare(shareTextField3.text!)
            }
        }
        
        
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        
        if bankAccountTypeBtn.currentTitle == "Savings"{
            finCartUserDefaults.saveAccountTypeKey("SB")
        }
        else {
            finCartUserDefaults.saveAccountTypeKey("CA")
        }
        
        if incomeSourceBtn.currentTitle == "Salary"{
            finCartUserDefaults.saveIncomeSourceKey("1")
        }
        else  if incomeSourceBtn.currentTitle == "Business Income"{
            finCartUserDefaults.saveIncomeSourceKey("2")
        }
        else  if incomeSourceBtn.currentTitle == "Gift"{
            finCartUserDefaults.saveIncomeSourceKey("3")
        }
        else  if incomeSourceBtn.currentTitle == "Ancestral Property"{
            finCartUserDefaults.saveIncomeSourceKey("4")
        }
        else  if incomeSourceBtn.currentTitle == "Rental Income"{
            finCartUserDefaults.saveIncomeSourceKey("5")
        }
        else  if incomeSourceBtn.currentTitle == "Prize Money"{
            finCartUserDefaults.saveIncomeSourceKey("6")
        }
        else  if incomeSourceBtn.currentTitle == "Royalty"{
            finCartUserDefaults.saveIncomeSourceKey("7")
        }
        else {
            finCartUserDefaults.saveIncomeSourceKey("8")
        }
        FinCartUserDefaults.sharedInstance.saveIfsc(ifscTxtField.text!)
        print(ifscTxtField.text!)
        print(FinCartUserDefaults.sharedInstance.retrieveIfsc())
        FinCartUserDefaults.sharedInstance.saveAccountNo(accNoTxtField.text!)
        FinCartUserDefaults.sharedInstance.saveAccountHolderName(accHolderNameTxtField.text!)
        
        if self.errorLbl.text=="Bank Details Found."{
            let finCartUserDefaults=FinCartUserDefaults.sharedInstance
            if finCartUserDefaults.retrieveInvestorTypeKey() == "24"{
                if bankAccountTypeBtn.currentTitle == "NRE"{
                    finCartUserDefaults.saveAccountTypeKey("NRE")
                }
                else {
                    finCartUserDefaults.saveAccountTypeKey("NRO")
                }
                let controller=self.storyboard?.instantiateViewController(withIdentifier: "FatcaDetailsVC") as! FatcaDetailsVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
            else {
                FinCartUserDefaults.sharedInstance.saveIfsc(ifscTxtField.text!)
                FinCartUserDefaults.sharedInstance.saveAccountNo(accNoTxtField.text!)
                FinCartUserDefaults.sharedInstance.saveAccountHolderName(accHolderNameTxtField.text!)
                
                print(FinCartUserDefaults.sharedInstance.retrieveIfsc())
                print(ifscTxtField.text!)
                let controller=self.storyboard?.instantiateViewController(withIdentifier: "DigitalSignatureProceed") as! DigitalSignatureProceed
                self.navigationController?.pushViewController(controller, animated: true)
            }
            return
        }
        if finCartUserDefaults.retrieveInvestorTypeKey() == "24"{
            if bankAccountTypeBtn.currentTitle == "NRE"{
                finCartUserDefaults.saveAccountTypeKey("NRE")
            }
            else {
                finCartUserDefaults.saveAccountTypeKey("NRO")
            }
            let controller=self.storyboard?.instantiateViewController(withIdentifier: "FatcaDetailsVC") as! FatcaDetailsVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        else {
            FinCartUserDefaults.sharedInstance.saveIfsc(ifscTxtField.text!)
            FinCartUserDefaults.sharedInstance.saveAccountNo(accNoTxtField.text!)
            FinCartUserDefaults.sharedInstance.saveAccountHolderName(accHolderNameTxtField.text!)
            
            print(FinCartUserDefaults.sharedInstance.retrieveIfsc())
            print(ifscTxtField.text!)
            let controller=self.storyboard?.instantiateViewController(withIdentifier: "DigitalSignatureProceed") as! DigitalSignatureProceed
            self.navigationController?.pushViewController(controller, animated: true)            
        }
        
    }
    
    func checkIFSC(){
       
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: "Checking...")
        
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance

        let urlString="\(FinCartMacros.kBaseUrl)\(FinCartMacros.kFinCheckIfsc)/\(ifscTxtField.text!)"
//        let headers=["Authorization":"Bearer \(String(describing: finCartUserDefaults.retrieveAccessToken()))"]
        let headers=["Authorization":"bearer " + finCartUserDefaults.retrieveAccessToken()!]
        print(headers)
        Alamofire.request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers).validate().responseJSON{
            response in
            
            if response.result.isSuccess {
                SVProgressHUD.dismiss()
                print(response.result.value as! NSDictionary)
                if((response.result.value as! NSDictionary).value(forKey: "status") as! String == "failed"){
                    
                    UserDefaults.standard.removeObject(forKey: "Branch")
                    self.micrTxtField.isHidden=false
                    self.bankCityTxtField.isHidden=false
                    self.bankNameBtn.isHidden=false
                    self.bankAddressTxtField.isHidden=false
                    self.errorLbl.isHidden=false
                    self.resetBtn.isHidden=false
                    self.errorLbl.text="Bank Details Not Found. Please Check IFSC or Fill Details."
                    self.errorLbl.textColor=UIColor.red

                    self.continueBtn.frame=CGRect(x:10,y:self.dimensions.SCREEN_HEIGHT-124,width:self.dimensions.SCREEN_WIDTH/2-15,height:50)
                    self.continueBtn.setTitle("CONTINUE", for: .normal)
                    self.resetBtn.frame=CGRect(x:self.dimensions.SCREEN_WIDTH/2+5,y:self.dimensions.SCREEN_HEIGHT-124,width:self.dimensions.SCREEN_WIDTH/2-15,height:50)
                    
                    self.errorLbl.frame=CGRect(x:10,y:self.continueBtn.frame.origin.y-40,width:self.dimensions.SCREEN_WIDTH-20,height:40)
                    
                    self.switch1.frame=CGRect(x:10,y:self.micrTxtField.frame.origin.y+self.micrTxtField.frame.size.height+15,width:15,height:20)
                    
                    self.scrollView.frame=CGRect(x:0,y:0,width:self.dimensions.SCREEN_WIDTH,height:self.dimensions.SCREEN_HEIGHT-174)
                    
                    self.lbl1.frame=CGRect(x:self.switch1.frame.size.width+20,y:self.micrTxtField.frame.origin.y+self.micrTxtField.frame.size.height+20,width:self.dimensions.SCREEN_WIDTH-self.switch1.frame.size.width-30,height:20)
                    self.lbl.frame=CGRect(x:10,y:self.switch1.frame.origin.y+self.switch1.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH-20,height:20)
                    
                    if(self.micrTxtField.isHidden==false && self.switch1.isOn == true){
                        self.scrollView.contentSize=CGSize.init(width: self.dimensions.SCREEN_WIDTH, height: 1140)
                        
                    }
                    else {
                        self.scrollView.contentSize=CGSize.init(width: self.dimensions.SCREEN_WIDTH, height: 740)
                        
                    }
                    self.nameTxtField.frame=CGRect(x:10,y:self.lbl.frame.origin.y+self.lbl.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH-20,height:60)
                    self.dobTxtField.frame=CGRect(x:10,y:self.nameTxtField.frame.origin.y+self.nameTxtField.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH-20,height:60)
                    self.shareTextField.frame=CGRect(x:10,y:self.dobTxtField.frame.origin.y+self.dobTxtField.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH-20,height:60)
                    self.relationTextField.frame=CGRect(x:10,y:self.shareTextField.frame.origin.y+self.shareTextField.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH-20,height:60)
                    self.removeBtn.frame=CGRect(x:10,y:self.relationTextField.frame.origin.y+self.relationTextField.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH/2-12.5,height:50)
                    self.addNomineeBtn.frame=CGRect(x:self.dimensions.SCREEN_WIDTH/2+2.5,y:self.relationTextField.frame.origin.y+self.relationTextField.frame.size.height+15,width:self.dimensions.SCREEN_WIDTH/2-15,height:50)
                    
                    if self.scrollView.contentSize==CGSize.init(width: self.dimensions.SCREEN_WIDTH, height: 740) {
                        self.lbl.isHidden=true
                        self.nameTxtField.isHidden=true
                        self.dobTxtField.isHidden=true
                        self.shareTextField.isHidden=true
                        self.relationTextField.isHidden=true
                        self.addNomineeBtn.isHidden=true
                    }
                        
                    else {
                        self.lbl.isHidden=false
                        self.nameTxtField.isHidden=false
                        self.dobTxtField.isHidden=false
                        self.shareTextField.isHidden=false
                        self.relationTextField.isHidden=false
                        self.addNomineeBtn.isHidden=false
                        
                    }
                }
                else {
                    self.errorLbl.text="Bank Details Found."
                    self.errorLbl.textColor=UIColor.green
                    self.errorLbl.isHidden=false
                    self.errorLbl.frame=CGRect(x:10,y:self.continueBtn.frame.origin.y-40,width:self.dimensions.SCREEN_WIDTH-20,height:40)
                    self.continueBtn.frame=CGRect(x:10,y:self.dimensions.SCREEN_HEIGHT-124,width:self.dimensions.SCREEN_WIDTH/2-15,height:50)
                    self.continueBtn.setTitle("CONTINUE", for: .normal)
                    self.resetBtn.frame=CGRect(x:self.dimensions.SCREEN_WIDTH/2+5,y:self.dimensions.SCREEN_HEIGHT-124,width:self.dimensions.SCREEN_WIDTH/2-15,height:50)
                    self.resetBtn.isHidden=false
                    FinCartUserDefaults.sharedInstance.saveBankAddress(((response.result.value as! NSDictionary).value(forKey: "data") as! NSDictionary).value(forKey: "ADDRESS") as! String)
                    FinCartUserDefaults.sharedInstance.saveBranch(((response.result.value as! NSDictionary).value(forKey: "data") as! NSDictionary).value(forKey: "BRANCH") as! String)
                    FinCartUserDefaults.sharedInstance.saveBankCity(((response.result.value as! NSDictionary).value(forKey: "data") as! NSDictionary).value(forKey: "CITY") as! String)

                }
                
            }
            else if response.result.isFailure{
                
                if let data = response.data {
                    do {
                        SVProgressHUD.dismiss()
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        let dict:NSDictionary=json! as NSDictionary
                        self.responseData=dict.value(forKey: "Message") as! String
                        print(data)
                    } catch {
                        
                    }
                }
                let popup = PopupDialog(title: "", message: "Your session has expired. Please login again.")
                
                let buttonOne = CancelButton(title: "OK"){
                    
                    self.navigationController?.popToRootViewController(animated: true)
                    
//                    let controller=self.storyboard?.instantiateViewController(withIdentifier: "userLoginScreen") as! FinCartLoginVC
//                    self.navigationController?.pushViewController(controller, animated: true)
                }
                popup.addButtons([buttonOne])
                self.present(popup, animated: true, completion: nil)
            }
        }
    }
    @objc func resetBtnAction(_ sender:UIButton){
        self.ifscTxtField.text=""
        self.bankAccountTypeBtn.setTitle("Bank Account Type", for: .normal)
        self.bankAccountTypeBtn.setTitleColor(UIColor.lightGray, for: .normal)
        self.accNoTxtField.text=""
        self.accHolderNameTxtField.text=""
        self.incomeSourceBtn.setTitle("Income Source", for: .normal)
        self.incomeSourceBtn.setTitleColor(UIColor.lightGray, for: .normal)

        self.bankAddressTxtField.isHidden=true
        self.bankNameBtn.isHidden=true
        self.bankCityTxtField.isHidden=true
        self.micrTxtField.isHidden=true
        self.resetBtn.isHidden=true
        self.errorLbl.isHidden=true
        self.switch1.isOn=false
        self.continueBtn.frame = CGRect(x:10,y:dimensions.SCREEN_HEIGHT-124,width:dimensions.SCREEN_WIDTH-20,height:50)
        self.continueBtn.setTitle("CHECK IFSC", for: .normal)
        scrollView.frame=CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT-134)
        self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)
        switch1.frame=CGRect(x:10,y:incomeSourceBtn.frame.origin.y+accHolderNameTxtField.frame.size.height+15,width:15,height:20)
    lbl1.frame=CGRect(x:switch1.frame.size.width+20,y:incomeSourceBtn.frame.origin.y+accHolderNameTxtField.frame.size.height+20,width:dimensions.SCREEN_WIDTH-switch1.frame.size.width-30,height:20)


    }
    @objc func selectBankAccountType(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "BankAccountTypeVC") as! BankAccountTypeVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func selectIncomeSource(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "IncomeSourceVC") as! IncomeSourceVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func showBankNames(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "BankNameLists") as! BankNameLists
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func handleSwitch(_ sender:UISwitch){
        if sender.tag == 1 && sender.isOn == true{
            lbl.isHidden=false
            nameTxtField.isHidden=false
            dobTxtField.isHidden=false
            shareTextField.isHidden=false
            relationTextField.isHidden=false
            removeBtn.isHidden=false
            addNomineeBtn.isHidden=false
            
            if(self.micrTxtField.isHidden==false){
                lbl.frame=CGRect(x:10,y:micrTxtField.frame.origin.y+micrTxtField.frame.size.height+60,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1130)

            }
            else {
                lbl.frame=CGRect(x:10,y:switch1.frame.origin.y+switch1.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 850)

            }
            nameTxtField.frame=CGRect(x:10,y:lbl.frame.origin.y+lbl.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            dobTxtField.frame=CGRect(x:10,y:nameTxtField.frame.origin.y+nameTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            shareTextField.frame=CGRect(x:10,y:dobTxtField.frame.origin.y+dobTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            relationTextField.frame=CGRect(x:10,y:shareTextField.frame.origin.y+shareTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            removeBtn.frame=CGRect(x:10,y:relationTextField.frame.origin.y+relationTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50)
            addNomineeBtn.frame=CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:relationTextField.frame.origin.y+relationTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50)
            
       
        }
        else{
            lbl.isHidden=true
            nameTxtField.isHidden=true
            dobTxtField.isHidden=true
            shareTextField.isHidden=true
            relationTextField.isHidden=true
            removeBtn.isHidden=true
            addNomineeBtn.isHidden=true
            
            lbl2.isHidden=true
            nameTxtField2.isHidden=true
            dobTxtField2.isHidden=true
            shareTextField2.isHidden=true
            relationTextField2.isHidden=true
            removeBtn2.isHidden=true
            addNomineeBtn2.isHidden=true
            
            lbl3.isHidden=true
            nameTxtField3.isHidden=true
            dobTxtField3.isHidden=true
            shareTextField3.isHidden=true
            relationTextField3.isHidden=true
            removeBtn3.isHidden=true
            addNomineeBtn3.isHidden=true
            
            if(self.micrTxtField.isHidden==false){
                lbl.frame=CGRect(x:10,y:micrTxtField.frame.origin.y+micrTxtField.frame.size.height+60,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 740)
                
            }
            else {
                lbl.frame=CGRect(x:10,y:switch1.frame.origin.y+switch1.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)

            }
        }
    }
    @objc func removeBtnAction(_ sender:UIButton){
        if(sender.tag == 1){
            lbl.isHidden=true
            nameTxtField.isHidden=true
            dobTxtField.isHidden=true
            shareTextField.isHidden=true
            relationTextField.isHidden=true
            removeBtn.isHidden=true
            addNomineeBtn.isHidden=true
            
            switch1.isOn=false
            
            if(self.micrTxtField.isHidden==false){
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 740)
                
            }
            else {
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 450)

            }
        }
        else if sender.tag == 2{
            lbl2.isHidden=true
            nameTxtField2.isHidden=true
            dobTxtField2.isHidden=true
            shareTextField2.isHidden=true
            relationTextField2.isHidden=true
            removeBtn2.isHidden=true
            addNomineeBtn2.isHidden=true
            
            removeBtn.isHidden=false
            addNomineeBtn.isHidden=false
            switch1.isOn=true
            if(self.micrTxtField.isHidden==false){
                lbl.frame=CGRect(x:10,y:micrTxtField.frame.origin.y+micrTxtField.frame.size.height+60,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1140)
                
            }
            else {
                lbl.frame=CGRect(x:10,y:switch1.frame.origin.y+switch1.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 830)
                
            }
        }
        else {
            lbl3.isHidden=true
            nameTxtField3.isHidden=true
            dobTxtField3.isHidden=true
            shareTextField3.isHidden=true
            relationTextField3.isHidden=true
            removeBtn3.isHidden=true
            addNomineeBtn3.isHidden=true
            
            removeBtn2.isHidden=false
            addNomineeBtn2.isHidden=false
            switch1.isOn=true
            if(self.micrTxtField.isHidden==false){
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1470)
                
            }
            else {
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1200)
            }
        }
    }
    @objc func addNominee(_ sender:UIButton){
        if sender.tag == 1{
            lbl2.isHidden=false
            nameTxtField2.isHidden=false
            dobTxtField2.isHidden=false
            shareTextField2.isHidden=false
            relationTextField2.isHidden=false
            removeBtn2.isHidden=false
            addNomineeBtn2.isHidden=false
            
            removeBtn.isHidden=true
            addNomineeBtn.isHidden=true
            
            if(self.micrTxtField.isHidden==false){
                lbl2.frame=CGRect(x:10,y:relationTextField.frame.origin.y+relationTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1500)
                
            }
            else {
                lbl2.frame=CGRect(x:10,y:relationTextField.frame.origin.y+relationTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1200)
                
            }
            nameTxtField2.frame=CGRect(x:10,y:lbl2.frame.origin.y+lbl2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            dobTxtField2.frame=CGRect(x:10,y:nameTxtField2.frame.origin.y+nameTxtField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            shareTextField2.frame=CGRect(x:10,y:dobTxtField2.frame.origin.y+dobTxtField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            relationTextField2.frame=CGRect(x:10,y:shareTextField2.frame.origin.y+shareTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            removeBtn2.frame=CGRect(x:10,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-12.5,height:50)
            addNomineeBtn2.frame=CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH/2-15,height:50)
            
        }
        else {
            lbl3.isHidden=false
            nameTxtField3.isHidden=false
            dobTxtField3.isHidden=false
            shareTextField3.isHidden=false
            relationTextField3.isHidden=false
            removeBtn3.isHidden=false
            addNomineeBtn3.isHidden=false
            
            removeBtn2.isHidden=true
            addNomineeBtn2.isHidden=true
            
            if(self.micrTxtField.isHidden==false){
                lbl3.frame=CGRect(x:10,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1810)
                
            }
            else {
                lbl3.frame=CGRect(x:10,y:relationTextField2.frame.origin.y+relationTextField2.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:20)
                self.scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 1530)

            }
            nameTxtField3.frame=CGRect(x:10,y:lbl3.frame.origin.y+lbl3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            dobTxtField3.frame=CGRect(x:10,y:nameTxtField3.frame.origin.y+nameTxtField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            shareTextField3.frame=CGRect(x:10,y:dobTxtField3.frame.origin.y+dobTxtField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            relationTextField3.frame=CGRect(x:10,y:shareTextField3.frame.origin.y+shareTextField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            removeBtn3.frame=CGRect(x:10,y:relationTextField3.frame.origin.y+relationTextField3.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:50)
            
        }

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ifscTxtField.resignFirstResponder()
        accNoTxtField.resignFirstResponder()
        accHolderNameTxtField.resignFirstResponder()
        return true
    }
}
