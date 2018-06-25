//
//  EditProfileVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 2/26/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    var nameContainer=UIView()
    var profileImg=UIImageView()
    var nameLbl=UILabel()
    var addressContainer=UIView()
    var bankContainer=UIView()
    var nomineeContainer=UIView()
    var fatcaContainer=UIView()
    var panContainer=UIView()
    var aadharContainer=UIView()
    var emailContainer=UIView()
    var mobileContainer=UIView()
    var occupationContainer=UIView()
    var annualIncomeContainer=UIView()
    var dobContainer=UIView()
    var scrollView=UIScrollView()
    var addBtn=UIButton()
    var basicDetailsContainer=UIView()
    var addressSubContainer=UIView()
    var pincodeContainer=UIView()
    var cityContainer=UIView()
    var stateContainer=UIView()
    var countryContainer=UIView()
    var addBtn2=UIButton()
    var ifscContainer=UIView()
    var accTypeContainer=UIView()
    var branchAddrContainer=UIView()
    var bankNameContainer=UIView()
    var branchNameContainer=UIView()
    var branchCityContainer=UIView()
    var micrContainer=UIView()
    var accNoContainer=UIView()
    var nameInBankContainer=UIView()
    var addBtn3=UIButton()
    var firstNomineeContainer=UIView()
    var firstNomineeNameContainer=UIView()
    var firstNomineeShareContainer=UIView()
    var firstNomineeRelationContainer=UIView()
    var firstNomineeDobContainer=UIView()
    var secondNomineeContainer=UIView()
    var secondNomineeNameContainer=UIView()
    var secondNomineeShareContainer=UIView()
    var secondNomineeRelationContainer=UIView()
    var secondNomineeDobContainer=UIView()
    var thirdNomineeContainer=UIView()
    var thirdNomineeNameContainer=UIView()
    var thirdNomineeShareContainer=UIView()
    var thirdNomineeRelationContainer=UIView()
    var thirdNomineeDobContainer=UIView()
    var addBtn4=UIButton()
    var placeOfBirthContainer=UIView()
    var birthCountryContainer=UIView()
    var incomeSourceContainer=UIView()
    var politicallyExposedContainer=UIView()
    var taxSwitchContainer=UIView()
    var taxSwitch=UISwitch()
    var addBtn5=UIButton()
    var firstTaxResidencyContainer=UIView()
    var firstTaxCountryContainer=UIView()
    var firstIdContainer=UIView()
    var firstIdTypeContainer=UIView()
    var secondTaxResidencyContainer=UIView()
    var secondTaxCountryContainer=UIView()
    var secondIdContainer=UIView()
    var secondIdTypeContainer=UIView()
    var thirdTaxResidencyContainer=UIView()
    var thirdTaxCountryContainer=UIView()
    var thirdIdContainer=UIView()
    var thirdIdTypeContainer=UIView()
    
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
        self.navigationItem.title="EDIT PROFILE"
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
        view.backgroundColor=UIColor.init(red: 242/255, green: 247/255, blue: 250/255, alpha: 1)
        
        scrollView=UIScrollView(frame:CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT-dimensions.SCREEN_HEIGHT/12.5-64))
        scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT + dimensions.SCREEN_HEIGHT/25)
        
        let topContainer=UIView(frame:CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT/2.94))
        topContainer.backgroundColor=colors.APP_THEME_COLOR
        
        let profile=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/10,y:dimensions.SCREEN_HEIGHT/25,width:dimensions.SCREEN_HEIGHT/5,height:dimensions.SCREEN_HEIGHT/5))
        profile.image=images.addProfile
        profile.layer.cornerRadius=profile.frame.size.width/2
        
        let profileStatusContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:topContainer.frame.size.height-dimensions.SCREEN_HEIGHT/14.28,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/7.14))
        profileStatusContainer.backgroundColor=UIColor.white
        profileStatusContainer.layer.shadowColor=UIColor.gray.cgColor
        profileStatusContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        profileStatusContainer.backgroundColor=UIColor.white
        profileStatusContainer.layer.shadowOpacity=0.5
        profileStatusContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        profileStatusContainer.layer.masksToBounds=false
        profileStatusContainer.layer.cornerRadius=4
        
        let kycIcn=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/8-dimensions.SCREEN_HEIGHT/83.3,y:dimensions.SCREEN_HEIGHT/32.3,width:dimensions.SCREEN_HEIGHT/41.6,height:dimensions.SCREEN_HEIGHT/41.6))
        kycIcn.image=images.form
        
        let kycLbl=UILabel(frame:CGRect(x:kycIcn.frame.origin.x+kycIcn.frame.size.width+dimensions.SCREEN_HEIGHT/100,y:dimensions.SCREEN_HEIGHT/32.3,width:50,height:dimensions.SCREEN_HEIGHT/41.6))
        kycLbl.text="Kyc"
        kycLbl.font=UIFont.systemFont(ofSize: 12)
        kycLbl.textColor=UIColor.black
        
        let kycStatus=UILabel(frame:CGRect(x:dimensions.SCREEN_HEIGHT/100,y:kycLbl.frame.origin.y+kycLbl.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH/3-dimensions.SCREEN_HEIGHT/33.3,height:dimensions.SCREEN_HEIGHT/25))
        kycStatus.numberOfLines=0
        kycStatus.text="PAN Required"
        kycStatus.font=UIFont.systemFont(ofSize: 12)
        kycStatus.textColor=UIColor.red
        kycStatus.textAlignment = .center
        
        let line1=UIView(frame:CGRect(x:dimensions.SCREEN_WIDTH/3-dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:0.5,height:profileStatusContainer.frame.size.height-dimensions.SCREEN_HEIGHT/50))
        line1.backgroundColor=UIColor.lightGray
        
        let bankIcn=UIImageView(frame:CGRect(x:line1.frame.origin.x+dimensions.SCREEN_HEIGHT/100,y:dimensions.SCREEN_HEIGHT/32.3,width:dimensions.SCREEN_HEIGHT/41.6,height:dimensions.SCREEN_HEIGHT/41.6))
        bankIcn.image=images.card
        
        let bankLbl=UILabel(frame:CGRect(x:bankIcn.frame.origin.x+bankIcn.frame.size.width+dimensions.SCREEN_HEIGHT/100,y:dimensions.SCREEN_HEIGHT/32.3,width:90,height:dimensions.SCREEN_HEIGHT/41.6))
        bankLbl.text="Bank Mandate"
        bankLbl.font=UIFont.systemFont(ofSize: 12)
        bankLbl.textColor=UIColor.black
        
        let bankStatus=UILabel(frame:CGRect(x:bankLbl.frame.origin.x+dimensions.SCREEN_HEIGHT/100,y:kycLbl.frame.origin.y+kycLbl.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH/3+10,height:dimensions.SCREEN_HEIGHT/25))
        bankStatus.numberOfLines=0
        bankStatus.text="In-Process"
        bankStatus.font=UIFont.systemFont(ofSize: 12)
        bankStatus.textColor=UIColor.init(red: 253/255, green: 190/255, blue: 53/255, alpha: 1.0)
        bankStatus.textAlignment = .left
        
        let line2=UIView(frame:CGRect(x:2*dimensions.SCREEN_WIDTH/3,y:dimensions.SCREEN_HEIGHT/50,width:0.5,height:profileStatusContainer.frame.size.height-dimensions.SCREEN_HEIGHT/50))
        line2.backgroundColor=UIColor.lightGray
        
        let profileIcn=UIImageView(frame:CGRect(x:line2.frame.origin.x+dimensions.SCREEN_HEIGHT/100,y:dimensions.SCREEN_HEIGHT/32.3,width:dimensions.SCREEN_HEIGHT/41.6,height:dimensions.SCREEN_HEIGHT/41.6))
        profileIcn.image=images.profile
        
        let profileLbl=UILabel(frame:CGRect(x:profileIcn.frame.origin.x+profileIcn.frame.size.width+dimensions.SCREEN_HEIGHT/100,y:dimensions.SCREEN_HEIGHT/32.3,width:50,height:dimensions.SCREEN_HEIGHT/41.6))
        profileLbl.text="Profile"
        profileLbl.font=UIFont.systemFont(ofSize: 12)
        profileLbl.textColor=UIColor.black
        
        let profileStatus=UILabel(frame:CGRect(x:line2.frame.origin.x+dimensions.SCREEN_HEIGHT/100,y:profileLbl.frame.origin.y+profileLbl.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH/3-dimensions.SCREEN_HEIGHT/16.6,height:dimensions.SCREEN_HEIGHT/25))
        profileStatus.numberOfLines=0
        profileStatus.text="25%"
        profileStatus.font=UIFont.systemFont(ofSize: 12)
        profileStatus.textColor=UIColor.init(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
        profileStatus.textAlignment = .center
        
        basicDetailsContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:profileStatusContainer.frame.origin.y+profileStatusContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        basicDetailsContainer.backgroundColor=UIColor.white
        basicDetailsContainer.layer.shadowColor=UIColor.gray.cgColor
        basicDetailsContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        basicDetailsContainer.backgroundColor=UIColor.white
        basicDetailsContainer.layer.shadowOpacity=0.5
        basicDetailsContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        basicDetailsContainer.layer.masksToBounds=false
        basicDetailsContainer.layer.cornerRadius=4
        
        addBtn=UIButton(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        addBtn.setBackgroundImage(images.add, for: .normal)
        addBtn.addTarget(self, action: #selector(EditProfileVC.addBtn1Action(_:)), for: .touchUpInside)
        
        let basicDetailsLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        basicDetailsLbl.text="Basic Details"
        basicDetailsLbl.textColor=UIColor.black
        basicDetailsLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        nameContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:basicDetailsContainer.frame.origin.y+basicDetailsContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        nameContainer.backgroundColor=UIColor.white
        nameContainer.layer.shadowColor=UIColor.gray.cgColor
        nameContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        nameContainer.backgroundColor=UIColor.white
        nameContainer.layer.shadowOpacity=0.5
        nameContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        nameContainer.layer.masksToBounds=false
        nameContainer.layer.cornerRadius=4
        
        profileImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        profileImg.image=images.profile
        
       nameLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        nameLbl.text="NAME"
        nameLbl.textColor=UIColor.black
        nameLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        nameContainer.isHidden=true
        
        panContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameContainer.frame.origin.y+nameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        panContainer.backgroundColor=UIColor.white
        panContainer.layer.shadowColor=UIColor.gray.cgColor
        panContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        panContainer.backgroundColor=UIColor.white
        panContainer.layer.shadowOpacity=0.5
        panContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        panContainer.layer.masksToBounds=false
        panContainer.layer.cornerRadius=4
        
        panContainer.isHidden=true
        
        let panImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        panImg.image=images.pancard
        
        let panLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        panLbl.text="PAN"
        panLbl.textColor=UIColor.black
        panLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        aadharContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:panContainer.frame.origin.y+panContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        aadharContainer.backgroundColor=UIColor.white
        aadharContainer.layer.shadowColor=UIColor.gray.cgColor
        aadharContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        aadharContainer.backgroundColor=UIColor.white
        aadharContainer.layer.shadowOpacity=0.5
        aadharContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        aadharContainer.layer.masksToBounds=false
        aadharContainer.layer.cornerRadius=4
        
        aadharContainer.isHidden=true
        
        let aadharImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        aadharImg.image=images.aadhar
        
        let aadharLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        aadharLbl.text="AADHAR"
        aadharLbl.textColor=UIColor.black
        aadharLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        emailContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:aadharContainer.frame.origin.y+aadharContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        emailContainer.backgroundColor=UIColor.white
        emailContainer.layer.shadowColor=UIColor.gray.cgColor
        emailContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        emailContainer.backgroundColor=UIColor.white
        emailContainer.layer.shadowOpacity=0.5
        emailContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        emailContainer.layer.masksToBounds=false
        emailContainer.layer.cornerRadius=4
        
        emailContainer.isHidden=true
        
        let emailImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        emailImg.image=images.email
        
        let emailLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        emailLbl.text="EMAIL"
        emailLbl.textColor=UIColor.black
        emailLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        mobileContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:emailContainer.frame.origin.y+emailContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        mobileContainer.backgroundColor=UIColor.white
        mobileContainer.layer.shadowColor=UIColor.gray.cgColor
        mobileContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        mobileContainer.backgroundColor=UIColor.white
        mobileContainer.layer.shadowOpacity=0.5
        mobileContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        mobileContainer.layer.masksToBounds=false
        mobileContainer.layer.cornerRadius=4
        
        mobileContainer.isHidden=true
        
        let mobImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        mobImg.image=images.mobile
        
        let mobileLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        mobileLbl.text="MOBILE"
        mobileLbl.textColor=UIColor.black
        mobileLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        occupationContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:mobileContainer.frame.origin.y+mobileContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        occupationContainer.backgroundColor=UIColor.white
        occupationContainer.layer.shadowColor=UIColor.gray.cgColor
        occupationContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        occupationContainer.backgroundColor=UIColor.white
        occupationContainer.layer.shadowOpacity=0.5
        occupationContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        occupationContainer.layer.masksToBounds=false
        occupationContainer.layer.cornerRadius=4
        
        occupationContainer.isHidden=true
        
        let occupationImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        occupationImg.image=images.pancard
        
        let occupationLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        occupationLbl.text="OCCUPATION"
        occupationLbl.textColor=UIColor.black
        occupationLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        annualIncomeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:occupationContainer.frame.origin.y+occupationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        annualIncomeContainer.backgroundColor=UIColor.white
        annualIncomeContainer.layer.shadowColor=UIColor.gray.cgColor
        annualIncomeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        annualIncomeContainer.backgroundColor=UIColor.white
        annualIncomeContainer.layer.shadowOpacity=0.5
        annualIncomeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        annualIncomeContainer.layer.masksToBounds=false
        annualIncomeContainer.layer.cornerRadius=4
        
        annualIncomeContainer.isHidden=true
        
        let incomeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        incomeImg.image=images.income
        
        let incomeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        incomeLbl.text="ANNUAL INCOME"
        incomeLbl.textColor=UIColor.black
        incomeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        dobContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:annualIncomeContainer.frame.origin.y+annualIncomeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        dobContainer.backgroundColor=UIColor.white
        dobContainer.layer.shadowColor=UIColor.gray.cgColor
        dobContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        dobContainer.backgroundColor=UIColor.white
        dobContainer.layer.shadowOpacity=0.5
        dobContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        dobContainer.layer.masksToBounds=false
        dobContainer.layer.cornerRadius=4
        
        dobContainer.isHidden=true
        
        let dobImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        dobImg.image=images.dateOfBirth
        
        let dobLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        dobLbl.text="DATE OF BIRTH"
        dobLbl.textColor=UIColor.black
        dobLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        addressContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:basicDetailsContainer.frame.origin.y+basicDetailsContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        addressContainer.backgroundColor=UIColor.white
        addressContainer.layer.shadowColor=UIColor.gray.cgColor
        addressContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        addressContainer.backgroundColor=UIColor.white
        addressContainer.layer.shadowOpacity=0.5
        addressContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        addressContainer.layer.masksToBounds=false
        addressContainer.layer.cornerRadius=4
        
        addBtn2=UIButton(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        addBtn2.setBackgroundImage(images.add, for: .normal)
        addBtn2.addTarget(self, action: #selector(EditProfileVC.addBtn2Action(_:)), for: .touchUpInside)
        
        let addressLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        addressLbl.text="Address"
        addressLbl.textColor=UIColor.black
        addressLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        addressSubContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        addressSubContainer.backgroundColor=UIColor.white
        addressSubContainer.layer.shadowColor=UIColor.gray.cgColor
        addressSubContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        addressSubContainer.backgroundColor=UIColor.white
        addressSubContainer.layer.shadowOpacity=0.5
        addressSubContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        addressSubContainer.layer.masksToBounds=false
        addressSubContainer.layer.cornerRadius=4
        
        addressSubContainer.isHidden=true
        
        let addressImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        addressImg.image=images.address
        
        let addressSubLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        addressSubLbl.text="ADDRESS"
        addressSubLbl.textColor=UIColor.black
        addressSubLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        pincodeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        pincodeContainer.backgroundColor=UIColor.white
        pincodeContainer.layer.shadowColor=UIColor.gray.cgColor
        pincodeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        pincodeContainer.backgroundColor=UIColor.white
        pincodeContainer.layer.shadowOpacity=0.5
        pincodeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        pincodeContainer.layer.masksToBounds=false
        pincodeContainer.layer.cornerRadius=4
        
        pincodeContainer.isHidden=true
        
        let pincodeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        pincodeImg.image=images.address
        
        let pincodeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        pincodeLbl.text="PINCODE"
        pincodeLbl.textColor=UIColor.black
        pincodeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        cityContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        cityContainer.backgroundColor=UIColor.white
        cityContainer.layer.shadowColor=UIColor.gray.cgColor
        cityContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        cityContainer.backgroundColor=UIColor.white
        cityContainer.layer.shadowOpacity=0.5
        cityContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        cityContainer.layer.masksToBounds=false
        cityContainer.layer.cornerRadius=4
        
        cityContainer.isHidden=true
        
        let cityImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        cityImg.image=images.globe
        
        let cityLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        cityLbl.text="CITY"
        cityLbl.textColor=UIColor.black
        cityLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        stateContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        stateContainer.backgroundColor=UIColor.white
        stateContainer.layer.shadowColor=UIColor.gray.cgColor
        stateContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        stateContainer.backgroundColor=UIColor.white
        stateContainer.layer.shadowOpacity=0.5
        stateContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        stateContainer.layer.masksToBounds=false
        stateContainer.layer.cornerRadius=4
        
        stateContainer.isHidden=true
        
        let stateImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        stateImg.image=images.globe
        
        let stateLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        stateLbl.text="STATE"
        stateLbl.textColor=UIColor.black
        stateLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        countryContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        countryContainer.backgroundColor=UIColor.white
        countryContainer.layer.shadowColor=UIColor.gray.cgColor
        countryContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        countryContainer.backgroundColor=UIColor.white
        countryContainer.layer.shadowOpacity=0.5
        countryContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        countryContainer.layer.masksToBounds=false
        countryContainer.layer.cornerRadius=4
        
        countryContainer.isHidden=true
        
        let countryImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        countryImg.image=images.globe
        
        let countryLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        countryLbl.text="COUNTRY"
        countryLbl.textColor=UIColor.black
        countryLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        bankContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        bankContainer.backgroundColor=UIColor.white
        bankContainer.layer.shadowColor=UIColor.gray.cgColor
        bankContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        bankContainer.backgroundColor=UIColor.white
        bankContainer.layer.shadowOpacity=0.5
        bankContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        bankContainer.layer.masksToBounds=false
        bankContainer.layer.cornerRadius=4
        
        addBtn3=UIButton(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        addBtn3.setBackgroundImage(images.add, for: .normal)
        addBtn3.addTarget(self, action: #selector(EditProfileVC.addBtn3Action(_:)), for: .touchUpInside)
        
        let BankLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        BankLbl.text="Bank"
        BankLbl.textColor=UIColor.black
        BankLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        ifscContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        ifscContainer.backgroundColor=UIColor.white
        ifscContainer.layer.shadowColor=UIColor.gray.cgColor
        ifscContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        ifscContainer.backgroundColor=UIColor.white
        ifscContainer.layer.shadowOpacity=0.5
        ifscContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        ifscContainer.layer.masksToBounds=false
        ifscContainer.layer.cornerRadius=4
        
        ifscContainer.isHidden=true
        
        let ifscImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        ifscImg.image=images.qrCode
        
        let ifscLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        ifscLbl.text="IFSC CODE"
        ifscLbl.textColor=UIColor.black
        ifscLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        accTypeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        accTypeContainer.backgroundColor=UIColor.white
        accTypeContainer.layer.shadowColor=UIColor.gray.cgColor
        accTypeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        accTypeContainer.backgroundColor=UIColor.white
        accTypeContainer.layer.shadowOpacity=0.5
        accTypeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        accTypeContainer.layer.masksToBounds=false
        accTypeContainer.layer.cornerRadius=4
        
        accTypeContainer.isHidden=true
        
        let accTypeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        accTypeImg.image=images.form
        
        let accTypeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        accTypeLbl.text="ACCOUNT TYPE"
        accTypeLbl.textColor=UIColor.black
        accTypeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        branchAddrContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        branchAddrContainer.backgroundColor=UIColor.white
        branchAddrContainer.layer.shadowColor=UIColor.gray.cgColor
        branchAddrContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        branchAddrContainer.backgroundColor=UIColor.white
        branchAddrContainer.layer.shadowOpacity=0.5
        branchAddrContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        branchAddrContainer.layer.masksToBounds=false
        branchAddrContainer.layer.cornerRadius=4
        
        branchAddrContainer.isHidden=true
        
        let branchAddrImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        branchAddrImg.image=images.file
        
        let branchAddrLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        branchAddrLbl.text="BRANCH ADDRESS"
        branchAddrLbl.textColor=UIColor.black
        branchAddrLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        bankNameContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        bankNameContainer.backgroundColor=UIColor.white
        bankNameContainer.layer.shadowColor=UIColor.gray.cgColor
        bankNameContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        bankNameContainer.backgroundColor=UIColor.white
        bankNameContainer.layer.shadowOpacity=0.5
        bankNameContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        bankNameContainer.layer.masksToBounds=false
        bankNameContainer.layer.cornerRadius=4
        
        bankNameContainer.isHidden=true
        
        let bankNameImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        bankNameImg.image=images.file
        
        let bankNameLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        bankNameLbl.text="BANK NAME"
        bankNameLbl.textColor=UIColor.black
        bankNameLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        branchNameContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        branchNameContainer.backgroundColor=UIColor.white
        branchNameContainer.layer.shadowColor=UIColor.gray.cgColor
        branchNameContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        branchNameContainer.backgroundColor=UIColor.white
        branchNameContainer.layer.shadowOpacity=0.5
        branchNameContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        branchNameContainer.layer.masksToBounds=false
        branchNameContainer.layer.cornerRadius=4
        
        branchNameContainer.isHidden=true
        
        let branchNameImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        branchNameImg.image=images.file
        
        let branchNameLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        branchNameLbl.text="BRANCH NAME"
        branchNameLbl.textColor=UIColor.black
        branchNameLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        branchCityContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        branchCityContainer.backgroundColor=UIColor.white
        branchCityContainer.layer.shadowColor=UIColor.gray.cgColor
        branchCityContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        branchCityContainer.backgroundColor=UIColor.white
        branchCityContainer.layer.shadowOpacity=0.5
        branchCityContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        branchCityContainer.layer.masksToBounds=false
        branchCityContainer.layer.cornerRadius=4
        
        branchCityContainer.isHidden=true
        
        let branchCityImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        branchCityImg.image=images.globe
        
        let branchCityLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        branchCityLbl.text="BRANCH CITY"
        branchCityLbl.textColor=UIColor.black
        branchCityLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        micrContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        micrContainer.backgroundColor=UIColor.white
        micrContainer.layer.shadowColor=UIColor.gray.cgColor
        micrContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        micrContainer.backgroundColor=UIColor.white
        micrContainer.layer.shadowOpacity=0.5
        micrContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        micrContainer.layer.masksToBounds=false
        micrContainer.layer.cornerRadius=4
        
        micrContainer.isHidden=true
        
        let micrImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        micrImg.image=images.globe
        
        let micrLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        micrLbl.text="MICR"
        micrLbl.textColor=UIColor.black
        micrLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        accNoContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        accNoContainer.backgroundColor=UIColor.white
        accNoContainer.layer.shadowColor=UIColor.gray.cgColor
        accNoContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        accNoContainer.backgroundColor=UIColor.white
        accNoContainer.layer.shadowOpacity=0.5
        accNoContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        accNoContainer.layer.masksToBounds=false
        accNoContainer.layer.cornerRadius=4
        
        accNoContainer.isHidden=true
        
        let accNoImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        accNoImg.image=images.mobile
        
        let accNoLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        accNoLbl.text="ACCOUNT NUMBER"
        accNoLbl.textColor=UIColor.black
        accNoLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        nameInBankContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        nameInBankContainer.backgroundColor=UIColor.white
        nameInBankContainer.layer.shadowColor=UIColor.gray.cgColor
        nameInBankContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        nameInBankContainer.backgroundColor=UIColor.white
        nameInBankContainer.layer.shadowOpacity=0.5
        nameInBankContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        nameInBankContainer.layer.masksToBounds=false
        nameInBankContainer.layer.cornerRadius=4
        
        nameInBankContainer.isHidden=true
        
        let nameInBankImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        nameInBankImg.image=images.profile
        
        let nameInBankLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        nameInBankLbl.text="NAME AS PER BANK"
        nameInBankLbl.textColor=UIColor.black
        nameInBankLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        nomineeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        nomineeContainer.backgroundColor=UIColor.white
        nomineeContainer.layer.shadowColor=UIColor.gray.cgColor
        nomineeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        nomineeContainer.backgroundColor=UIColor.white
        nomineeContainer.layer.shadowOpacity=0.5
        nomineeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        nomineeContainer.layer.masksToBounds=false
        nomineeContainer.layer.cornerRadius=4
        
        let nomineeLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        nomineeLbl.text="Nominee"
        nomineeLbl.textColor=UIColor.black
        nomineeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstNomineeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstNomineeContainer.backgroundColor=UIColor.lightGray
        firstNomineeContainer.layer.shadowColor=UIColor.gray.cgColor
        firstNomineeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstNomineeContainer.layer.shadowOpacity=0.5
        firstNomineeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstNomineeContainer.layer.masksToBounds=false
        firstNomineeContainer.layer.cornerRadius=4
        
        firstNomineeContainer.isHidden=true
        
        let firstNomineeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeLbl.text="FIRST NOMINEE"
        firstNomineeLbl.textColor=UIColor.black
        firstNomineeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstNomineeNameContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstNomineeNameContainer.backgroundColor=UIColor.white
        firstNomineeNameContainer.layer.shadowColor=UIColor.gray.cgColor
        firstNomineeNameContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstNomineeNameContainer.backgroundColor=UIColor.white
        firstNomineeNameContainer.layer.shadowOpacity=0.5
        firstNomineeNameContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstNomineeNameContainer.layer.masksToBounds=false
        firstNomineeNameContainer.layer.cornerRadius=4
        
        firstNomineeNameContainer.isHidden=true

        let firstNomineeNameImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeNameImg.image=images.profile

        let firstNomineeNameLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeNameLbl.text="NAME"
        firstNomineeNameLbl.textColor=UIColor.black
        firstNomineeNameLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstNomineeShareContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstNomineeShareContainer.backgroundColor=UIColor.white
        firstNomineeShareContainer.layer.shadowColor=UIColor.gray.cgColor
        firstNomineeShareContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstNomineeShareContainer.backgroundColor=UIColor.white
        firstNomineeShareContainer.layer.shadowOpacity=0.5
        firstNomineeShareContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstNomineeShareContainer.layer.masksToBounds=false
        firstNomineeShareContainer.layer.cornerRadius=4
        
        firstNomineeShareContainer.isHidden=true
        
        let firstNomineeShareImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeShareImg.image=images.share
        
        let firstNomineeShareLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeShareLbl.text="SHARE %"
        firstNomineeShareLbl.textColor=UIColor.black
        firstNomineeShareLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstNomineeRelationContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstNomineeRelationContainer.backgroundColor=UIColor.white
        firstNomineeRelationContainer.layer.shadowColor=UIColor.gray.cgColor
        firstNomineeRelationContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstNomineeRelationContainer.backgroundColor=UIColor.white
        firstNomineeRelationContainer.layer.shadowOpacity=0.5
        firstNomineeRelationContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstNomineeRelationContainer.layer.masksToBounds=false
        firstNomineeRelationContainer.layer.cornerRadius=4
        
        firstNomineeRelationContainer.isHidden=true
        
        let firstNomineeRelationImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeRelationImg.image=images.relation
        
        let firstNomineeRelationLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeRelationLbl.text="RELATION"
        firstNomineeRelationLbl.textColor=UIColor.black
        firstNomineeRelationLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstNomineeDobContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstNomineeDobContainer.backgroundColor=UIColor.white
        firstNomineeDobContainer.layer.shadowColor=UIColor.gray.cgColor
        firstNomineeDobContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstNomineeDobContainer.backgroundColor=UIColor.white
        firstNomineeDobContainer.layer.shadowOpacity=0.5
        firstNomineeDobContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstNomineeDobContainer.layer.masksToBounds=false
        firstNomineeDobContainer.layer.cornerRadius=4
        
        firstNomineeDobContainer.isHidden=true
        
        let firstNomineeDobImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeDobImg.image=images.dateOfBirth
        
        let firstNomineeDobLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstNomineeDobLbl.text="DATE OF BIRTH"
        firstNomineeDobLbl.textColor=UIColor.black
        firstNomineeDobLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondNomineeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondNomineeContainer.backgroundColor=UIColor.lightGray
        secondNomineeContainer.layer.shadowColor=UIColor.gray.cgColor
        secondNomineeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondNomineeContainer.layer.shadowOpacity=0.5
        secondNomineeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondNomineeContainer.layer.masksToBounds=false
        secondNomineeContainer.layer.cornerRadius=4
        
        secondNomineeContainer.isHidden=true
        
        let secondNomineeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeLbl.text="SECOND NOMINEE"
        secondNomineeLbl.textColor=UIColor.black
        secondNomineeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondNomineeNameContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondNomineeNameContainer.backgroundColor=UIColor.white
        secondNomineeNameContainer.layer.shadowColor=UIColor.gray.cgColor
        secondNomineeNameContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondNomineeNameContainer.backgroundColor=UIColor.white
        secondNomineeNameContainer.layer.shadowOpacity=0.5
        secondNomineeNameContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondNomineeNameContainer.layer.masksToBounds=false
        secondNomineeNameContainer.layer.cornerRadius=4
        
        secondNomineeNameContainer.isHidden=true
        
        let secondNomineeNameImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeNameImg.image=images.profile
        
        let secondNomineeNameLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeNameLbl.text="NAME"
        secondNomineeNameLbl.textColor=UIColor.black
        secondNomineeNameLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondNomineeShareContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondNomineeShareContainer.backgroundColor=UIColor.white
        secondNomineeShareContainer.layer.shadowColor=UIColor.gray.cgColor
        secondNomineeShareContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondNomineeShareContainer.backgroundColor=UIColor.white
        secondNomineeShareContainer.layer.shadowOpacity=0.5
        secondNomineeShareContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondNomineeShareContainer.layer.masksToBounds=false
        secondNomineeShareContainer.layer.cornerRadius=4
        
        secondNomineeShareContainer.isHidden=true
        
        let secondNomineeShareImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeShareImg.image=images.share
        
        let secondNomineeShareLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeShareLbl.text="SHARE %"
        secondNomineeShareLbl.textColor=UIColor.black
        secondNomineeShareLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondNomineeRelationContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondNomineeRelationContainer.backgroundColor=UIColor.white
        secondNomineeRelationContainer.layer.shadowColor=UIColor.gray.cgColor
        secondNomineeRelationContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondNomineeRelationContainer.backgroundColor=UIColor.white
        secondNomineeRelationContainer.layer.shadowOpacity=0.5
        secondNomineeRelationContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondNomineeRelationContainer.layer.masksToBounds=false
        secondNomineeRelationContainer.layer.cornerRadius=4
        
        secondNomineeRelationContainer.isHidden=true
        
        let secondNomineeRelationImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeRelationImg.image=images.relation
        
        let secondNomineeRelationLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeRelationLbl.text="RELATION"
        secondNomineeRelationLbl.textColor=UIColor.black
        secondNomineeRelationLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondNomineeDobContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondNomineeDobContainer.backgroundColor=UIColor.white
        secondNomineeDobContainer.layer.shadowColor=UIColor.gray.cgColor
        secondNomineeDobContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondNomineeDobContainer.backgroundColor=UIColor.white
        secondNomineeDobContainer.layer.shadowOpacity=0.5
        secondNomineeDobContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondNomineeDobContainer.layer.masksToBounds=false
        secondNomineeDobContainer.layer.cornerRadius=4
        
        secondNomineeDobContainer.isHidden=true
        
        let secondNomineeDobImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeDobImg.image=images.dateOfBirth
        
        let secondNomineeDobLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondNomineeDobLbl.text="DATE OF BIRTH"
        secondNomineeDobLbl.textColor=UIColor.black
        secondNomineeDobLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdNomineeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdNomineeContainer.backgroundColor=UIColor.lightGray
        thirdNomineeContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdNomineeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdNomineeContainer.layer.shadowOpacity=0.5
        thirdNomineeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdNomineeContainer.layer.masksToBounds=false
        thirdNomineeContainer.layer.cornerRadius=4
        
        thirdNomineeContainer.isHidden=true
        
        let thirdNomineeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeLbl.text="THIRD NOMINEE"
        thirdNomineeLbl.textColor=UIColor.black
        thirdNomineeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdNomineeNameContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdNomineeNameContainer.backgroundColor=UIColor.white
        thirdNomineeNameContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdNomineeNameContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdNomineeNameContainer.backgroundColor=UIColor.white
        thirdNomineeNameContainer.layer.shadowOpacity=0.5
        thirdNomineeNameContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdNomineeNameContainer.layer.masksToBounds=false
        thirdNomineeNameContainer.layer.cornerRadius=4
        
        thirdNomineeNameContainer.isHidden=true
        
        let thirdNomineeNameImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeNameImg.image=images.profile
        
        let thirdNomineeNameLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeNameLbl.text="NAME"
        thirdNomineeNameLbl.textColor=UIColor.black
        thirdNomineeNameLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdNomineeShareContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdNomineeShareContainer.backgroundColor=UIColor.white
        thirdNomineeShareContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdNomineeShareContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdNomineeShareContainer.backgroundColor=UIColor.white
        thirdNomineeShareContainer.layer.shadowOpacity=0.5
        thirdNomineeShareContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdNomineeShareContainer.layer.masksToBounds=false
        thirdNomineeShareContainer.layer.cornerRadius=4
        
        thirdNomineeShareContainer.isHidden=true
        
        let thirdNomineeShareImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeShareImg.image=images.share
        
        let thirdNomineeShareLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeShareLbl.text="SHARE %"
        thirdNomineeShareLbl.textColor=UIColor.black
        thirdNomineeShareLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdNomineeRelationContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdNomineeRelationContainer.backgroundColor=UIColor.white
        thirdNomineeRelationContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdNomineeRelationContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdNomineeRelationContainer.backgroundColor=UIColor.white
        thirdNomineeRelationContainer.layer.shadowOpacity=0.5
        thirdNomineeRelationContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdNomineeRelationContainer.layer.masksToBounds=false
        thirdNomineeRelationContainer.layer.cornerRadius=4
        
        thirdNomineeRelationContainer.isHidden=true
        
        let thirdNomineeRelationImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeRelationImg.image=images.relation
        
        let thirdNomineeRelationLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeRelationLbl.text="RELATION"
        thirdNomineeRelationLbl.textColor=UIColor.black
        thirdNomineeRelationLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdNomineeDobContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdNomineeDobContainer.backgroundColor=UIColor.white
        thirdNomineeDobContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdNomineeDobContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdNomineeDobContainer.backgroundColor=UIColor.white
        thirdNomineeDobContainer.layer.shadowOpacity=0.5
        thirdNomineeDobContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdNomineeDobContainer.layer.masksToBounds=false
        thirdNomineeDobContainer.layer.cornerRadius=4
        
        thirdNomineeDobContainer.isHidden=true
        
        let thirdNomineeDobImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeDobImg.image=images.dateOfBirth
        
        let thirdNomineeDobLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdNomineeDobLbl.text="DATE OF BIRTH"
        thirdNomineeDobLbl.textColor=UIColor.black
        thirdNomineeDobLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        addBtn4=UIButton(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        addBtn4.setBackgroundImage(images.add, for: .normal)
        addBtn4.addTarget(self, action: #selector(EditProfileVC.addBtn4Action(_:)), for: .touchUpInside)
        
        
        fatcaContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        fatcaContainer.backgroundColor=UIColor.white
        fatcaContainer.layer.shadowColor=UIColor.gray.cgColor
        fatcaContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        fatcaContainer.backgroundColor=UIColor.white
        fatcaContainer.layer.shadowOpacity=0.5
        fatcaContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        fatcaContainer.layer.masksToBounds=false
        fatcaContainer.layer.cornerRadius=4
        
        addBtn5=UIButton(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        addBtn5.setBackgroundImage(images.add, for: .normal)
        addBtn5.addTarget(self, action: #selector(EditProfileVC.addBtn5Action(_:)), for: .touchUpInside)
        
        let fatcaLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        fatcaLbl.text="Fatca"
        fatcaLbl.textColor=UIColor.black
        fatcaLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        placeOfBirthContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        placeOfBirthContainer.backgroundColor=UIColor.white
        placeOfBirthContainer.layer.shadowColor=UIColor.gray.cgColor
        placeOfBirthContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        placeOfBirthContainer.backgroundColor=UIColor.white
        placeOfBirthContainer.layer.shadowOpacity=0.5
        placeOfBirthContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        placeOfBirthContainer.layer.masksToBounds=false
        placeOfBirthContainer.layer.cornerRadius=4
        
        placeOfBirthContainer.isHidden=true
        
        let placeOfBirthImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        placeOfBirthImg.image=images.location
        
        let placeOfBirthLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        placeOfBirthLbl.text="PLACE OF BIRTH"
        placeOfBirthLbl.textColor=UIColor.black
        placeOfBirthLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        birthCountryContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        birthCountryContainer.backgroundColor=UIColor.white
        birthCountryContainer.layer.shadowColor=UIColor.gray.cgColor
        birthCountryContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        birthCountryContainer.backgroundColor=UIColor.white
        birthCountryContainer.layer.shadowOpacity=0.5
        birthCountryContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        birthCountryContainer.layer.masksToBounds=false
        birthCountryContainer.layer.cornerRadius=4
        
        birthCountryContainer.isHidden=true
        
        let birthCountryImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        birthCountryImg.image=images.globe
        
        let birthCountryLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        birthCountryLbl.text="BIRTH COUNTRY"
        birthCountryLbl.textColor=UIColor.black
        birthCountryLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        incomeSourceContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        incomeSourceContainer.backgroundColor=UIColor.white
        incomeSourceContainer.layer.shadowColor=UIColor.gray.cgColor
        incomeSourceContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        incomeSourceContainer.backgroundColor=UIColor.white
        incomeSourceContainer.layer.shadowOpacity=0.5
        incomeSourceContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        incomeSourceContainer.layer.masksToBounds=false
        incomeSourceContainer.layer.cornerRadius=4
        
        incomeSourceContainer.isHidden=true
        
        let incomeSourceImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        incomeSourceImg.image=images.income
        
        let incomeSourceLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        incomeSourceLbl.text="INCOME SOURCE"
        incomeSourceLbl.textColor=UIColor.black
        incomeSourceLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        politicallyExposedContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        politicallyExposedContainer.backgroundColor=UIColor.white
        politicallyExposedContainer.layer.shadowColor=UIColor.gray.cgColor
        politicallyExposedContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        politicallyExposedContainer.backgroundColor=UIColor.white
        politicallyExposedContainer.layer.shadowOpacity=0.5
        politicallyExposedContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        politicallyExposedContainer.layer.masksToBounds=false
        politicallyExposedContainer.layer.cornerRadius=4
        
        politicallyExposedContainer.isHidden=true
        
        let politicallyExposedImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        politicallyExposedImg.image=images.file
        
        let politicallyExposedLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        politicallyExposedLbl.text="POLITICALLY EXPOSED"
        politicallyExposedLbl.textColor=UIColor.black
        politicallyExposedLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        taxSwitchContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        taxSwitchContainer.backgroundColor=UIColor.white
        taxSwitchContainer.layer.shadowColor=UIColor.gray.cgColor
        taxSwitchContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        taxSwitchContainer.backgroundColor=UIColor.white
        taxSwitchContainer.layer.shadowOpacity=0.5
        taxSwitchContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        taxSwitchContainer.layer.masksToBounds=false
        taxSwitchContainer.layer.cornerRadius=4
        
        taxSwitchContainer.isHidden = true
        
        taxSwitch=UISwitch(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        taxSwitch.addTarget(self, action:#selector(EditProfileVC.switchHandle(_:)), for: .valueChanged)
        
        let taxSwitchLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/16.6,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        taxSwitchLbl.text="Is Tax Country Other Than India?"
        taxSwitchLbl.textColor=UIColor.black
        taxSwitchLbl.font=UIFont.boldSystemFont(ofSize: 13)
        
        firstTaxResidencyContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        firstTaxResidencyContainer.layer.shadowColor=UIColor.gray.cgColor
        firstTaxResidencyContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstTaxResidencyContainer.backgroundColor=UIColor.lightGray
        firstTaxResidencyContainer.layer.shadowOpacity=0.5
        firstTaxResidencyContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstTaxResidencyContainer.layer.masksToBounds=false
        firstTaxResidencyContainer.layer.cornerRadius=4
        
        firstTaxResidencyContainer.isHidden = true
        
        let firstTaxResidencyLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstTaxResidencyLbl.text="First Tax Residency"
        firstTaxResidencyLbl.textColor=UIColor.black
        firstTaxResidencyLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstTaxCountryContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstTaxCountryContainer.backgroundColor=UIColor.white
        firstTaxCountryContainer.layer.shadowColor=UIColor.gray.cgColor
        firstTaxCountryContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstTaxCountryContainer.backgroundColor=UIColor.white
        firstTaxCountryContainer.layer.shadowOpacity=0.5
        firstTaxCountryContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstTaxCountryContainer.layer.masksToBounds=false
        firstTaxCountryContainer.layer.cornerRadius=4
        
        firstTaxCountryContainer.isHidden=true
        
        let firstTaxCountryImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstTaxCountryImg.image=images.tax
        
        let firstTaxCountryLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstTaxCountryLbl.text="TAX COUNTRY"
        firstTaxCountryLbl.textColor=UIColor.black
        firstTaxCountryLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstIdContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstIdContainer.backgroundColor=UIColor.white
        firstIdContainer.layer.shadowColor=UIColor.gray.cgColor
        firstIdContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstIdContainer.backgroundColor=UIColor.white
        firstIdContainer.layer.shadowOpacity=0.5
        firstIdContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstIdContainer.layer.masksToBounds=false
        firstIdContainer.layer.cornerRadius=4
        
        firstIdContainer.isHidden=true
        
        let firstIdImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstIdImg.image=images.tax
        
        let firstIdLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstIdLbl.text="IDENTIFICATION NUMBER"
        firstIdLbl.textColor=UIColor.black
        firstIdLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        firstIdTypeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        firstIdTypeContainer.backgroundColor=UIColor.white
        firstIdTypeContainer.layer.shadowColor=UIColor.gray.cgColor
        firstIdTypeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        firstIdTypeContainer.backgroundColor=UIColor.white
        firstIdTypeContainer.layer.shadowOpacity=0.5
        firstIdTypeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        firstIdTypeContainer.layer.masksToBounds=false
        firstIdTypeContainer.layer.cornerRadius=4
        
        firstIdTypeContainer.isHidden=true
        
        let firstIdTypeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        firstIdTypeImg.image=images.tax
        
        let firstIdTypeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        firstIdTypeLbl.text="IDENTIFICATION TYPE"
        firstIdTypeLbl.textColor=UIColor.black
        firstIdTypeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondTaxResidencyContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        secondTaxResidencyContainer.layer.shadowColor=UIColor.gray.cgColor
        secondTaxResidencyContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondTaxResidencyContainer.backgroundColor=UIColor.lightGray
        secondTaxResidencyContainer.layer.shadowOpacity=0.5
        secondTaxResidencyContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondTaxResidencyContainer.layer.masksToBounds=false
        secondTaxResidencyContainer.layer.cornerRadius=4
        
        secondTaxResidencyContainer.isHidden = true
        
        let secondTaxResidencyLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondTaxResidencyLbl.text="Second Tax Residency"
        secondTaxResidencyLbl.textColor=UIColor.black
        secondTaxResidencyLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondTaxCountryContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondTaxCountryContainer.backgroundColor=UIColor.white
        secondTaxCountryContainer.layer.shadowColor=UIColor.gray.cgColor
        secondTaxCountryContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondTaxCountryContainer.backgroundColor=UIColor.white
        secondTaxCountryContainer.layer.shadowOpacity=0.5
        secondTaxCountryContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondTaxCountryContainer.layer.masksToBounds=false
        secondTaxCountryContainer.layer.cornerRadius=4
        
        secondTaxCountryContainer.isHidden=true
        
        let secondTaxCountryImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondTaxCountryImg.image=images.tax
        
        let secondTaxCountryLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondTaxCountryLbl.text="TAX COUNTRY"
        secondTaxCountryLbl.textColor=UIColor.black
        secondTaxCountryLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondIdContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondIdContainer.backgroundColor=UIColor.white
        secondIdContainer.layer.shadowColor=UIColor.gray.cgColor
        secondIdContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondIdContainer.backgroundColor=UIColor.white
        secondIdContainer.layer.shadowOpacity=0.5
        secondIdContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondIdContainer.layer.masksToBounds=false
        secondIdContainer.layer.cornerRadius=4
        
        secondIdContainer.isHidden=true
        
        let secondIdImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondIdImg.image=images.tax
        
        let secondIdLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondIdLbl.text="IDENTIFICATION NUMBER"
        secondIdLbl.textColor=UIColor.black
        secondIdLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        secondIdTypeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        secondIdTypeContainer.backgroundColor=UIColor.white
        secondIdTypeContainer.layer.shadowColor=UIColor.gray.cgColor
        secondIdTypeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        secondIdTypeContainer.backgroundColor=UIColor.white
        secondIdTypeContainer.layer.shadowOpacity=0.5
        secondIdTypeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        secondIdTypeContainer.layer.masksToBounds=false
        secondIdTypeContainer.layer.cornerRadius=4
        
        secondIdTypeContainer.isHidden=true
        
        let secondIdTypeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        secondIdTypeImg.image=images.tax
        
        let secondIdTypeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        secondIdTypeLbl.text="IDENTIFICATION TYPE"
        secondIdTypeLbl.textColor=UIColor.black
        secondIdTypeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdTaxResidencyContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10))
        thirdTaxResidencyContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdTaxResidencyContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdTaxResidencyContainer.backgroundColor=UIColor.lightGray
        thirdTaxResidencyContainer.layer.shadowOpacity=0.5
        thirdTaxResidencyContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdTaxResidencyContainer.layer.masksToBounds=false
        thirdTaxResidencyContainer.layer.cornerRadius=4
        
        thirdTaxResidencyContainer.isHidden = true
        
        let thirdTaxResidencyLbl=UILabel(frame:CGRect(x:addBtn.frame.origin.x+addBtn.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/33.3,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdTaxResidencyLbl.text="Third Tax Residency"
        thirdTaxResidencyLbl.textColor=UIColor.black
        thirdTaxResidencyLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdTaxCountryContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdTaxCountryContainer.backgroundColor=UIColor.white
        thirdTaxCountryContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdTaxCountryContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdTaxCountryContainer.backgroundColor=UIColor.white
        thirdTaxCountryContainer.layer.shadowOpacity=0.5
        thirdTaxCountryContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdTaxCountryContainer.layer.masksToBounds=false
        thirdTaxCountryContainer.layer.cornerRadius=4
        
        thirdTaxCountryContainer.isHidden=true
        
        let thirdTaxCountryImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdTaxCountryImg.image=images.tax
        
        let thirdTaxCountryLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdTaxCountryLbl.text="TAX COUNTRY"
        thirdTaxCountryLbl.textColor=UIColor.black
        thirdTaxCountryLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdIdContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdIdContainer.backgroundColor=UIColor.white
        thirdIdContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdIdContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdIdContainer.backgroundColor=UIColor.white
        thirdIdContainer.layer.shadowOpacity=0.5
        thirdIdContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdIdContainer.layer.masksToBounds=false
        thirdIdContainer.layer.cornerRadius=4
        
        thirdIdContainer.isHidden=true
        
        let thirdIdImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdIdImg.image=images.tax
        
        let thirdIdLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdIdLbl.text="IDENTIFICATION NUMBER"
        thirdIdLbl.textColor=UIColor.black
        thirdIdLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        thirdIdTypeContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/12.5))
        thirdIdTypeContainer.backgroundColor=UIColor.white
        thirdIdTypeContainer.layer.shadowColor=UIColor.gray.cgColor
        thirdIdTypeContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        thirdIdTypeContainer.backgroundColor=UIColor.white
        thirdIdTypeContainer.layer.shadowOpacity=0.5
        thirdIdTypeContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        thirdIdTypeContainer.layer.masksToBounds=false
        thirdIdTypeContainer.layer.cornerRadius=4
        
        thirdIdTypeContainer.isHidden=true
        
        let thirdIdTypeImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        thirdIdTypeImg.image=images.tax
        
        let thirdIdTypeLbl=UILabel(frame:CGRect(x:profileImg.frame.origin.x+profileImg.frame.size.width+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/7.14,height:dimensions.SCREEN_HEIGHT/25))
        thirdIdTypeLbl.text="IDENTIFICATION TYPE"
        thirdIdTypeLbl.textColor=UIColor.black
        thirdIdTypeLbl.font=UIFont.boldSystemFont(ofSize: 14)
        
        let updateBtn=UIButton(frame:CGRect(x:0,y:dimensions.SCREEN_HEIGHT-dimensions.SCREEN_HEIGHT/12.5-64,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT/12.5))
        updateBtn.setTitle("UPDATE", for: .normal)
        updateBtn.setTitleColor(UIColor.white, for: .normal)
        updateBtn.backgroundColor=UIColor.init(red: 82/255, green: 163/255, blue: 79/255, alpha: 1)
        updateBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        
        view.addSubview(scrollView)
        scrollView.addSubview(topContainer)
        topContainer.addSubview(profile)
        scrollView.addSubview(profileStatusContainer)
        profileStatusContainer.addSubview(kycIcn)
        profileStatusContainer.addSubview(kycLbl)
        profileStatusContainer.addSubview(kycStatus)
        profileStatusContainer.addSubview(line1)
        profileStatusContainer.addSubview(bankIcn)
        profileStatusContainer.addSubview(bankLbl)
        profileStatusContainer.addSubview(bankStatus)
        profileStatusContainer.addSubview(line2)
        profileStatusContainer.addSubview(profileIcn)
        profileStatusContainer.addSubview(profileLbl)
        profileStatusContainer.addSubview(profileStatus)
        
        scrollView.addSubview(basicDetailsContainer)
        basicDetailsContainer.addSubview(addBtn)
        basicDetailsContainer.addSubview(basicDetailsLbl)
        scrollView.addSubview(nameContainer)
        nameContainer.addSubview(profileImg)
        nameContainer.addSubview(nameLbl)
        scrollView.addSubview(panContainer)
        panContainer.addSubview(panImg)
        panContainer.addSubview(panLbl)
        scrollView.addSubview(aadharContainer)
        aadharContainer.addSubview(aadharImg)
        aadharContainer.addSubview(aadharLbl)
        scrollView.addSubview(emailContainer)
        emailContainer.addSubview(emailImg)
        emailContainer.addSubview(emailLbl)
        scrollView.addSubview(mobileContainer)
        mobileContainer.addSubview(mobImg)
        mobileContainer.addSubview(mobileLbl)
        scrollView.addSubview(occupationContainer)
        occupationContainer.addSubview(occupationImg)
        occupationContainer.addSubview(occupationLbl)
        scrollView.addSubview(annualIncomeContainer)
        annualIncomeContainer.addSubview(incomeImg)
        annualIncomeContainer.addSubview(incomeLbl)
        scrollView.addSubview(dobContainer)
        dobContainer.addSubview(dobImg)
        dobContainer.addSubview(dobLbl)
        scrollView.addSubview(addressContainer)
        addressContainer.addSubview(addBtn2)
        addressContainer.addSubview(addressLbl)
        scrollView.addSubview(addressSubContainer)
        addressSubContainer.addSubview(addressImg)
        addressSubContainer.addSubview(addressSubLbl)
        scrollView.addSubview(pincodeContainer)
        pincodeContainer.addSubview(pincodeImg)
        pincodeContainer.addSubview(pincodeLbl)
        scrollView.addSubview(cityContainer)
        cityContainer.addSubview(cityImg)
        cityContainer.addSubview(cityLbl)
        scrollView.addSubview(stateContainer)
        stateContainer.addSubview(stateImg)
        stateContainer.addSubview(stateLbl)
        scrollView.addSubview(countryContainer)
        countryContainer.addSubview(countryImg)
        countryContainer.addSubview(countryLbl)
        scrollView.addSubview(bankContainer)
        bankContainer.addSubview(addBtn3)
        bankContainer.addSubview(BankLbl)
        scrollView.addSubview(ifscContainer)
        ifscContainer.addSubview(ifscImg)
        ifscContainer.addSubview(ifscLbl)
        scrollView.addSubview(accTypeContainer)
        accTypeContainer.addSubview(accTypeImg)
        accTypeContainer.addSubview(accTypeLbl)
        scrollView.addSubview(branchAddrContainer)
        branchAddrContainer.addSubview(branchAddrImg)
        branchAddrContainer.addSubview(branchAddrLbl)
        scrollView.addSubview(bankNameContainer)
        bankNameContainer.addSubview(bankNameImg)
        bankNameContainer.addSubview(bankNameLbl)
        scrollView.addSubview(branchNameContainer)
        branchNameContainer.addSubview(branchNameImg)
        branchNameContainer.addSubview(branchNameLbl)
        scrollView.addSubview(branchCityContainer)
        branchCityContainer.addSubview(branchCityImg)
        branchCityContainer.addSubview(branchCityLbl)
        scrollView.addSubview(micrContainer)
        micrContainer.addSubview(micrImg)
        micrContainer.addSubview(micrLbl)
        scrollView.addSubview(accNoContainer)
        accNoContainer.addSubview(accNoImg)
        accNoContainer.addSubview(accNoLbl)
        scrollView.addSubview(nameInBankContainer)
        nameInBankContainer.addSubview(nameInBankImg)
        nameInBankContainer.addSubview(nameInBankLbl)
        scrollView.addSubview(nomineeContainer)
        nomineeContainer.addSubview(addBtn4)
        nomineeContainer.addSubview(nomineeLbl)
        scrollView.addSubview(firstNomineeContainer)
        firstNomineeContainer.addSubview(firstNomineeLbl)
        scrollView.addSubview(firstNomineeNameContainer)
        firstNomineeNameContainer.addSubview(firstNomineeNameImg)
        firstNomineeNameContainer.addSubview(firstNomineeNameLbl)
        scrollView.addSubview(firstNomineeShareContainer)
        firstNomineeShareContainer.addSubview(firstNomineeShareImg)
        firstNomineeShareContainer.addSubview(firstNomineeShareLbl)
        scrollView.addSubview(firstNomineeRelationContainer)
        firstNomineeRelationContainer.addSubview(firstNomineeRelationImg)
        firstNomineeRelationContainer.addSubview(firstNomineeRelationLbl)
        scrollView.addSubview(firstNomineeDobContainer)
        firstNomineeDobContainer.addSubview(firstNomineeDobImg)
        firstNomineeDobContainer.addSubview(firstNomineeDobLbl)
        scrollView.addSubview(secondNomineeContainer)
        secondNomineeContainer.addSubview(secondNomineeLbl)
        scrollView.addSubview(secondNomineeNameContainer)
        secondNomineeNameContainer.addSubview(secondNomineeNameImg)
        secondNomineeNameContainer.addSubview(secondNomineeNameLbl)
        scrollView.addSubview(secondNomineeShareContainer)
        secondNomineeShareContainer.addSubview(secondNomineeShareImg)
        secondNomineeShareContainer.addSubview(secondNomineeShareLbl)
        scrollView.addSubview(secondNomineeRelationContainer)
        secondNomineeRelationContainer.addSubview(secondNomineeRelationImg)
        secondNomineeRelationContainer.addSubview(secondNomineeRelationLbl)
        scrollView.addSubview(secondNomineeDobContainer)
        secondNomineeDobContainer.addSubview(secondNomineeDobImg)
        secondNomineeDobContainer.addSubview(secondNomineeDobLbl)
        scrollView.addSubview(thirdNomineeContainer)
        thirdNomineeContainer.addSubview(thirdNomineeLbl)
        scrollView.addSubview(thirdNomineeNameContainer)
        thirdNomineeNameContainer.addSubview(thirdNomineeNameImg)
        thirdNomineeNameContainer.addSubview(thirdNomineeNameLbl)
        scrollView.addSubview(thirdNomineeShareContainer)
        thirdNomineeShareContainer.addSubview(thirdNomineeShareImg)
        thirdNomineeShareContainer.addSubview(thirdNomineeShareLbl)
        scrollView.addSubview(thirdNomineeRelationContainer)
        thirdNomineeRelationContainer.addSubview(thirdNomineeRelationImg)
        thirdNomineeRelationContainer.addSubview(thirdNomineeRelationLbl)
        scrollView.addSubview(thirdNomineeDobContainer)
        thirdNomineeDobContainer.addSubview(thirdNomineeDobImg)
        thirdNomineeDobContainer.addSubview(thirdNomineeDobLbl)
        scrollView.addSubview(fatcaContainer)
        fatcaContainer.addSubview(addBtn5)
        fatcaContainer.addSubview(fatcaLbl)
        scrollView.addSubview(placeOfBirthContainer)
        placeOfBirthContainer.addSubview(placeOfBirthImg)
        placeOfBirthContainer.addSubview(placeOfBirthLbl)
        scrollView.addSubview(birthCountryContainer)
        birthCountryContainer.addSubview(birthCountryImg)
        birthCountryContainer.addSubview(birthCountryLbl)
        scrollView.addSubview(incomeSourceContainer)
        incomeSourceContainer.addSubview(incomeSourceImg)
        incomeSourceContainer.addSubview(incomeSourceLbl)
        scrollView.addSubview(politicallyExposedContainer)
        politicallyExposedContainer.addSubview(politicallyExposedLbl)
        politicallyExposedContainer.addSubview(politicallyExposedImg)
        scrollView.addSubview(taxSwitchContainer)
        taxSwitchContainer.addSubview(taxSwitch)
        taxSwitchContainer.addSubview(taxSwitchLbl)
        scrollView.addSubview(firstTaxResidencyContainer)
        firstTaxResidencyContainer.addSubview(firstTaxResidencyLbl)
        scrollView.addSubview(firstTaxCountryContainer)
        firstTaxCountryContainer.addSubview(firstTaxCountryLbl)
        firstTaxCountryContainer.addSubview(firstTaxCountryImg)
        scrollView.addSubview(firstIdContainer)
        firstIdContainer.addSubview(firstIdLbl)
        firstIdContainer.addSubview(firstIdImg)
        scrollView.addSubview(firstIdTypeContainer)
        firstIdTypeContainer.addSubview(firstIdTypeLbl)
        firstIdTypeContainer.addSubview(firstIdTypeImg)
        scrollView.addSubview(secondTaxResidencyContainer)
        secondTaxResidencyContainer.addSubview(secondTaxResidencyLbl)
        scrollView.addSubview(secondTaxCountryContainer)
        secondTaxCountryContainer.addSubview(secondTaxCountryLbl)
        secondTaxCountryContainer.addSubview(secondTaxCountryImg)
        scrollView.addSubview(secondIdContainer)
        secondIdContainer.addSubview(secondIdLbl)
        secondIdContainer.addSubview(secondIdImg)
        scrollView.addSubview(secondIdTypeContainer)
        secondIdTypeContainer.addSubview(secondIdTypeLbl)
        secondIdTypeContainer.addSubview(secondIdTypeImg)
        scrollView.addSubview(thirdTaxResidencyContainer)
        thirdTaxResidencyContainer.addSubview(thirdTaxResidencyLbl)
        scrollView.addSubview(thirdTaxCountryContainer)
        thirdTaxCountryContainer.addSubview(thirdTaxCountryLbl)
        thirdTaxCountryContainer.addSubview(thirdTaxCountryImg)
        scrollView.addSubview(thirdIdContainer)
        thirdIdContainer.addSubview(thirdIdLbl)
        thirdIdContainer.addSubview(thirdIdImg)
        scrollView.addSubview(thirdIdTypeContainer)
        thirdIdTypeContainer.addSubview(thirdIdTypeLbl)
        thirdIdTypeContainer.addSubview(thirdIdTypeImg)
        
        view.addSubview(updateBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func addBtn1Action(_ sender:UIButton){
        if(sender.currentBackgroundImage == images.minus){
            self.minusBtn1Action()
            addBtn.setBackgroundImage(images.add, for: .normal)

            return
        }
        nameContainer.isHidden=false
        panContainer.isHidden=false
        aadharContainer.isHidden=false
        emailContainer.isHidden=false
        mobileContainer.isHidden=false
        occupationContainer.isHidden=false
        annualIncomeContainer.isHidden=false
        dobContainer.isHidden=false
        
        addBtn.setBackgroundImage(images.minus, for: .normal)
        addressContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dobContainer.frame.origin.y+dobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)        
        
        if addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.52)

            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add{
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.69)

        }
      
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
        ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.398)

        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus{
           
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.19)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{

            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.378)

        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.268)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.306)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == false{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.69)

        }
        
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.69)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.488)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.399)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.304)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.179)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.318)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.202)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.34)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.287)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.253)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.211)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.216)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.174)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.156)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.260)
            
        }
        if addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.231)
            
        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.189)
            
        }
    }
    func minusBtn1Action(){
        nameContainer.isHidden=true
        panContainer.isHidden=true
        aadharContainer.isHidden=true
        emailContainer.isHidden=true
        mobileContainer.isHidden=true
        occupationContainer.isHidden=true
        annualIncomeContainer.isHidden=true
        dobContainer.isHidden=true
        
        addressContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:basicDetailsContainer.frame.origin.y+basicDetailsContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        if addBtn2.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/25)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus{
            ifscContainer.isHidden=false
            accTypeContainer.isHidden=false
            branchAddrContainer.isHidden=false
            bankNameContainer.isHidden=false
            branchNameContainer.isHidden=false
            branchCityContainer.isHidden=false
            micrContainer.isHidden=false
            accNoContainer.isHidden=false
            nameInBankContainer.isHidden=false
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.90)
            
            }
        
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            ifscContainer.isHidden=true
            accTypeContainer.isHidden=true
            branchAddrContainer.isHidden=true
            bankNameContainer.isHidden=true
            branchNameContainer.isHidden=true
            branchCityContainer.isHidden=true
            micrContainer.isHidden=true
            accNoContainer.isHidden=true
            nameInBankContainer.isHidden=true
            
            nameContainer.isHidden=true
            panContainer.isHidden=true
            aadharContainer.isHidden=true
            emailContainer.isHidden=true
            mobileContainer.isHidden=true
            occupationContainer.isHidden=true
            annualIncomeContainer.isHidden=true
            dobContainer.isHidden=true
            
            addressSubContainer.isHidden=false
            pincodeContainer.isHidden=false
            cityContainer.isHidden=false
            stateContainer.isHidden=false
            countryContainer.isHidden=false
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.58)

        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            ifscContainer.isHidden=false
            accTypeContainer.isHidden=false
            branchAddrContainer.isHidden=false
            bankNameContainer.isHidden=false
            branchNameContainer.isHidden=false
            branchCityContainer.isHidden=false
            micrContainer.isHidden=false
            accNoContainer.isHidden=false
            nameInBankContainer.isHidden=false
            
            nameContainer.isHidden=true
            panContainer.isHidden=true
            aadharContainer.isHidden=true
            emailContainer.isHidden=true
            mobileContainer.isHidden=true
            occupationContainer.isHidden=true
            annualIncomeContainer.isHidden=true
            dobContainer.isHidden=true
            
            addressSubContainer.isHidden=false
            pincodeContainer.isHidden=false
            cityContainer.isHidden=false
            stateContainer.isHidden=false
            countryContainer.isHidden=false
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.58)
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.54)

        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.406)

        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.344)

        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
        
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
        
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.58)

        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.811)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.588)
            
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.411)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.423)
            
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.33)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.242)
            
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.480)
            
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.370)
            
        }
       
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.310)
            
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.258)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.263)
            
        }
        if addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.223)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.201)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.179)
            
        }
    }
    
    @objc func addBtn2Action(_ sender:UIButton){

        if(sender.currentBackgroundImage == images.minus){
            self.minusBtn2Action()
            addBtn2.setBackgroundImage(images.add, for: .normal)

            return
        }
        addBtn2.setBackgroundImage(images.minus, for: .normal)

        addressSubContainer.isHidden=false
        pincodeContainer.isHidden=false
        cityContainer.isHidden=false
        stateContainer.isHidden=false
        countryContainer.isHidden=false
        
        addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

        cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

        stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

        countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

        bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
       
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.58)
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus{
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.69)
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.58)

        }
        if addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.396)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.406)

        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.406)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.304)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
           
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.285)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.78)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.48)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.49)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            addressSubContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            pincodeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressSubContainer.frame.origin.y+addressSubContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            cityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:pincodeContainer.frame.origin.y+pincodeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            stateContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:cityContainer.frame.origin.y+cityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            countryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:stateContainer.frame.origin.y+stateContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:countryContainer.frame.origin.y+countryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.344)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.431)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.265)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.331)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn == true{
            
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.222)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.324)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{

            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.218)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.261)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.189)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.202)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.156)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.245)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.177)
            
        }
    }
    
    func minusBtn2Action(){
        addressSubContainer.isHidden=true
        pincodeContainer.isHidden=true
        cityContainer.isHidden=true
        stateContainer.isHidden=true
        countryContainer.isHidden=true
        
        bankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:addressContainer.frame.origin.y+addressContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        if addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/25)
        }
        if addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.21)
        }
        if addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus {
            ifscContainer.isHidden=false
            accTypeContainer.isHidden=false
            branchAddrContainer.isHidden=false
            bankNameContainer.isHidden=false
            branchNameContainer.isHidden=false
            branchCityContainer.isHidden=false
            micrContainer.isHidden=false
            accNoContainer.isHidden=false
            nameInBankContainer.isHidden=false
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.90)
        }
        if addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus {
            ifscContainer.isHidden=false
            accTypeContainer.isHidden=false
            branchAddrContainer.isHidden=false
            bankNameContainer.isHidden=false
            branchNameContainer.isHidden=false
            branchCityContainer.isHidden=false
            micrContainer.isHidden=false
            accNoContainer.isHidden=false
            nameInBankContainer.isHidden=false
            
            addressSubContainer.isHidden=true
            pincodeContainer.isHidden=true
            cityContainer.isHidden=true
            stateContainer.isHidden=true
            countryContainer.isHidden=true
            
            nameContainer.isHidden=false
            panContainer.isHidden=false
            aadharContainer.isHidden=false
            emailContainer.isHidden=false
            mobileContainer.isHidden=false
            occupationContainer.isHidden=false
            annualIncomeContainer.isHidden=false
            dobContainer.isHidden=false
            
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.52)

        }
        if addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.54)
        }
        if addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.378)
        }
        if addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.340)
        }
        if addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.268)
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.58)

        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.48)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.694)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.347)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.574)

        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.3125)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.409)

        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.257)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{

            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.390)

        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.25)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.304)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.211)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.282)
            
        }
        if addBtn.currentBackgroundImage == images.add &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.2)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
            
        }
        if addBtn.currentBackgroundImage == images.minus &&  addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.171)
            
        }
    }
    @objc func addBtn3Action(_ sender:UIButton){
        
        if(sender.currentBackgroundImage == images.minus){
            self.minusBtn3Action()
            addBtn3.setBackgroundImage(images.add, for: .normal)
            
            return
        }
        addBtn3.setBackgroundImage(images.minus, for: .normal)
        
        ifscContainer.isHidden=false
        accTypeContainer.isHidden=false
        branchAddrContainer.isHidden=false
        bankNameContainer.isHidden=false
        branchNameContainer.isHidden=false
        branchCityContainer.isHidden=false
        micrContainer.isHidden=false
        accNoContainer.isHidden=false
        nameInBankContainer.isHidden=false
        
        ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add {
           scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.9)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus {
            nameContainer.isHidden=false
            panContainer.isHidden=false
            aadharContainer.isHidden=false
            emailContainer.isHidden=false
            mobileContainer.isHidden=false
            occupationContainer.isHidden=false
            annualIncomeContainer.isHidden=false
            dobContainer.isHidden=false
          
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.52)

        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add {
            addressSubContainer.isHidden=false
            pincodeContainer.isHidden=false
            cityContainer.isHidden=false
            stateContainer.isHidden=false
            countryContainer.isHidden=false
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.58)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus {
            addressSubContainer.isHidden=false
            pincodeContainer.isHidden=false
            cityContainer.isHidden=false
            stateContainer.isHidden=false
            countryContainer.isHidden=false
            
            nameContainer.isHidden=false
            panContainer.isHidden=false
            aadharContainer.isHidden=false
            emailContainer.isHidden=false
            mobileContainer.isHidden=false
            occupationContainer.isHidden=false
            annualIncomeContainer.isHidden=false
            dobContainer.isHidden=false
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.4)
            
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.340)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.268)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.574)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.314)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.393)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.251)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.42)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.264)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.282)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.2)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.318)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.add &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.218)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.174)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.238)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.177)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.201)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus &&  addBtn4.currentBackgroundImage == images.minus &&  addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.156)
        }
    }
    func minusBtn3Action(){
        ifscContainer.isHidden=true
        accTypeContainer.isHidden=true
        branchAddrContainer.isHidden=true
        bankNameContainer.isHidden=true
        branchNameContainer.isHidden=true
        branchCityContainer.isHidden=true
        micrContainer.isHidden=true
        accNoContainer.isHidden=true
        nameInBankContainer.isHidden=true
      
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        if addBtn3.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/25)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.21)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.6)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.70)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.54)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.375)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.406)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus{
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.306)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.574)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.42)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.48)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.67)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.343)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.81)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.368)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.40)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.25)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.31)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.212)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.324)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.218)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.263)
        }
        if addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.186)
        }
    }
    @objc func addBtn4Action(_ sender:UIButton){
        if(sender.currentBackgroundImage == images.minus){
            self.minusBtn4Action()
            addBtn4.setBackgroundImage(images.add, for: .normal)
            
            return
        }
        addBtn4.setBackgroundImage(images.minus, for: .normal)
        
        firstNomineeContainer.isHidden=false
        firstNomineeNameContainer.isHidden=false
        firstNomineeShareContainer.isHidden=false
        firstNomineeRelationContainer.isHidden=false
        firstNomineeDobContainer.isHidden=false
        secondNomineeContainer.isHidden=false
        secondNomineeNameContainer.isHidden=false
        secondNomineeShareContainer.isHidden=false
        secondNomineeRelationContainer.isHidden=false
        secondNomineeDobContainer.isHidden=false
        thirdNomineeContainer.isHidden=false
        thirdNomineeNameContainer.isHidden=false
        thirdNomineeShareContainer.isHidden=false
        thirdNomineeRelationContainer.isHidden=false
        thirdNomineeDobContainer.isHidden=false
        
        firstNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        firstNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeContainer.frame.origin.y+firstNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        firstNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeNameContainer.frame.origin.y+firstNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        firstNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeShareContainer.frame.origin.y+firstNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        firstNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeRelationContainer.frame.origin.y+firstNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        secondNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstNomineeDobContainer.frame.origin.y+firstNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        secondNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeContainer.frame.origin.y+secondNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        secondNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeNameContainer.frame.origin.y+secondNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        secondNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeShareContainer.frame.origin.y+secondNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        secondNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeRelationContainer.frame.origin.y+secondNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        thirdNomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondNomineeDobContainer.frame.origin.y+secondNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        thirdNomineeNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeContainer.frame.origin.y+thirdNomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        thirdNomineeShareContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeNameContainer.frame.origin.y+thirdNomineeNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        thirdNomineeRelationContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeShareContainer.frame.origin.y+thirdNomineeShareContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        thirdNomineeDobContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeRelationContainer.frame.origin.y+thirdNomineeRelationContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdNomineeDobContainer.frame.origin.y+thirdNomineeDobContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.54)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.378)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.406)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.340)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.306)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.268)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.409)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.257)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.308)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.214)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.259)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.19)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.230)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.173)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.241)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.178)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.326)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.22)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.201
            )
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.201)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.156)
        }
    }
    func minusBtn4Action(){
        firstNomineeContainer.isHidden=true
        firstNomineeNameContainer.isHidden=true
        firstNomineeShareContainer.isHidden=true
        firstNomineeRelationContainer.isHidden=true
        firstNomineeDobContainer.isHidden=true
        secondNomineeContainer.isHidden=true
        secondNomineeNameContainer.isHidden=true
        secondNomineeShareContainer.isHidden=true
        secondNomineeRelationContainer.isHidden=true
        secondNomineeDobContainer.isHidden=true
        thirdNomineeContainer.isHidden=true
        thirdNomineeNameContainer.isHidden=true
        thirdNomineeShareContainer.isHidden=true
        thirdNomineeRelationContainer.isHidden=true
        thirdNomineeDobContainer.isHidden=true
        
        nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/25)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.19)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.61)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.51)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.9)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus{
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.70)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.58)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus{
            ifscContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankContainer.frame.origin.y+bankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:ifscContainer.frame.origin.y+ifscContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchAddrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accTypeContainer.frame.origin.y+accTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            bankNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchAddrContainer.frame.origin.y+branchAddrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchNameContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:bankNameContainer.frame.origin.y+bankNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            branchCityContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchNameContainer.frame.origin.y+branchNameContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            micrContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:branchCityContainer.frame.origin.y+branchCityContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            accNoContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:micrContainer.frame.origin.y+micrContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nameInBankContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:accNoContainer.frame.origin.y+accNoContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            nomineeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nameInBankContainer.frame.origin.y+nameInBankContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            fatcaContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:nomineeContainer.frame.origin.y+nomineeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.39)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.58)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.48)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.694)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.347)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.81)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.37)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.574)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.314)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.476)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.282)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.39)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.25)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.434)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.26)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.31)
        }
        if addBtn4.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn5.currentBackgroundImage == images.minus && taxSwitch.isOn==true{
            placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
            
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.215)
        }
    }
    @objc func addBtn5Action(_ sender:UIButton){
        if(sender.currentBackgroundImage == images.minus){
            self.minusBtn5Action()
            addBtn5.setBackgroundImage(images.add, for: .normal)
            
            return
        }
        addBtn5.setBackgroundImage(images.minus, for: .normal)
        placeOfBirthContainer.isHidden=false
        birthCountryContainer.isHidden=false
        incomeSourceContainer.isHidden=false
        politicallyExposedContainer.isHidden=false
        taxSwitchContainer.isHidden=false
        
        placeOfBirthContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:fatcaContainer.frame.origin.y+fatcaContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        birthCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:placeOfBirthContainer.frame.origin.y+placeOfBirthContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        incomeSourceContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:birthCountryContainer.frame.origin.y+birthCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        politicallyExposedContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:incomeSourceContainer.frame.origin.y+incomeSourceContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
        
        taxSwitchContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:politicallyExposedContainer.frame.origin.y+politicallyExposedContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)
       
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.58)

        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.67)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.81)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.574)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.409)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.476)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.39)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.31)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.434)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.326)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.241)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.201)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.260)
            
        }
    }
    
    @objc func switchHandle(_ sender:UISwitch){
        if sender.isOn == false {
            self.handleDisableSwitch()
        }
            else {
            firstTaxResidencyContainer.isHidden=false
            firstTaxCountryContainer.isHidden=false
            firstIdContainer.isHidden=false
            firstIdTypeContainer.isHidden=false
            secondTaxResidencyContainer.isHidden=false
            secondTaxCountryContainer.isHidden=false
            secondIdContainer.isHidden=false
            secondIdTypeContainer.isHidden=false
            thirdTaxResidencyContainer.isHidden=false
            thirdTaxCountryContainer.isHidden=false
            thirdIdContainer.isHidden=false
            thirdIdTypeContainer.isHidden=false
            
            firstTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:taxSwitchContainer.frame.origin.y+taxSwitchContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            firstTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxResidencyContainer.frame.origin.y+firstTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            firstIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstTaxCountryContainer.frame.origin.y+firstTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            firstIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdContainer.frame.origin.y+firstIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            secondTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:firstIdTypeContainer.frame.origin.y+firstIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            secondTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxResidencyContainer.frame.origin.y+secondTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            secondIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondTaxCountryContainer.frame.origin.y+secondTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            secondIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdContainer.frame.origin.y+secondIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            thirdTaxResidencyContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:secondIdTypeContainer.frame.origin.y+secondIdTypeContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            thirdTaxCountryContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxResidencyContainer.frame.origin.y+thirdTaxResidencyContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            thirdIdContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdTaxCountryContainer.frame.origin.y+thirdTaxCountryContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            thirdIdTypeContainer.frame=CGRect(x:dimensions.SCREEN_HEIGHT/50,y:thirdIdContainer.frame.origin.y+thirdIdContainer.frame.size.height+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/10)

            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.485)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.34)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.367)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.312)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.255)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.285)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.25)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.214)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.266)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.221)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.2)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.178)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.156)
                
            }
            if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
                scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.189)
                
            }
        }
        
    }
    func handleDisableSwitch(){
        firstTaxResidencyContainer.isHidden=true
        firstTaxCountryContainer.isHidden=true
        firstIdContainer.isHidden=true
        firstIdTypeContainer.isHidden=true
        secondTaxResidencyContainer.isHidden=true
        secondTaxCountryContainer.isHidden=true
        secondIdContainer.isHidden=true
        secondIdTypeContainer.isHidden=true
        thirdTaxResidencyContainer.isHidden=true
        thirdTaxCountryContainer.isHidden=true
        thirdIdContainer.isHidden=true
        thirdIdTypeContainer.isHidden=true
        
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.47)

        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT/0.40)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.80)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.561)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.403)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.49)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.393)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.305)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.421)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.324)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.284)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.242)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.201)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.260)
            
        }
    }
    func minusBtn5Action(){
        addBtn5.setBackgroundImage(images.minus, for: .normal)
        placeOfBirthContainer.isHidden=true
        birthCountryContainer.isHidden=true
        incomeSourceContainer.isHidden=true
        politicallyExposedContainer.isHidden=true
        taxSwitchContainer.isHidden=true
        taxSwitch.isOn=false
        firstTaxResidencyContainer.isHidden=true
        firstTaxCountryContainer.isHidden=true
        firstIdContainer.isHidden=true
        firstIdTypeContainer.isHidden=true
        secondTaxResidencyContainer.isHidden=true
        secondTaxCountryContainer.isHidden=true
        secondIdContainer.isHidden=true
        secondIdTypeContainer.isHidden=true
        thirdTaxResidencyContainer.isHidden=true
        thirdTaxCountryContainer.isHidden=true
        thirdIdContainer.isHidden=true
        thirdIdTypeContainer.isHidden=true
        
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/25)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.19)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/1.56)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.87)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.537)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.675)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.515)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.378)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.add {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.56)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.406)
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.add && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.344)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.add && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.280)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.minus && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.232)
            
        }
        if addBtn5.currentBackgroundImage == images.minus && addBtn.currentBackgroundImage == images.minus && addBtn2.currentBackgroundImage == images.minus && addBtn3.currentBackgroundImage == images.add && addBtn4.currentBackgroundImage == images.minus {
            scrollView.contentSize=CGSize.init(width: dimensions.SCREEN_WIDTH, height: dimensions.SCREEN_HEIGHT+dimensions.SCREEN_HEIGHT/0.307)
            
        }
    }
}
