//
//  CartVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 09/08/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class CartVC: FinCartViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var firstTF: UITextField!
    @IBOutlet var secondTF: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var oneTime     = [[String : Any]]()
    var monthly     = [[String : Any]]()
    var firstArr    = [[String : Any]]()
    var secondArr   = [[String : Any]]()
    var CartType    =  1
    var globalInvestIndex  = Int()
    var globalAccountIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//          firstArr = ["a","b","c"]
//          secondArr = ["d","e","f"]
          self.navigationItem.title="Cart"
      self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.white]
          self.callGetSipApi(urlStr: FinCartMacros.kInvestAs ,apiName: "InvestAs")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
           NotificationCenter.default.addObserver(self, selector: #selector(self.updateValue(_:)), name: NSNotification.Name(rawValue: kSearchPickerData2), object: nil)
        setUpBackButton()
        setupOpaqueNavigationBar()
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstTF {
            CommanPicker2.sharedInstance.myPickerViewSetup(textField: textField, withArray: (self.firstArr as? [[String : Any]])! , andTextFieldIndex: TextFieldTag2(rawValue: TextFieldTag2.First_TF_Tag.rawValue)!, withVC: self)
            if let memId  = self.firstArr[self.globalInvestIndex]["userid"] as? String{
                self.callGetSipApi(urlStr: FinCartMacros.kAccountList + "/\(memId)", apiName: "Account")
            }
        }
        else if textField == secondTF {
            CommanPicker2.sharedInstance.myPickerViewSetup(textField: textField, withArray: (self.secondArr as? [[String : Any]])! , andTextFieldIndex: TextFieldTag2(rawValue: TextFieldTag2.Second_TF_Tag.rawValue)!, withVC: self)
            if CartType == 1{
                if let memId  = self.firstArr[self.globalAccountIndex]["userid"] as? String{
                    self.callGetSipApi(urlStr: FinCartMacros.kOneTime + "/\(memId)" + "/\(self.secondArr[self.globalAccountIndex]["ProfileId"] as! String)", apiName: "oneTime")
                }
            }else{
                if let memId  = self.firstArr[self.globalAccountIndex]["userid"] as? String{
                    self.callGetSipApi(urlStr: FinCartMacros.kOneTime + "/\(memId)" + "/\(self.secondArr[self.globalAccountIndex]["ProfileId"] as! String)" + "Y", apiName: "oneTime")
                }
            }
                     }
        
    }
    
    @objc func pickerToolBarAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func oneTime(_ sender: Any) {
        self.CartType  =  1
        if let memId  = self.firstArr[self.globalAccountIndex]["userid"] as? String{
            self.callGetSipApi(urlStr: FinCartMacros.kOneTime + "/\(memId)" + "/\(self.secondArr[self.globalAccountIndex]["ProfileId"] as! String)", apiName: "oneTime")
        }
    }
    
    @IBAction func monthlyAct(_ sender: Any) {
        self.CartType  =  2
        if let memId  = self.firstArr[self.globalAccountIndex]["userid"] as? String{
            self.callGetSipApi(urlStr: FinCartMacros.kOneTime + "/\(memId)" + "/\(self.secondArr[self.globalAccountIndex]["ProfileId"] as! String)" + "Y", apiName: "oneTime")
        }
    }
    
    //MARK:-  Notification Center observer  
    @objc func updateValue(_ notification: NSNotification) {
        
        if let data = notification.userInfo{
            
            if let index = data["indexTag"] as? Int {
                
                switch Int(index){
                    
                case TextFieldTag2(rawValue: TextFieldTag2.First_TF_Tag.rawValue)!.rawValue:
                    self.globalInvestIndex  =   (data["InvestIndex"] as? Int)!
                    firstTF.text = data["dataField"] as? String
                    break
                    
                case TextFieldTag2(rawValue: TextFieldTag2.Second_TF_Tag.rawValue)!.rawValue:
                    self.globalAccountIndex  =  (data["AccountIndex"] as? Int)!
                    secondTF.text = data["dataField"] as? String
                    break
                    
                default:
                    print("Default")
                    
                }
            }
        }
        
        print(notification.userInfo ?? "")
        
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                                    self.firstArr   =  jsonDict
                                    self.firstTF.text = self.firstArr.first!["username"] as? String ?? "N/A"
                                    if let memId  = self.firstArr[0]["userid"] as? String{
                                        self.callGetSipApi(urlStr: FinCartMacros.kAccountList + "/\(memId)", apiName: "Account")
                                    }
//                                    }
                                }else if apiName == "Account"{
                                    self.secondArr   =  jsonDict
                                    self.secondTF.text  =      "\(self.secondArr.first!["FirstApplicant"] as? String ?? "N/A") - Joint1 - \(self.secondArr.first!["SecondApplicant"] as? String ?? "N/A") - Joint2 - \(self.secondArr.first!["ThirdApplicant"] as? String ?? "N/A")"
                                    if let memId  = self.firstArr[0]["userid"] as? String{
                                        self.callGetSipApi(urlStr: FinCartMacros.kOneTime + "/\(memId)" + "/\(self.secondArr[0]["ProfileId"] as! String)", apiName: "oneTime")
                                    }
//
//                                    self.fromAccountTF.text  =      "\(self.accountArr.first!["FirstApplicant"] as? String ?? "N/A") - Joint1 - \(self.accountArr.first!["SecondApplicant"] as? String ?? "N/A") - Joint2 - \(self.accountArr.first!["ThirdApplicant"] as? String ?? "N/A")"
//
//                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
//                                        self.callGetSipApi(urlStr: FinCartMacros.kMandateList + "/\(memIddata[0]["memberId"] as! String)/\(memIddata[0]["profileId"] as! String)/Y", apiName: "Mandate")
//                                    }
                                }else if apiName == "oneTime"{
                                    if self.CartType == 1{
                                       self.oneTime   =  jsonDict
                                    }else{
                                        self.monthly  =  jsonDict
                                    }
                                    
                                    self.tableView.reloadData()
//                                    if self.mandateArr.count>0{
//
//                                    }
//                                    self.mandateTF.text =       "\(self.mandateArr.first!["MandateID"] as? String ?? "N/A")-\(self.mandateArr.first!["Bank"] as? String ?? "N/A")"
//
//                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
//                                        self.callGetSipApi(urlStr: FinCartMacros.kBankList + "/\(memIddata[0]["memberId"] as! String)", apiName: "Bank")
//                                    }
                                    
                                }else if apiName == "Bank"{
//                                    self.bankArr   =  jsonDict
//                                    self.bankTF.text =     "\(self.bankArr.first!["Bank_Name"] as? String ?? "N/A") - \(self.bankArr.first!["Acc_no"] as? String ?? "N/A")"
//
//                                    if let memIddata : [[String : Any]] = self.sipObjData["UserGoalInvestmentData"] as? [[String : Any]]{
//                                        self.callGetSipApi(urlStr: FinCartMacros.kFolioList + "/\(memIddata[0]["memberId"] as! String)/\(memIddata[0]["profileId"] as! String)/\(memIddata[0]["fundCode"] as! String)", apiName: "Folio")
//                                    }
                                }else if apiName == "Folio"{
//                                    self.folioArr   =  jsonDict
//                                    self.folioTF.text =      self.folioArr.first!["FolioNo"] as? String ?? "N/A"
//
//                                    self.dividendTF.text =  self.dividentArr.first!["dividend"] as? String ?? "N/A"
                                    
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
                    print("ahjdsgfge")
                    self.refreshAccessToken()
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
    private func refreshAccessToken()
    {
        FincartCommon.refreshAccessToken(success: { (responseCode) in
            if responseCode != 200{
                self.getAccessToken()
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func getAccessToken()
    {
        FincartCommon.getAccessToken(success: { (responseCode) in
            if responseCode != 200{
                DispatchQueue.main.async(execute: {
                    SVProgressHUD.dismiss()
                    let alert = UIAlertController(title: "Session Expired", message: "Please login again. ", preferredStyle: UIAlertControllerStyle.alert)
                    let alertAction = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel) { (alertAction) in
                        alert.dismiss(animated: true)
                        FinCartUserDefaults.sharedInstance.saveAccessToken(nil)
                        FinCartUserDefaults.sharedInstance.saveRefershToken(nil)
                        FinCartUserDefaults.sharedInstance.saveTokenType(nil)
                        self.appDelegate.showLoginScreen()
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                })
                
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.CartType == 1{
            return self.oneTime.count
        }else{
            return self.monthly.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell   =  self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartCell
        if self.CartType == 1{
            cell.oneTimeView.isHidden   =   false
            cell.monthlyView.isHidden   =   true
            cell.oneTimeAmnt.text       =   "₹ \(self.oneTime[indexPath.row]["amount"] as? String ?? "1")"
            cell.oneTimeHeader.text     =   self.oneTime[indexPath.row]["Org_Scheme"] as? String ?? ""
        }else{
            cell.oneTimeView.isHidden   =   true
            cell.monthlyView.isHidden   =   false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.CartType == 1{
          return self.tableView.frame.size.height*0.3
        }else{
            return self.tableView.frame.size.height*0.45
        }
    }

}

protocol CartCellDelegate {
    func deleteOneTimeIndexData(index : Int)
    func deleteMonthlyTimeIndexData(index : Int)
}
class CartCell: UITableViewCell {
    var delegate : CartCellDelegate?
    @IBOutlet weak var oneTimeView: UIView!
    @IBOutlet weak var monthlyView: UIView!
    @IBOutlet weak var oneTimeAmnt: UILabel!
    @IBOutlet weak var oneTimeFolio: UILabel!
    @IBOutlet weak var monthlyAmnt: UILabel!
    @IBOutlet weak var monthlyFolio: UILabel!
    @IBOutlet weak var monStartDate: UILabel!
    @IBOutlet weak var monEndDate: UILabel!
    @IBOutlet weak var monthlyHeader: UILabel!
    @IBOutlet weak var oneTimeHeader: UILabel!
    override func awakeFromNib() {
        print("abcd")
    }
    @IBAction func oneTimeCross(_ sender: Any) {
        self.delegate?.deleteOneTimeIndexData(index: self.tag)
    }
    
    @IBAction func monthlyCrossBtn(_ sender: Any) {
        self.delegate?.deleteMonthlyTimeIndexData(index: self.tag)
    }
    
    
}
