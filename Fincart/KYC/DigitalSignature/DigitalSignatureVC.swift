//
//  ViewController.swift
//  SwiftSignatureView
//
//  Created by Alankar Misra on 07/17/2015.
//
// SwiftSignatureView is available under the MIT license. See the LICENSE file for more info.

import UIKit
import SwiftSignatureView
import SwiftyButton
import Alamofire
import PopupDialog

public class DigitalSignatureVC: UIViewController {
    
    var colors=Colors()
    var dimensions=Dimensions()
    var utils=Utils()
    var images=Images()
    var clearBtn = PressableButton()
    var saveBtn = PressableButton()
    var bankName=String()
    var bankAddress=String()
    var accNo=String()
    var bankCity=String()
    var accType=String()
    var ifsc=String()
    var basicId=String()
    var aadhar=String()
    var address=String()
    var city=String()
    var state=String()
    var country=String()
    var pin=String()
    var email=String()
    var mob=String()
    var occupation=String()
    var dob=String()
    var name=String()
    var pan=String()
    var annualIncome=String()
    var nom1Percent=String()
    var nom1Name=String()
    var nom2Name=String()
    var nom2Relation=String()
    var nom2Dob=String()
    var nom2Share=String()
    var nom3Name=String()
    var nom3Relation=String()
    var nom3Dob=String()
    var nom3Share=String()
    var responseData=String()
    var branch=String()
    var controllerName=String()
    var politicallyExposed=String()
    var taxCountry1=String()
    var taxCountry2=String()
    var taxCountry3=String()
    var idNo1=String()
    var idNo2=String()
    var idNo3=String()
    var idType1=String()
    var idType2=String()
    var idType3=String()

    @IBOutlet weak var signatureView: YPDrawSignatureView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        addNav()
        clearBtn = PressableButton(frame: CGRect(x:20,y:dimensions.SCREEN_HEIGHT-134,width:dimensions.SCREEN_WIDTH/2-30,height:50))
        clearBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        clearBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        clearBtn.setTitle("CLEAR", for: .normal)
        clearBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        clearBtn.shadowHeight = 3
        clearBtn.addTarget(self, action: #selector(DigitalSignatureVC.clearSignature(_:)), for: .touchUpInside)
        clearBtn.cornerRadius = 5
        
        saveBtn = PressableButton(frame: CGRect(x:dimensions.SCREEN_WIDTH/2+10,y:dimensions.SCREEN_HEIGHT-134,width:dimensions.SCREEN_WIDTH/2-30,height:50))
        saveBtn.colors = .init(button: colors.APP_THEME_COLOR, shadow: colors.APP_THEME_COLOR)
        saveBtn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        saveBtn.setTitle("SAVE", for: .normal)
        saveBtn.setTitleColor(colors.BUTTON_COLOR, for: .normal)
        saveBtn.shadowHeight = 3
        saveBtn.addTarget(self, action: #selector(DigitalSignatureVC.saveSignature(_:)), for: .touchUpInside)
        saveBtn.cornerRadius = 5
                
        view.addSubview(clearBtn)
        view.addSubview(saveBtn)

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
    func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(controllerName == "Fatca"){
            UserDefaults.standard.removeObject(forKey: "FirstNomineeName")
            UserDefaults.standard.removeObject(forKey: "FirstNomineeDob")
            UserDefaults.standard.removeObject(forKey: "FirstNomineeShare")
            UserDefaults.standard.removeObject(forKey: "FirstNomineeRelation")
            UserDefaults.standard.removeObject(forKey: "SecondNomineeName")
            UserDefaults.standard.removeObject(forKey: "SecondNomineeDob")
            UserDefaults.standard.removeObject(forKey: "SecondNomineeShare")
            UserDefaults.standard.removeObject(forKey: "SecondNomineeRelation")
            UserDefaults.standard.removeObject(forKey: "ThirdNomineeName")
            UserDefaults.standard.removeObject(forKey: "ThirdNomineeDob")
            UserDefaults.standard.removeObject(forKey: "ThirdNomineeShare")
            UserDefaults.standard.removeObject(forKey: "ThirdNomineeRelation")
        }
        else {
            UserDefaults.standard.removeObject(forKey: "FirstTaxCountry")
            UserDefaults.standard.removeObject(forKey: "FirstIdNo")
            UserDefaults.standard.removeObject(forKey: "FirstIdType")
            UserDefaults.standard.removeObject(forKey: "SecondTaxCountry")
            UserDefaults.standard.removeObject(forKey: "SecondIdNo")
            UserDefaults.standard.removeObject(forKey: "SecondIdType")
            UserDefaults.standard.removeObject(forKey: "ThirdTaxCountry")
            UserDefaults.standard.removeObject(forKey: "ThirdIdNo")
            UserDefaults.standard.removeObject(forKey: "ThirdIdType")
            UserDefaults.standard.removeObject(forKey: "politicallyExposed")
        }
        
        bankName=""
        bankAddress=""
        accNo=""
        bankCity=""
        accType=""
        ifsc=""
        basicId=""
        aadhar=""
        address=""
        city=""
        state=""
        country=""
        pin=""
        email=""
        mob=""
        occupation=""
        dob=""
        name=""
        pan=""
        annualIncome=""
        nom1Percent=""
        nom1Name=""
        nom2Name=""
        nom2Relation=""
        nom2Dob=""
        nom2Share=""
        nom3Name=""
        nom3Relation=""
        nom3Dob=""
        nom3Share=""
        branch=""
        politicallyExposed=""
        taxCountry1=""
        taxCountry2=""
        taxCountry3=""
        idNo1=""
        idNo2=""
        idNo3=""
        idType1=""
        idType2=""
        idType3=""
        
        if UserDefaults.standard.value(forKey: "BankName") != nil{
            bankName=FinCartUserDefaults.sharedInstance.retrieveBankName()
        }
        if UserDefaults.standard.value(forKey: "BankAddress") != nil{
            bankAddress=FinCartUserDefaults.sharedInstance.retrieveBankAddress()
        }
        if UserDefaults.standard.value(forKey: "AccountNo") != nil{
            accNo=FinCartUserDefaults.sharedInstance.retrieveAccountNo()
        }
        if UserDefaults.standard.value(forKey: "BankCity") != nil{
            bankCity=FinCartUserDefaults.sharedInstance.retrieveBankCity()
        }
        if UserDefaults.standard.value(forKey: "AccountType") != nil{
            accType=FinCartUserDefaults.sharedInstance.retrieveAccountTypeKey()
        }
        if UserDefaults.standard.value(forKey: "Ifsc") != nil{
            ifsc=FinCartUserDefaults.sharedInstance.retrieveIfsc()
        }
        if UserDefaults.standard.value(forKey: "BasicId") != nil{
            basicId=FinCartUserDefaults.sharedInstance.retrieveBasicId()!
        }
        if UserDefaults.standard.value(forKey: "Aadhar") != nil{
            aadhar=FinCartUserDefaults.sharedInstance.retrieveAadhar()
        }
        if UserDefaults.standard.value(forKey: "Address") != nil{
            address=FinCartUserDefaults.sharedInstance.retrieveAddress()
        }
        if UserDefaults.standard.value(forKey: "City") != nil{
            city=FinCartUserDefaults.sharedInstance.retrieveCity()
        }
        if UserDefaults.standard.value(forKey: "State") != nil{
            state=FinCartUserDefaults.sharedInstance.retrieveState()
        }
        if UserDefaults.standard.value(forKey: "NriCountry") != nil{
            if FinCartUserDefaults.sharedInstance.retrieveNriCountry() == "Country"{
                country=""
            }
            else {
                country=FinCartUserDefaults.sharedInstance.retrieveNriCountry()
            }            
        }
        if UserDefaults.standard.value(forKey: "Pincode") != nil{
            pin=FinCartUserDefaults.sharedInstance.retrievePincode()
        }
        if UserDefaults.standard.value(forKey: "username") != nil{
            email=FinCartUserDefaults.sharedInstance.retrieveUserName()!
        }
        if UserDefaults.standard.value(forKey: "Mobile") != nil{
            mob=FinCartUserDefaults.sharedInstance.retrieveMobile()!
        }
        if UserDefaults.standard.value(forKey: "Occupation") != nil{
            occupation=FinCartUserDefaults.sharedInstance.retrieveOccupationKey()
        }
        if UserDefaults.standard.value(forKey: "Dob") != nil{
            dob=FinCartUserDefaults.sharedInstance.retrieveDob()
        }
        if UserDefaults.standard.value(forKey: "Name") != nil{
            name=FinCartUserDefaults.sharedInstance.retrieveName()
        }
        if UserDefaults.standard.value(forKey: "Pan") != nil{
            pan=FinCartUserDefaults.sharedInstance.retrievePan()
        }
        if UserDefaults.standard.value(forKey: "Income") != nil{
            annualIncome=FinCartUserDefaults.sharedInstance.retrieveAnnualIncomeKey()
        }
        if UserDefaults.standard.value(forKey: "FirstNomineeShare") != nil{
            nom1Percent=FinCartUserDefaults.sharedInstance.retrieveFirstNomineeShare()
        }
        if UserDefaults.standard.value(forKey: "FirstNomineeName") != nil{
            nom1Name=FinCartUserDefaults.sharedInstance.retrieveFirstNomineeName()
        }
        if UserDefaults.standard.value(forKey: "SecondNomineeName") != nil{
            nom2Name=FinCartUserDefaults.sharedInstance.retrieveSecondNomineeName()
        }
        if UserDefaults.standard.value(forKey: "SecondNomineeRelation") != nil{
            nom2Relation=FinCartUserDefaults.sharedInstance.retrieveSecondNomineeRelation()
        }
        if UserDefaults.standard.value(forKey: "SecondNomineeDob") != nil{
            nom2Dob=FinCartUserDefaults.sharedInstance.retrieveSecondNomineeDob()
        }
        if UserDefaults.standard.value(forKey: "SecondNomineeShare") != nil{
            nom2Share=FinCartUserDefaults.sharedInstance.retrieveSecondNomineeShare()
        }
        if UserDefaults.standard.value(forKey: "ThirdNomineeName") != nil{
            nom3Name=FinCartUserDefaults.sharedInstance.retrieveThirdNomineeName()
        }
        if UserDefaults.standard.value(forKey: "ThirdNomineeShare") != nil{
            nom3Share=FinCartUserDefaults.sharedInstance.retrieveThirdNomineeShare()
        }
        if UserDefaults.standard.value(forKey: "ThirdNomineeRelation") != nil{
            nom3Relation=FinCartUserDefaults.sharedInstance.retrieveThirdNomineeRelation()
        }
        if UserDefaults.standard.value(forKey: "ThirdNomineeDob") != nil{
            nom3Dob=FinCartUserDefaults.sharedInstance.retrieveThirdNomineeDob()
        }
        if UserDefaults.standard.value(forKey: "Branch") != nil{
            branch=FinCartUserDefaults.sharedInstance.retrieveBranch()
        }
        if UserDefaults.standard.value(forKey: "PoliticallyExposed") != nil{
            politicallyExposed=FinCartUserDefaults.sharedInstance.retrievePoliticallyExposedKey()
        }
        if UserDefaults.standard.value(forKey: "FirstTaxCountry") != nil{
            taxCountry1=FinCartUserDefaults.sharedInstance.retrieveFirstTaxCountry()
        }
        if UserDefaults.standard.value(forKey: "FirstIdNo") != nil{
            idNo1=FinCartUserDefaults.sharedInstance.retrieveFirstIdNo()
        }
        if UserDefaults.standard.value(forKey: "FirstIdType") != nil{
            idType1=FinCartUserDefaults.sharedInstance.retrieveFirstIdType()
        }
        if UserDefaults.standard.value(forKey: "SecondTaxCountry") != nil{
            taxCountry2=FinCartUserDefaults.sharedInstance.retrieveSecondTaxCountry()
        }
        if UserDefaults.standard.value(forKey: "SecondIdNo") != nil{
            idNo2=FinCartUserDefaults.sharedInstance.retrieveSecondIdNo()
        }
        if UserDefaults.standard.value(forKey: "SecondIdType") != nil{
            idType2=FinCartUserDefaults.sharedInstance.retrieveSecondIdType()
        }
        if UserDefaults.standard.value(forKey: "ThirdTaxCountry") != nil{
            taxCountry3=FinCartUserDefaults.sharedInstance.retrieveThirdTaxCountry()
        }
        if UserDefaults.standard.value(forKey: "ThirdIdNo") != nil{
            idNo3=FinCartUserDefaults.sharedInstance.retrieveThirdIdNo()
        }
        if UserDefaults.standard.value(forKey: "ThirdIdType") != nil{
            idType3=FinCartUserDefaults.sharedInstance.retrieveThirdIdType()
        }
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clearSignature(_ sender: UIButton) {
        self.signatureView.clear()
    }
    
    @objc func saveSignature(_ sender: UIButton) {
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: "Uploading...")
        if let signatureImage = self.signatureView.getSignature(scale: 10) {
            
            UIImageWriteToSavedPhotosAlbum(signatureImage, nil, nil, nil)
            
            saveImageDocumentDirectory(image: signatureImage)
            getImage()
            
        }
    }
    func saveImageDocumentDirectory(image : UIImage){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("signature.png")
        let image = image
        
        let imageData = UIImageJPEGRepresentation(image, 1)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
        
        self.uploadImage(image: image)
        
    }
    func uploadImage(image:UIImage){

        let urlString="\(FinCartMacros.kBaseUrl)\(FinCartMacros.kFinUploadSignature)\(String(describing: FinCartUserDefaults.sharedInstance.retrieveBasicId()))"

        let parameters=["Authorization":"Bearer \(String(describing: FinCartUserDefaults.sharedInstance.retrieveAccessToken()))",
            "Content-Type": "application/json"]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(UIImageJPEGRepresentation(image, 0.5)!, withName: "photo_path", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to:urlString,headers:["Authorization": "Bearer \(String(describing: FinCartUserDefaults.sharedInstance.retrieveAccessToken()))"])
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                    
                })
                
                upload.responseJSON { response in
                    print("success")
                    print(response)   // result of response serialization
                    self.appFullSave()
                    
                }
                
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                SVProgressHUD.dismiss()
                self.utils.popUp(title: "", message: "Image upload failed.")
                self.present(self.utils.popup, animated: true, completion: nil)
                print(encodingError)
            }
        }
    }
    
    func appFullSave(){
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show(withStatus: "Saving data...")
        
        let urlString="\(FinCartMacros.kBaseUrl)\(FinCartMacros.kFinAppFullSave)"

        let param:[String:String]=["Bank_name":bankName,
                                   "Bank_Address" :bankAddress,
                                   "Acc_No":accNo,
                                   "Bankcity":bankCity,
                                   "Branch":branch,
                                   "Acc_Type":accType,
                                   "IFSC":ifsc,
                                   "basicId":basicId,
                                   "aadhar":aadhar,
                                   "CAFStatus":"",
                                   "FatcaStatus":"",
                                   "Address1":address,
                                   "City":city,
                                   "State":state,
                                   "Country":country,
                                   "Pin":pin,
                                   "Email":email,
                                   "Mobile":mob,
                                   "Occupation":occupation,
                                   "Date_of_Birth":dob,
                                   "Guardname":name,
                                   "Guardpan":pan,
                                   "AnnIncome":annualIncome,
                                   "Nom1_percent":nom1Percent,
                                   "Nom1_guardname":nom1Name,
                                   "Nom2_name":nom2Name,
                                   "Nom2_relation":nom2Relation,
                                   "Nom2_dob":nom2Dob,
                                   "Nom2_percent":nom2Share,
                                   "Nom3_Name":nom3Name,
                                   "Nom3_Relation":nom3Relation,
                                   "Nom3_Dob":nom3Dob,
                                   "Nom3_Percent":nom3Share,
                                   "kycStatus":"Y",
                                   "Pol_Exp_Person":politicallyExposed,
                                   "Country_Tax_Res1":taxCountry1,
                                   "CountryPayer_Id_no":idNo1,
                                   "Idenif_Type":idType1,
                                   "Country_Tax_Res2":taxCountry2,
                                   "CountryPayer_Id_no2":idNo2,
                                   "Idenif_Type2":idType2,
                                   "Country_Tax_Res3":taxCountry3,
                                   "CountryPayer_Id_no3":idNo3,
                                   "Idenif_Type3":idType3
        ]
        print(param)
        let headers=["Authorization":"Bearer \(String(describing: FinCartUserDefaults.sharedInstance.retrieveAccessToken()))"]

        Alamofire.request(urlString, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).validate().responseJSON{
            response in

            if response.result.isSuccess {
                print(response.result.value!)
                SVProgressHUD.dismiss()
                self.signatureView.clear()
                let controller=self.storyboard?.instantiateViewController(withIdentifier: "FinCartKYCCheckVC") as! FinCartKYCCheckVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            else if response.result.isFailure{
                self.signatureView.clear()
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
                    
                    let controller=self.storyboard?.instantiateViewController(withIdentifier: "userLoginScreen") as! FinCartLoginVC
                    self.navigationController?.pushViewController(controller, animated: true)
                }
                popup.addButtons([buttonOne])
                self.present(popup, animated: true, completion: nil)
            }

        }
    }
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    func getImage(){
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent("signature.png")
        if fileManager.fileExists(atPath: imagePAth){
            //FinCartUserDefaults.sharedInstance.saveSignatureImg(imagePAth)
//            let signatureUserDefaults=UserDefaults.standard
//            signatureUserDefaults.set(imagePAth, forKey: "digitalSignature")
//            signatureUserDefaults.synchronize()
//
        }else{
            print("No Image")
        }
    }
   
}


