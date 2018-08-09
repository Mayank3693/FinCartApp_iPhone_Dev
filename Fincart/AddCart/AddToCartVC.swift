//
//  AddToCartVC.swift
//  HeyDJ
//
//  Created by Pankajr on 31/07/18.
//  Copyright © 2018 AppyPie. All rights reserved.
//

import UIKit
//import SwiftyJSON

class AddToCartVC: UIViewController,UITextFieldDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var investTF: UITextField!
    @IBOutlet var fromAccountTF: UITextField!
    @IBOutlet var mandateTF: UITextField!
    @IBOutlet var bankTF: UITextField!
    @IBOutlet var folioTF: UITextField!
    @IBOutlet var dividendTF: UITextField!
    @IBOutlet var sipTF: UITextField!
    @IBOutlet var sipTilTF: UITextField!
    @IBOutlet var amountMainView: UIView!
    @IBOutlet var amuntTF: UITextField!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var getAfterFifteenImg: UIImageView!
    @IBOutlet weak var getAfterFifteenLabel: UILabel!
    @IBOutlet weak var getAfterRs: UILabel!
    @IBOutlet weak var returnImg: UIImageView!
    @IBOutlet weak var returnLabel: UILabel!
    @IBOutlet weak var returnPercen: UILabel!
    @IBOutlet weak var riskImg: UIImageView!
    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var riskPrice: UILabel!
    
    var investArr  = [[String : Any]]()
    var accountArr = [[String : Any]]()
    var mandateArr = [[String : Any]]()
    var bankArr    = [[String : Any]]()
    var folioArr   = [[String : Any]]()
    var dividentArr = [[String : Any]]()
    var sipDateArr = [String]()
    let datePicker = UIDatePicker()
    var controller   =   String()
    var sipObjData   =   [String : Any]()
    var sipArrObj    =   [String : Any]()
    var sipTill      =   [[String : Any]]()
    var amount : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  investArr = ["a","b","c"]
      //  accountArr = ["d","e","f"]
      //  mandateArr = ["g","h","i"]
     //   bankArr = ["j","k","l"]
     //   folioArr = ["m","n","o"]
     //   dividentArr = ["p","q","r"]
        sipDateArr = ["s","t","u"]
    //    sipTilArr = ["v","w","x"]
        
        amount = 1500
        amuntTF.text = String(amount)
        self.makeShadow(view: amountMainView)
        
        contentView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: contentView.frame.height)
        self.scrollView.addSubview(contentView)
        
        self.scrollView.contentSize = contentView.frame.size
        self.callGetSipApi(urlStr: FinCartMacros.kInvestAs ,apiName: "InvestAs")
        // Do any additional setup after loading the view.
    }
    
    func setsipTillArray(){
        var sipVal   =  0.5
        for i in 1...99 {
            sipVal   =  sipVal + 0.5
            let devidentDic  : [String : Any]  =   [ "sipTill" : "\(sipVal) Years"]
            self.sipTill.append(devidentDic)
        }
        print(sipTill)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
          NotificationCenter.default.addObserver(self, selector: #selector(self.updateValue(_:)), name: NSNotification.Name(rawValue: kSearchPickerData), object: nil)
        self.setsipTillArray()
        self.setData()
    }
    
    func setData(){
        self.getAfterFifteenLabel.text   =  "After \(self.sipObjData["Duration"] as? String ?? "") years you will get"
        self.getAfterRs.text             =  self.sipObjData["Amount"] as? String ?? ""
        self.headerLabel.text            =  self.sipArrObj["SchName"] as? String ?? ""
        self.returnPercen.text            =   "\(self.convertValue(amount: self.sipArrObj["ReturnYear1"] as? String ?? "0")) %"
        if self.sipArrObj["Type"] as? String ?? "" == "G" {
            let devidentDic  : [String : Any]  =   [ "dividend" : "N/A"]
            self.dividentArr.append(devidentDic)
        }else{
            let devidentDic  : [String : Any]  =   [ "dividend" : "Re-Invest"]
            let dictionaryB = [
                "dividend" : "Payout"
                ]
            self.dividentArr.append(devidentDic)
            self.dividentArr.append(dictionaryB)
        }
    }
    
    func convertValue(amount : String)-> Int{
        let amountFloat : Float? = Float(amount)
        let amountInt : Int?  =  Int(amountFloat!)
        return amountInt ?? 0
    }
    
    //MARK:-  Notification Center observer  
    @objc func updateValue(_ notification: NSNotification) {
        
        
        //        case Invest_TF_Tag = 1
        //        case Account_TF_Tag = 2
        //        case Mandate_TF_Tag = 3
        //        case Bank_TF_Tag = 4
        //        case Folio_TF_Tag = 5
        //        case Divident_TF_Tag = 6
        //        case SipDate_TF_Tag = 7
        //        case SipDate_TF_Tag = 8
        
        if let data = notification.userInfo{
            
            if let index = data["indexTag"] as? Int {
                
                switch Int(index){
                    
                case TextFieldTag(rawValue: TextFieldTag.Invest_TF_Tag.rawValue)!.rawValue:
                    investTF.text = data["dataField"] as? String
                    break
                    
                case TextFieldTag(rawValue: TextFieldTag.Account_TF_Tag.rawValue)!.rawValue:
                    fromAccountTF.text = data["dataField"] as? String
                    break
                    
                case TextFieldTag(rawValue: TextFieldTag.Mandate_TF_Tag.rawValue)!.rawValue:
                    mandateTF.text = data["dataField"] as? String
                    break
                    
                    
                case TextFieldTag(rawValue: TextFieldTag.Bank_TF_Tag.rawValue)!.rawValue:
                    bankTF.text = data["dataField"] as? String
                    break
                case TextFieldTag(rawValue: TextFieldTag.Folio_TF_Tag.rawValue)!.rawValue:
                    folioTF.text = data["dataField"] as? String
                    break
                    
                case TextFieldTag(rawValue: TextFieldTag.Divident_TF_Tag.rawValue)!.rawValue:
                    dividendTF.text = (data["dataField"] as? String)
                    break
                    
                case TextFieldTag(rawValue: TextFieldTag.SipDate_TF_Tag.rawValue)!.rawValue:
                    sipTF.text = data["dataField"] as? String
                    break
                    
                    
                case TextFieldTag(rawValue: TextFieldTag.SipTill_TF_Tag.rawValue)!.rawValue:
                    sipTilTF.text = data["dataField"] as? String
                    break
                    
                default:
                    print("Default")
                    
                }
            }
        }
        
        print(notification.userInfo ?? "")
        
        
    }
    
    func callGetSipApi(urlStr : String,apiName : String){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.getQuickSipData(accessToken!,urlStr : urlStr, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        if let json = try? JSONSerialization.jsonObject(with: (data as! Data), options: JSONSerialization.ReadingOptions.allowFragments) as Any? {
                            if let jsonDict = json as? [[String: Any]] {
                                if apiName == "InvestAs"{
                                    self.investArr   =  jsonDict
                                    self.investTF.text = self.investArr.first!["username"] as? String ?? "N/A"
                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
                                        self.callGetSipApi(urlStr: FinCartMacros.kAccountList + "/\(memIddata[0]["memberId"] as! String)", apiName: "Account")
                                    }
                                }else if apiName == "Account"{
                                    self.accountArr   =  jsonDict
                                    
                                    self.fromAccountTF.text  =      "\(self.accountArr.first!["FirstApplicant"] as? String ?? "N/A") - Joint1 - \(self.accountArr.first!["SecondApplicant"] as? String ?? "N/A") - Joint2 - \(self.accountArr.first!["ThirdApplicant"] as? String ?? "N/A")"
                                    
                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
                                        self.callGetSipApi(urlStr: FinCartMacros.kMandateList + "/\(memIddata[0]["memberId"] as! String)/\(memIddata[0]["profileId"] as! String)/Y", apiName: "Mandate")
                                    }
                                    
                                    
                                }else if apiName == "Mandate"{
                                    self.mandateArr   =  jsonDict
                                    
                                    self.mandateTF.text =       "\(self.mandateArr.first!["MandateID"] as? String ?? "N/A")-\(self.mandateArr.first!["Bank"] as? String ?? "N/A")"
                                    
                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
                                        self.callGetSipApi(urlStr: FinCartMacros.kBankList + "/\(memIddata[0]["memberId"] as! String)", apiName: "Bank")
                                    }
                                    
                                }else if apiName == "Bank"{
                                    self.bankArr   =  jsonDict
                                    self.bankTF.text =     "\(self.bankArr.first!["Bank_Name"] as? String ?? "N/A") - \(self.bankArr.first!["Acc_no"] as? String ?? "N/A")"
                                    
                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
                                        self.callGetSipApi(urlStr: FinCartMacros.kFolioList + "/\(memIddata[0]["memberId"] as! String)/\(memIddata[0]["profileId"] as! String)/\(memIddata[0]["fundCode"] as! String)", apiName: "Folio")
                                    }
                                }else if apiName == "Folio"{
                                    self.folioArr   =  jsonDict
                                    self.folioTF.text =      self.folioArr.first!["FolioNo"] as? String ?? "N/A"
                                    
                                    self.dividendTF.text =  self.dividentArr.first!["dividend"] as? String ?? "N/A"
                                    
                                }else{
                                    
                                }
                            } else {
                                //                                if apiName == "MapList"{
                                //                                    self.goalView.isHidden    =  false
                                //                                    self.emptyView.isHidden   =  false
                                //                                    self.mapGoalBtn.isHidden  =  true
                                //                                    self.mapTableView.reloadData()
                                //                                }
                                print("Error in parsing")
                            }
                        }
                        else{
                            //                            if apiName == "MapList"{
                            //                                self.goalView.isHidden   =  false
                            //                                self.emptyView.isHidden   =  false
                            //                                self.mapTableView.reloadData()
                            //                            }
                            //SSCommonClass.ToastShowMessage(msg: "SERVER SIDE ERROR!",viewController: nil)
                            print("SERVER SIDE ERROR!")
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    //                    print("ahjdsgfge")
                    //                    if apiName == "MapList"{
                    //                        self.goalView.isHidden   =  false
                    //                        self.emptyView.isHidden   =  false
                    //                        self.mapTableView.reloadData()
                    //                    }
                    // self.refreshAccessToken("save")
                }else{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.alertController("Server Error", message: "Server is temporary available")
                    })
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    /*
    func saveQuickSipDetails(){
        FinCartMacros.showSVProgressHUD()
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        var detailsDictionary = Dictionary<String, String>()
        detailsDictionary.updateValue("", forKey: "GoalCode")
        detailsDictionary.updateValue("AAPP", forKey: "Device")
        detailsDictionary.updateValue("", forKey: "BrowserIp")
        detailsDictionary.updateValue(FinCartUserDefaults.sharedInstance.retrieveUserName()!, forKey: "CreatedByEmail")
        detailsDictionary.updateValue(FinCartUserDefaults.sharedInstance.retrieveMobile()!, forKey: "CreatedByMobile")
        detailsDictionary.updateValue("", forKey: "Desc")
        detailsDictionary.updateValue("", forKey: "AnswerType")
        detailsDictionary.updateValue("", forKey: "Device_Version")
        detailsDictionary.updateValue("", forKey: "BrowserId")
        detailsDictionary.updateValue("", forKey: "CreatedDatetime")
        detailsDictionary.updateValue("", forKey: "UpdatedByEmail")
        detailsDictionary.updateValue("", forKey: "UpdatedByMobile")
        detailsDictionary.updateValue("", forKey: "UpdatedDatetime")
        detailsDictionary.updateValue("", forKey: "Status")
        detailsDictionary.updateValue("", forKey: "Code")
        detailsDictionary.updateValue(answerString, forKey: "Answer")
        APIManager.sharedInstance.savePersonalInfoData(access_token!, personalDetails: detailsDictionary, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        
                        self.callReviewDataApi()
                    })
                }
                else
                {
                    SVProgressHUD.dismiss()
                    self.alertController("Error", message: "Something didn't go as expected")
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
 
 */
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    @objc func pickerToolBarAction(_ sender: Any) {
         self.view.endEditing(true)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == investTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (self.investArr as? [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.Invest_TF_Tag.rawValue)!, withVC: self)
        }
        else if textField == fromAccountTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (accountArr as?  [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.Account_TF_Tag.rawValue)!, withVC: self)
            //            if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
            //                self.callGetSipApi(urlStr: FinCartMacros.kMandateList + "/\(memIddata[0]["memberId"] as! String)/\(memIddata[0]["profileId"] as! String)/Y", apiName: "Mandate")
            //            }
        }
        else if textField == mandateTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (mandateArr as?  [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.Mandate_TF_Tag.rawValue)!, withVC: self)
            //            if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
            //                self.callGetSipApi(urlStr: FinCartMacros.kBankList + "/\(memIddata[0]["memberId"] as! String)", apiName: "Bank")
            //            }
        }
        else if textField == bankTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (bankArr as?  [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.Bank_TF_Tag.rawValue)!, withVC: self)
            //            if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
            //                self.callGetSipApi(urlStr: FinCartMacros.kFolioList + "/\(memIddata[0]["memberId"] as! String)/\(memIddata[0]["profileId"] as! String)/\(memIddata[0]["fundCode"] as! String)", apiName: "Folio")
            //            }
        }
        if textField == folioTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (folioArr as? [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.Folio_TF_Tag.rawValue)!, withVC: self)
            
        }
        else if textField == dividendTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (dividentArr as?  [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.Divident_TF_Tag.rawValue)!, withVC: self)
            
        }
        else if textField == sipTF {
            setUpDatePicker()
            
        }
        else if textField == sipTilTF {
            CommonPicker.sharedInstance.myPickerViewSetup(textField: textField, withArray: (sipTill as?  [[String : Any]])! , andTextFieldIndex: TextFieldTag(rawValue: TextFieldTag.SipTill_TF_Tag.rawValue)!, withVC: self)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    func setUpDatePicker() {
        
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
      
      
        let toolBar = self.addToolBar()
        sipTF.inputView = datePicker
        sipTF.inputAccessoryView = toolBar
        
    }
    
    func addToolBar() -> UIToolbar {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        toolBar.barStyle = .default
        toolBar.barTintColor = UIColor.darkGray
        let barButtonDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerToolBarAction))
        
        toolBar.items = [barButtonDone]
        barButtonDone.tintColor = UIColor.white
        return toolBar
    }

    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        sipTF.text = formatter.string(from: sender.date)
        print(sender.date)
    }

    @IBAction func plusBtnAction(_ sender: Any) {
        
            amount = amount + 500
            amuntTF.text = String(amount)
            
        
        
    }
    @IBAction func minusBtnAction(_ sender: Any) {
        if(amount > 1500){
            amount = amount - 500
            amuntTF.text = String(amount)
            
        }
    }
    
    func makeShadow(view : UIView) {
        let shadowPath = UIBezierPath(rect: view.bounds)
       view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowPath = shadowPath.cgPath
    }
    
}


@IBDesignable class BorderView : UIView {
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
