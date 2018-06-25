//
//  ProfileVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 2/26/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton

class ProfileVC: UIViewController {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    var editProfylBtn = PressableButton()
    var addMemberBtn = PressableButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        self.pageDesign()
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
        self.navigationItem.title="FINCART"
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        
        let indentView=UIView(frame:CGRect(x:0,y:0,width:20,height:20))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: indentView)
        
        let logout=UIButton(frame:CGRect(x:-20,y:0,width:60,height:20))
        logout.titleLabel?.font=UIFont.systemFont(ofSize: 13)
        logout.setTitle("Logout", for: .normal)
        logout.addTarget(self, action: #selector(FinCartKYCCheckVC.logoutAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: logout)
    }
    func pageDesign(){
        let mainContainer=UIView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/2.85))
        mainContainer.layer.shadowColor=UIColor.gray.cgColor
        mainContainer.layer.shadowOffset=CGSize(width: 0, height: -dimensions.SCREEN_HEIGHT/166.67)
        mainContainer.backgroundColor=UIColor.white
        mainContainer.layer.shadowOpacity=0.3
        mainContainer.layer.shadowRadius=dimensions.SCREEN_HEIGHT/100
        mainContainer.layer.masksToBounds=false
        
        let userImg=UIImageView(frame:CGRect(x:dimensions.SCREEN_HEIGHT/25,y:dimensions.SCREEN_HEIGHT/20,width:dimensions.SCREEN_HEIGHT/5,height:dimensions.SCREEN_HEIGHT/5))
        userImg.image=images.user
        
        let kycIcn=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2,y:dimensions.SCREEN_HEIGHT/16.6,width:dimensions.SCREEN_HEIGHT/25,height:dimensions.SCREEN_HEIGHT/25))
        kycIcn.image=images.form
        
        let kycLbl=UILabel(frame:CGRect(x:kycIcn.frame.size.width+kycIcn.frame.origin.x+dimensions.SCREEN_HEIGHT/50,y:dimensions.SCREEN_HEIGHT/20,width:100,height:dimensions.SCREEN_HEIGHT/25))
        kycLbl.text="Kyc"
        kycLbl.textColor=UIColor.black
        kycLbl.font=UIFont.systemFont(ofSize: 14)
        
        let kycStatus=UILabel(frame:CGRect(x:kycIcn.frame.size.width+kycIcn.frame.origin.x+dimensions.SCREEN_HEIGHT/50,y:kycLbl.frame.size.height+kycLbl.frame.origin.y,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/12.5,height:dimensions.SCREEN_HEIGHT/25))
        kycStatus.text="PAN Required"
        kycStatus.textColor=UIColor.red
        kycStatus.font=UIFont.boldSystemFont(ofSize: 14)
        
        let bankIcn=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2,y:kycStatus.frame.size.height+kycStatus.frame.origin.y+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/20,height:dimensions.SCREEN_HEIGHT/20))
        bankIcn.image=images.card
        
        let bankLbl=UILabel(frame:CGRect(x:kycIcn.frame.size.width+kycIcn.frame.origin.x+dimensions.SCREEN_HEIGHT/50,y:kycStatus.frame.size.height+kycStatus.frame.origin.y+dimensions.SCREEN_HEIGHT/100,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/12.5,height:dimensions.SCREEN_HEIGHT/25))
        bankLbl.text="Bank Mandate"
        bankLbl.textColor=UIColor.black
        bankLbl.font=UIFont.systemFont(ofSize: 14)
        
        let bankStatus=UILabel(frame:CGRect(x:kycIcn.frame.size.width+kycIcn.frame.origin.x+dimensions.SCREEN_HEIGHT/50,y:bankLbl.frame.size.height+bankLbl.frame.origin.y,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/12.5,height:dimensions.SCREEN_HEIGHT/25))
        bankStatus.text="In-Process"
        bankStatus.textColor=UIColor.init(red: 253/255, green: 190/255, blue: 53/255, alpha: 1.0)
        bankStatus.font=UIFont.boldSystemFont(ofSize: 14)
        
        let profileIcn=UIImageView(frame:CGRect(x:dimensions.SCREEN_WIDTH/2,y:bankStatus.frame.size.height+bankStatus.frame.origin.y+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_HEIGHT/20,height:dimensions.SCREEN_HEIGHT/20))
        profileIcn.image=images.profile
        
        let profileLbl=UILabel(frame:CGRect(x:kycIcn.frame.size.width+kycIcn.frame.origin.x+dimensions.SCREEN_HEIGHT/50,y:bankStatus.frame.size.height+bankStatus.frame.origin.y+dimensions.SCREEN_HEIGHT/100,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/12.5,height:dimensions.SCREEN_HEIGHT/25))
        profileLbl.text="Profile"
        profileLbl.textColor=UIColor.black
        profileLbl.font=UIFont.systemFont(ofSize: 14)
        
        let profileStatus=UILabel(frame:CGRect(x:kycIcn.frame.size.width+kycIcn.frame.origin.x+dimensions.SCREEN_HEIGHT/50,y:profileLbl.frame.size.height+profileLbl.frame.origin.y,width:dimensions.SCREEN_WIDTH-dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/12.5,height:dimensions.SCREEN_HEIGHT/25))
        profileStatus.text="25%"
        profileStatus.textColor=UIColor.init(red: 255/255, green: 182/255, blue: 193/255, alpha: 1)
        profileStatus.font=UIFont.boldSystemFont(ofSize: 14)
        
        let editProfylBtn = UIButton(frame: CGRect(x:dimensions.SCREEN_HEIGHT/50,y:profileStatus.frame.size.height+profileStatus.frame.origin.y+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/40,height:dimensions.SCREEN_HEIGHT/12.5))
        editProfylBtn.setTitle("EDIT PROFILE", for: .normal)
        editProfylBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        editProfylBtn.backgroundColor = colors.APP_THEME_COLOR
        editProfylBtn.setTitleColor(UIColor.white, for: .normal)
        editProfylBtn.setImage(UIImage(named:"editProfile"), for: .normal)
        editProfylBtn.contentHorizontalAlignment = .left
        editProfylBtn.imageEdgeInsets.left = -10
        editProfylBtn.layer.cornerRadius=0
        editProfylBtn.layer.masksToBounds=true
        editProfylBtn.imageEdgeInsets.top = dimensions.SCREEN_HEIGHT/38.46
        editProfylBtn.imageEdgeInsets.bottom = dimensions.SCREEN_HEIGHT/38.46
        editProfylBtn.imageView?.contentMode = .scaleAspectFit
        editProfylBtn.titleEdgeInsets = UIEdgeInsets(top: 0,left: -25,bottom: 0,right: 0)
        editProfylBtn.addTarget(self, action: #selector(ProfileVC.editProfile(_:)), for: .touchUpInside)
        
        let addMemberBtn = UIButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+2.5,y:profileStatus.frame.size.height+profileStatus.frame.origin.y+dimensions.SCREEN_HEIGHT/50,width:dimensions.SCREEN_WIDTH/2-dimensions.SCREEN_HEIGHT/40,height:dimensions.SCREEN_HEIGHT/12.5))
        addMemberBtn.setTitle("ADD NEW MEMBER", for: .normal)
        addMemberBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        addMemberBtn.backgroundColor = UIColor.init(red: 253/255, green: 190/255, blue: 53/255, alpha: 1.0)
        addMemberBtn.setTitleColor(UIColor.white, for: .normal)
        addMemberBtn.setImage(UIImage(named:"addMember"), for: .normal)
        addMemberBtn.contentHorizontalAlignment = .left
        addMemberBtn.imageEdgeInsets.left = -10
        addMemberBtn.imageEdgeInsets.top = dimensions.SCREEN_HEIGHT/38.46
        addMemberBtn.imageEdgeInsets.bottom = dimensions.SCREEN_HEIGHT/38.46
        addMemberBtn.imageView?.contentMode = .scaleAspectFit
        addMemberBtn.titleEdgeInsets = UIEdgeInsets(top: 0,left: -25,bottom: 0,right: 0)
        addMemberBtn.addTarget(self, action: #selector(ProfileVC.addNewMember(_:)), for: .touchUpInside)
        
        view.addSubview(mainContainer)
        view.addSubview(userImg)
        view.addSubview(kycIcn)
        view.addSubview(kycLbl)
        view.addSubview(kycStatus)
        view.addSubview(bankIcn)
        view.addSubview(bankLbl)
        view.addSubview(bankStatus)
        view.addSubview(profileIcn)
        view.addSubview(profileLbl)
        view.addSubview(profileStatus)
        view.addSubview(editProfylBtn)
        view.addSubview(addMemberBtn)

    }
    @objc func addNewMember(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "FinCartKYCCheckVC") as! FinCartKYCCheckVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func editProfile(_ sender:UIButton){
        let controller=self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
