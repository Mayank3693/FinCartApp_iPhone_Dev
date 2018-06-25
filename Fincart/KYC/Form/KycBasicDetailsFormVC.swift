//
//  KycBasicDetailsFormVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 1/31/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton

class KycBasicDetailsFormVC: UIViewController,UITextFieldDelegate {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var occupationBtn=UIButton()
    var annualIncomeBtn=UIButton()
    var dobTxtField=UITextField()
    var addressTextField=UITextField()
    var pincodeTextField=UITextField()
    var cityTextField=UITextField()
    var stateTextField=UITextField()
    var continueBtn = PressableButton()
    var datePickerView=UIDatePicker()
    var yearDiff=Int()
    var scrollView=UIScrollView()
    var controller=String()
    var nameTextField=UITextField()
    var countryBtn=UIButton()
    var aadharTxtField=UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        self.pageDesign()
        yearDiff=0
        
        if controller != "fillManual"{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 0)

        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if controller != "fillManual"{
            self.stateTextField.isHidden=true
            self.cityTextField.isHidden=true
            self.dobTxtField.isHidden=true
            self.pincodeTextField.isHidden=true
            self.addressTextField.isHidden=true            
        }
      
        let occupationUserDefaults=UserDefaults.standard
        if(occupationUserDefaults.value(forKey: "occupation") != nil){
            self.occupationBtn.setTitle(occupationUserDefaults.value(forKey: "occupation") as? String, for: .normal)
            self.occupationBtn.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            self.occupationBtn.setTitle("Occupation", for: .normal)
            self.occupationBtn.setTitleColor(UIColor.lightGray, for: .normal)
        }
        let incomeUserDefaults=UserDefaults.standard
        if(incomeUserDefaults.value(forKey: "income") != nil){
            self.annualIncomeBtn.setTitle(incomeUserDefaults.value(forKey: "income") as? String, for: .normal)
            self.annualIncomeBtn.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            self.annualIncomeBtn.setTitle("Annual Income", for: .normal)
            self.annualIncomeBtn.setTitleColor(UIColor.lightGray, for: .normal)
        }
        let countryUserDefaults=UserDefaults.standard
        if(countryUserDefaults.value(forKey: "countryName") != nil){
            self.countryBtn.setTitle(countryUserDefaults.value(forKey: "countryName") as? String, for: .normal)
            self.countryBtn.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            self.countryBtn.setTitle("Country", for: .normal)
            self.countryBtn.setTitleColor(UIColor.lightGray, for: .normal)
        }
    }
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="BASIC DETAILS"
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:20,height:20))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(KycBasicDetailsFormVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
    }
    @objc func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    func pageDesign(){
        
        scrollView=UIScrollView()
        
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.lightGray,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)
        ]
        
        let nameIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        nameTextField=UITextField()
        nameTextField.layer.cornerRadius=6
        nameTextField.layer.masksToBounds=true
        nameTextField.layer.borderColor=UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth=0.6
        nameTextField.delegate=self
        nameTextField.font=UIFont.systemFont(ofSize: 14)
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Your Name", attributes:attributes)
        nameTextField.leftView = nameIndentView
        nameTextField.leftViewMode = .always
        
        let aadharIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        aadharTxtField=UITextField()
        aadharTxtField.layer.cornerRadius=6
        aadharTxtField.layer.masksToBounds=true
        aadharTxtField.layer.borderColor=UIColor.lightGray.cgColor
        aadharTxtField.layer.borderWidth=0.6
        aadharTxtField.delegate=self
        aadharTxtField.font=UIFont.systemFont(ofSize: 14)
        aadharTxtField.attributedPlaceholder = NSAttributedString(string: "Aadhar Card", attributes:attributes)
        aadharTxtField.leftView = aadharIndentView
        aadharTxtField.leftViewMode = .always
        
        occupationBtn=UIButton()
        occupationBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        occupationBtn.setTitleColor(UIColor.black, for: .normal)
        occupationBtn.layer.cornerRadius=6
        occupationBtn.layer.masksToBounds=true
        occupationBtn.layer.borderColor=UIColor.lightGray.cgColor
        occupationBtn.layer.borderWidth=0.6
        occupationBtn.setImage(images.rightArrow, for: .normal)
        occupationBtn.contentHorizontalAlignment = .left
        occupationBtn.addTarget(self, action: #selector(KycBasicDetailsFormVC.showOccupationsList(_:)), for: .touchUpInside)
        
        annualIncomeBtn=UIButton()
        annualIncomeBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        annualIncomeBtn.setTitleColor(UIColor.black, for: .normal)
        annualIncomeBtn.layer.cornerRadius=6
        annualIncomeBtn.layer.masksToBounds=true
        annualIncomeBtn.layer.borderColor=UIColor.lightGray.cgColor
        annualIncomeBtn.layer.borderWidth=0.6
        annualIncomeBtn.setImage(images.rightArrow, for: .normal)
        annualIncomeBtn.contentHorizontalAlignment = .left
        annualIncomeBtn.addTarget(self, action: #selector(KycBasicDetailsFormVC.showAnnualIncomeLists(_:)), for: .touchUpInside)
        
        let currentDateTime=NSDate()
        let formatter=DateFormatter()
        formatter.dateFormat="E, d MMM h:mm a"
        
        let toolbar=UIToolbar()
        toolbar.backgroundColor=colors.APP_THEME_COLOR
        toolbar.barTintColor=colors.APP_THEME_COLOR
        toolbar.tintColor=UIColor.white
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "DONE", style: UIBarButtonItemStyle.done, target: self, action: #selector(KycBasicDetailsFormVC.barBtnAction(_:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "CANCEL"  , style: UIBarButtonItemStyle.done, target: self, action:  #selector(KycBasicDetailsFormVC.cancelAction(_:)))
        
        toolbar.items=[doneButton,spaceButton,cancelButton]
        
        datePickerView=UIDatePicker()
        datePickerView.datePickerMode=UIDatePickerMode.date
        datePickerView.backgroundColor=UIColor.white
        datePickerView.maximumDate=currentDateTime as Date
        datePickerView.tintColor=UIColor.black
        datePickerView.addTarget(self, action: #selector(KycBasicDetailsFormVC.datePickerAction(_:)), for: UIControlEvents.valueChanged)
        
        let dobIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        dobTxtField=UITextField()
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
        
        addressTextField=UITextField()
        addressTextField.layer.cornerRadius=6
        addressTextField.layer.masksToBounds=true
        addressTextField.layer.borderColor=UIColor.lightGray.cgColor
        addressTextField.layer.borderWidth=0.6
        addressTextField.delegate=self
        addressTextField.font=UIFont.systemFont(ofSize: 14)
        addressTextField.attributedPlaceholder = NSAttributedString(string: "Address", attributes:attributes)
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        addressTextField.leftView = indentView
        addressTextField.leftViewMode = .always
        
        let pincodeIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        pincodeTextField=UITextField()
        pincodeTextField.layer.cornerRadius=6
        pincodeTextField.layer.masksToBounds=true
        pincodeTextField.layer.borderColor=UIColor.lightGray.cgColor
        pincodeTextField.layer.borderWidth=0.6
        pincodeTextField.delegate=self
        pincodeTextField.font=UIFont.systemFont(ofSize: 14)
        pincodeTextField.leftView = pincodeIndentView
        pincodeTextField.keyboardType = .numberPad
        pincodeTextField.leftViewMode = .always
        
        let cityIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        cityTextField=UITextField()
        cityTextField.layer.cornerRadius=6
        cityTextField.layer.masksToBounds=true
        cityTextField.layer.borderColor=UIColor.lightGray.cgColor
        cityTextField.layer.borderWidth=0.6
        cityTextField.delegate=self
        cityTextField.font=UIFont.systemFont(ofSize: 14)
        cityTextField.leftView = cityIndentView
        cityTextField.leftViewMode = .always
        
        let stateIndentView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        stateTextField=UITextField()
        stateTextField.layer.cornerRadius=6
        stateTextField.layer.masksToBounds=true
        stateTextField.layer.borderColor=UIColor.lightGray.cgColor
        stateTextField.layer.borderWidth=0.6
        stateTextField.delegate=self
        stateTextField.font=UIFont.systemFont(ofSize: 14)
        stateTextField.leftView = stateIndentView
        stateTextField.leftViewMode = .always
        
        countryBtn=UIButton()
        countryBtn.titleLabel?.font=UIFont.systemFont(ofSize: 14)
        countryBtn.setTitleColor(UIColor.black, for: .normal)
        countryBtn.layer.cornerRadius=6
        countryBtn.layer.masksToBounds=true
        countryBtn.layer.borderColor=UIColor.lightGray.cgColor
        countryBtn.layer.borderWidth=0.6
        countryBtn.setImage(images.rightArrow, for: .normal)
        countryBtn.contentHorizontalAlignment = .left
        countryBtn.addTarget(self, action: #selector(KycBasicDetailsFormVC.showCountries(_:)), for: .touchUpInside)
        
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance

        if finCartUserDefaults.retrieveInvestorTypeKey() == "24"{
            countryBtn.isHidden=false
            nameTextField.isHidden=false
            aadharTxtField.isHidden=true

            pincodeTextField.attributedPlaceholder = NSAttributedString(string: "Zipcode", attributes:attributes)
            cityTextField.attributedPlaceholder = NSAttributedString(string: "NRI City", attributes:attributes)
            stateTextField.attributedPlaceholder = NSAttributedString(string: "NRI State", attributes:attributes)
            nameTextField.frame=CGRect(x:10,y:10,width:dimensions.SCREEN_WIDTH-20,height:60)
            occupationBtn.frame=CGRect(x:10,y:nameTextField.frame.origin.y+nameTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 690)
        }
        else {
            if UserDefaults.standard.value(forKey: "KycStatus") != nil {
                if FinCartUserDefaults.sharedInstance.retrieveKycStatus() == "Y"{
                    aadharTxtField.isHidden=false
                    aadharTxtField.frame=CGRect(x:10,y:10,width:dimensions.SCREEN_WIDTH-20,height:60)
                    scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 620)
                    occupationBtn.frame=CGRect(x:10,y:aadharTxtField.frame.origin.y+aadharTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
                }
                else {
                    occupationBtn.frame=CGRect(x:10,y:10,width:dimensions.SCREEN_WIDTH-20,height:60)
                    scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: 540)
                    aadharTxtField.isHidden=true
                    }
                }
            countryBtn.isHidden=true
            nameTextField.isHidden=true
            pincodeTextField.attributedPlaceholder = NSAttributedString(string: "Pincode", attributes:attributes)
            cityTextField.attributedPlaceholder = NSAttributedString(string: "City", attributes:attributes)
            stateTextField.attributedPlaceholder = NSAttributedString(string: "State", attributes:attributes)
        }
        annualIncomeBtn.frame=CGRect(x:10,y:occupationBtn.frame.origin.y+occupationBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        dobTxtField.frame=CGRect(x:10,y:annualIncomeBtn.frame.origin.y+annualIncomeBtn.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        addressTextField.frame=CGRect(x:10,y:dobTxtField.frame.origin.y+dobTxtField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        pincodeTextField.frame=CGRect(x:10,y:addressTextField.frame.origin.y+addressTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        cityTextField.frame=CGRect(x:10,y:pincodeTextField.frame.origin.y+pincodeTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        stateTextField.frame=CGRect(x:10,y:cityTextField.frame.origin.y+cityTextField.frame.size.height+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        countryBtn.frame=CGRect(x:10,y:stateTextField.frame.size.height+stateTextField.frame.origin.y+15,width:dimensions.SCREEN_WIDTH-20,height:60)
        occupationBtn.imageEdgeInsets = UIEdgeInsetsMake(20, occupationBtn.frame.size.width - 24, 20, 0);
        annualIncomeBtn.imageEdgeInsets = UIEdgeInsetsMake(20, annualIncomeBtn.frame.size.width - 24, 20, 0);
        countryBtn.imageEdgeInsets = UIEdgeInsetsMake(20, occupationBtn.frame.size.width - 24, 20, 0);
        scrollView.frame=CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT-134)
        
        continueBtn = PressableButton(frame: CGRect(x:10,y:dimensions.SCREEN_HEIGHT-124,width:dimensions.SCREEN_WIDTH-20,height:50))
        continueBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        continueBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 16)
        continueBtn.setTitle("CONTINUE", for: .normal)
        continueBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        continueBtn.shadowHeight = 3
        continueBtn.addTarget(self, action: #selector(KycBasicDetailsFormVC.onContinue(_:)), for: .touchUpInside)
        continueBtn.cornerRadius = 5
        
        view.addSubview(scrollView)
        scrollView.addSubview(occupationBtn)
        scrollView.addSubview(annualIncomeBtn)
        scrollView.addSubview(dobTxtField)
        scrollView.addSubview(addressTextField)
        scrollView.addSubview(pincodeTextField)
        scrollView.addSubview(cityTextField)
        scrollView.addSubview(stateTextField)
        scrollView.addSubview(countryBtn)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(aadharTxtField)

        view.addSubview(continueBtn)
        
    }
    @objc func showCountries(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "CountryLists") as! CountryLists
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func onContinue(_ sender:UIButton){
        if nameTextField.isHidden == false && nameTextField.text?.isEmpty == true{
            self.utils.popUp(title: "", message: "Name can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else {
            FinCartUserDefaults.sharedInstance.saveNriName(nameTextField.text!)
        }
        if aadharTxtField.isHidden == false && aadharTxtField.text?.isEmpty == true{
            self.utils.popUp(title: "", message: "Aadhar card can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else if aadharTxtField.isHidden == false && aadharTxtField.text?.isEmpty == false{
            FinCartUserDefaults.sharedInstance.saveAadhar(aadharTxtField.text!)
        }
        if occupationBtn.currentTitle == "Occupation"{
            self.utils.popUp(title: "", message: "Select Occupation")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if annualIncomeBtn.currentTitle == "Annual Income"{
            self.utils.popUp(title: "", message: "Select Annual Income")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        if (dobTxtField.text?.isEmpty == true && dobTxtField.isHidden == false){
            self.utils.popUp(title: "", message: "Select Date of Birth")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else  if (dobTxtField.text?.isEmpty == false && dobTxtField.isHidden == false){
            FinCartUserDefaults.sharedInstance.saveDob(dobTxtField.text!)
        }
        if (addressTextField.text?.isEmpty == true && addressTextField.isHidden == false){
            self.utils.popUp(title: "", message: "Permanent Address can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else if(addressTextField.text?.isEmpty == false && addressTextField.isHidden == false){
            FinCartUserDefaults.sharedInstance.saveAddress(addressTextField.text!)
        }
        if (pincodeTextField.text?.isEmpty == true && pincodeTextField.isHidden == false){
            self.utils.popUp(title: "", message: "Pincode can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else if (pincodeTextField.text?.isEmpty == false && pincodeTextField.isHidden == false){
            FinCartUserDefaults.sharedInstance.savePincode(pincodeTextField.text!)
        }
        if (cityTextField.text?.isEmpty == true && cityTextField.isHidden == false){
            self.utils.popUp(title: "", message: "City can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else if (cityTextField.text?.isEmpty == false && cityTextField.isHidden == false){
            FinCartUserDefaults.sharedInstance.saveCity(cityTextField.text!)
        }
        if (stateTextField.text?.isEmpty == true && stateTextField.isHidden == false){
            self.utils.popUp(title: "", message: "State can not be empty")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else if (stateTextField.text?.isEmpty == false && stateTextField.isHidden == false){
            FinCartUserDefaults.sharedInstance.saveState(stateTextField.text!)
        }
        if countryBtn.isHidden == false && countryBtn.currentTitle == "Country" {
            self.utils.popUp(title: "", message: "Select Country")
            self.present(self.utils.popup, animated: true, completion: nil)
            return
        }
        else if countryBtn.isHidden == false && countryBtn.currentTitle != "Country"{
            FinCartUserDefaults.sharedInstance.saveNriCountry(countryBtn.currentTitle)
        }
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        
        if occupationBtn.currentTitle == "BUSINESS"{
            finCartUserDefaults.saveOccupationKey("01")
        }
        else  if occupationBtn.currentTitle == "SERVICE"{
            finCartUserDefaults.saveOccupationKey("02")
        }
        else  if occupationBtn.currentTitle == "PROFESSIONAL"{
            finCartUserDefaults.saveOccupationKey("03")
        }
        else  if occupationBtn.currentTitle == "AGRICULTURE"{
            finCartUserDefaults.saveOccupationKey("04")
        }
        else  if occupationBtn.currentTitle == "RETIRED"{
            finCartUserDefaults.saveOccupationKey("05")
        }
        else  if occupationBtn.currentTitle == "HOUSE WIFE"{
            finCartUserDefaults.saveOccupationKey("06")
        }
        else  if occupationBtn.currentTitle == "STUDENT"{
            finCartUserDefaults.saveOccupationKey("07")
        }
        else  if occupationBtn.currentTitle == "OTHERS"{
            finCartUserDefaults.saveOccupationKey("08")
        }
        else {
            finCartUserDefaults.saveOccupationKey("99")
        }
        
        if annualIncomeBtn.currentTitle == "0-100000"{
            finCartUserDefaults.saveAnnualIncomeKey("31")
        }
        else  if occupationBtn.currentTitle == "100000-500000"{
            finCartUserDefaults.saveAnnualIncomeKey("32")
        }
        else  if occupationBtn.currentTitle == "500000-1000000"{
            finCartUserDefaults.saveAnnualIncomeKey("33")
        }
        else  if occupationBtn.currentTitle == "1000000-2500000"{
            finCartUserDefaults.saveAnnualIncomeKey("34")
        }
        else  if occupationBtn.currentTitle == "2500000-10000000"{
            finCartUserDefaults.saveAnnualIncomeKey("35")
        }
        else {
            finCartUserDefaults.saveAnnualIncomeKey("36")
        }
        let dobUserDefaults=UserDefaults.standard
        dobUserDefaults.set((dobTxtField.text!), forKey: "dob")
        dobUserDefaults.synchronize()
        
        let stateUserDefaults=UserDefaults.standard
        stateUserDefaults.set((stateTextField.text!), forKey: "state")
        stateUserDefaults.synchronize()
        
        let pcUserDefaults=UserDefaults.standard
        pcUserDefaults.set((pincodeTextField.text!), forKey: "pc")
        pcUserDefaults.synchronize()
        
        let houseUserDefaults=UserDefaults.standard
        houseUserDefaults.set((addressTextField.text!), forKey: "address")
        houseUserDefaults.synchronize()
        
        let streetUserDefaults=UserDefaults.standard
        streetUserDefaults.set((cityTextField.text!), forKey: "city")
        streetUserDefaults.synchronize()
      
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "BankAccountDetailsVC") as! BankAccountDetailsVC
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @objc func barBtnAction(_ sender:UIButton){
        
        addressTextField.resignFirstResponder()
        pincodeTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        dobTxtField.resignFirstResponder()
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
    
    @objc func cancelAction(_ sender:UIButton){
        addressTextField.resignFirstResponder()
        pincodeTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        dobTxtField.resignFirstResponder()
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
        
        self.yearDiff=currYear-selectedYear
        
        dobTxtField.text=dateFormat.string(from: sender.date)
    }
    
    @objc func showOccupationsList(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "OccupationsList") as! OccupationsList
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func showAnnualIncomeLists(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "AnnualIncomeLists") as! AnnualIncomeLists
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addressTextField.resignFirstResponder()
        pincodeTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        dobTxtField.resignFirstResponder()
        
        return true
    }
}
