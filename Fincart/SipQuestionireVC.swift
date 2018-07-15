//
//  SipQuestionireVC.swift
//  Fincart
//
//  Created by mayank on 27/06/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class SipQuestionireVC: FinCartViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var investmentDetailsView: UIView!
    @IBOutlet weak var durationDescriptionView: UIView!
    @IBOutlet weak var sipName: UITextField!
    
    @IBOutlet weak var amountDescriptionLabel: UILabel!
    @IBOutlet weak var amountDescriptionImageView: UIImageView!
    @IBOutlet weak var subtractImageView: UIImageView!
    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var amountSignLabel: UILabel!
    @IBOutlet weak var amountDetailsTextField: UITextField!
    @IBOutlet weak var durationDescriptionImageView: UIImageView!
    @IBOutlet weak var durationDescriptionLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var amountSubView: UIView!
    
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var maturityAmount: UITextField!
    
    @IBOutlet weak var maturityView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var userGoalStatusServiceResponseValue: UserGoalStatusServiceResponseElement?
    var userserviceResponse  :  UserGoalStatusServiceResponse!
    var firstLoad = true
    var activeTextField: UITextField?
    var jsonFileName : String?
    var yesCount: Int?
    var income         =  String()
    var AgeDuration    =  String()
    var userInfoData: UserInfoData?
    
    var jsonObject : JsonBase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        self.income  =  "15000"
        self.AgeDuration    =  "15"
        userInfoData = UserInfoData()
        userInfoData?.name = finCartUserDefaults.retrieveUserFullName()
        parseJSON()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardNotificationObserver(addObserver: true)
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        durationSlider.addTarget(self, action: #selector(sliderEndedTracking), for: UIControlEvents.touchUpInside)
        durationSlider.addTarget(self, action: #selector(sliderEndedTracking), for: UIControlEvents.touchUpOutside)
        investmentDetailsView.layer.cornerRadius = 8
        investmentDetailsView.clipsToBounds = true
        durationDescriptionView.layer.cornerRadius = 8
        durationDescriptionView.clipsToBounds = true
//        if self.view.frame.width < 375{
//            goalImageWidthConstraint.constant = 90
//        }else if self.view.frame.width < 414{
//            goalImageWidthConstraint.constant = 105
//        }
        durationSlider.minimumValue = 1
        durationSlider.maximumValue = 100
        durationDescriptionLabel.text = "Duration Age"
        self.scrollView?.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height - 50)
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: amountSubView.frame.height - 1, width: amountSubView.frame.width, height: 1)
        amountSubView.layer.addSublayer(border)
        setDataForGoalEdit()
    }
    
    private func parseJSON() {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    // Decode data to object
                    let jsonDecoder = JSONDecoder()
                    jsonObject = try jsonDecoder.decode(JsonBase.self, from: jsonData as Data)
                }
                catch {
                }
            } catch {}
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        containerViewHeightConstraint.constant = maturityView.frame.origin.y + durationDescriptionView.frame.height + 50
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARKS:- UITEXTFIELDDELEGATE METHODS
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        //TO-DO
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == amountDetailsTextField{
            amountDetailsTextField.resignFirstResponder()
            var investAmount = Int(amountDetailsTextField.text!)
            if investAmount! < 500{
                investAmount = 500
            }else if investAmount! > 5000000{
                investAmount = 5000000
            }else{
                investAmount = investAmount! - 500
            }
            self.income   =  String(format: "%d", investAmount!)
            calculateGetAmount("SLIDER")
            setDataForGoalEdit()
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //TO-DO
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //TO-DO
    }
    
    //MARKS:- TOUCH UP ACTION
   
    @IBAction func selectDurationValue(_ sender: UISlider) {
        durationSlider.setValue(Float(Int(sender.value)), animated: true)
        durationValueLabel.text = Int(sender.value) == 1 ? String(format : "%d Year", Int(sender.value)) : String(format : "%d Years", Int(sender.value))
//        if (userGoalStatusServiceResponseElement?.goalCode)!.caseInsensitiveCompare(FincartCommon.GOAL_RETIRE) == ComparisonResult.orderedSame{
//            let goalTime = Int(sender.value) -  Int((userGoalStatusServiceResponseElement?.userCurrentAge)!)!
//            userGoalStatusServiceResponseElement?.goaltime = String(format : "%d", goalTime)
//
//        }else if(userGoalStatusServiceResponseElement?.goalCode)!.caseInsensitiveCompare(FincartCommon.GOAL_TIME_OFF) == ComparisonResult.orderedSame{
//            userGoalStatusServiceResponseElement?.sabbaticalStartTime = String(format : "%d", Int(sender.value))
//        }else{
//            userGoalStatusServiceResponseElement?.goaltime = String(format : "%d", Int(sender.value))
//        }
    }
    
    @objc func sliderEndedTracking(slider: UISlider!) {
        calculateGetAmount("SLIDER")
        setDataForGoalEdit()
    }
    
    // MARK:- KEYBOARD NOTIFICATIONS
    func addKeyboardNotificationObserver(addObserver : Bool){
        if addObserver {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            
            //keyboard register
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        }
        else{
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        }
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        let contentInsets: UIEdgeInsets! = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0)
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
        var aRect : CGRect! = self.view.frame
        aRect.size.height -= keyboardFrame.size.height;
        if (!aRect.contains(CGPoint(x : 0, y : (activeTextField?.frame.maxY)!))) {
            self.scrollView.scrollRectToVisible((activeTextField?.frame)!, animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInsets: UIEdgeInsets! = UIEdgeInsets.zero
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentInset = contentInsets
            var investAmount = Int(self.income)
            if investAmount! < 500{
                investAmount! = 500
            }else if investAmount! > 5000000{
                investAmount! = 5000000
            }
            self.income = String(format: "%d", investAmount!)
            self.calculateGetAmount("SLIDER")
            self.setDataForGoalEdit()
        }
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    //MARKS:- DISMISS KEYBOARD
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }

    //MARKS:- PRIVATE METHODS
    private func setDataForGoalEdit(){
//        goalDescriptionLabel.text = (userGoalStatusServiceResponseElement?.goalName)! + " Achieved :" + (userGoalStatusServiceResponseElement?.goalAchieved)! + " %"
        amountSignLabel.text = "\u{20B9}"
        amountDetailsTextField.text = "\(self.income)" //        if userGoalStatusServiceResponseElement?.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
//            monthlyModeOfInvestment.isSelected = true
//        }else{
//            oneTimeModeOfInvestment.isSelected = true
//        }
//        if userGoalStatusServiceResponseElement?.risk?.caseInsensitiveCompare("L") == ComparisonResult.orderedSame{
//            lowRiskType.isSelected = true
//        }else if userGoalStatusServiceResponseElement?.risk?.caseInsensitiveCompare("M") == ComparisonResult.orderedSame{
//            mediumRiskType.isSelected = true
//        }else{
//            highRiskType.isSelected = true
//        }
        setAmountAndDuration()
    }
//
    
    @IBAction func decreaseBtn(_ sender: Any) {
//        if  Int(self.income)! > 500{
//            var income   = Int()
//            self.income  = "\(Int(self.income) - 500)"
//            self.addKeyboardNotificationObserver(addObserver: true)
//
//        }
        
        var investAmount = Int(amountDetailsTextField.text!)
        if investAmount! < 500{
            investAmount = 500
        }else if investAmount! > 5000000{
            investAmount = 5000000
        }else{
            investAmount = investAmount! - 1000
        }
        self.income   =  String(format: "%d", investAmount!)
        calculateGetAmount("SLIDER")
        setDataForGoalEdit()
        
    }
    
    @IBAction func increaseBtn(_ sender: Any) {
        var investAmount = Int(amountDetailsTextField.text!)
        if investAmount! < 500{
            investAmount = 500
        }else if investAmount! > 5000000{
            investAmount = 5000000
        }else{
            investAmount = investAmount! + 1000
        }
        self.income   =  String(format: "%d", investAmount!)
        calculateGetAmount("SLIDER")
        setDataForGoalEdit()
    }
    
    @IBAction func saveTransactBtn(_ sender: Any) {
        self.savePersonalDetails()
        
    }
    
    func callReviewDataApi(){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.reviewTaggedGoals(accessToken!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
                    if let StringResponse = String(data: data! as! Data, encoding: String.Encoding.utf8) as String? {
                        DispatchQueue.main.async(execute: {
                            SVProgressHUD.dismiss()
                            print(StringResponse)
                            do{
                                self.userserviceResponse  = try UserGoalStatusServiceResponse(StringResponse)
                                let isQuickSip  = UserDefaults.standard.value(forKey: "IsQuickSip") as! Int
                                if isQuickSip == 1{
                                    self.callSingleSaveApi()
                                }else{
                                    self.callSaveApi()
                                }
                                //goalsReviewModel = try GoalsReview(jsonString)
                            }catch{}
                            
                        })
                    }
                }
                else if httpResponse.statusCode == 401{
                    self.alertController("Server Issue", message: "Server is not responding")
                    //self.refreshAccessToken("reviewTaggedQuestion")
                }
            }
            else{
                DispatchQueue.main.async(execute: {
                    SVProgressHUD.dismiss()
                    self.alertController("Server Issue", message: "Server is not responding")
                })
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    // Mayank Comitted
    
    func callSingleSaveApi(){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.saveSingleQuickSipData(accessToken!,urlStr : FinCartMacros.kSaveSingleGoalURL, goalReviewData: self.userserviceResponse[0], success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        
                        let sipList: SipListVC! = self.storyboard?.instantiateViewController(withIdentifier: "SipListVC") as! SipListVC
                        self.navigationController?.pushViewController(sipList, animated: true)
//                        self.appDelegate.showDashboardScreen()
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
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
   
    func callSaveApi(){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.saveQuickSipData(accessToken!, urlStr: FinCartMacros.kSaveReviewURL, goalReviewData: self.userserviceResponse, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.appDelegate.showDashboardScreen()
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
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
    
    func saveQuickSipDetails(){
        FinCartMacros.showSVProgressHUD()
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        var answerString = "FG220~FQ38~~" + (self.sipName.text)!
        answerString += "|" + "FG220~FQ39~" + (self.maturityAmount.text)!
        answerString += "|" + "FG220~FQ40~" + (self.AgeDuration)
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
                        SVProgressHUD.dismiss()
                        self.callReviewDataApi()
                    })
                }
                else
                {
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
    
    private func savePersonalDetails(){
        FinCartMacros.showSVProgressHUD()
        let access_token  = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        let monthlyIncome = 50000.0
//        let monthlyIncome = Double((userInfoData?.monthlySalary)!)
        let annualIncome = String(format:"%.0f", monthlyIncome * 12)
        var answerString = "C5~FQ1~" + (userInfoData?.name)!
        answerString += "|" + "C5~FQ2~" + (userInfoData?.age ?? "25")
        
        answerString += "|" + "C5~FQ3~" + (userInfoData?.genderStatusCode ?? "001")
        answerString += "|" + "C5~FQ4~" + (userInfoData?.martialStatusCode ?? "001")
        answerString += "|" + "C5~FQ6~" + String(format: "%d", (userInfoData?.childsCount ?? 0))

        answerString += "|" + "C5~FQ10~" + annualIncome
        answerString += "|" + "C5~FQ11~" + (userInfoData?.monthlyExpense ?? "10000")
        var detailsDictionary = Dictionary<String, String>()
        detailsDictionary.updateValue("", forKey: "ID")
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
                        SVProgressHUD.dismiss()
                        self.saveQuickSipDetails()
                    })
                }
                else
                {
                    self.refreshAccessToken()
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
            if responseCode == 200{
                self.savePersonalDetails()
            }else{
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
            if responseCode == 200{
                self.savePersonalDetails()
            }else{
                DispatchQueue.main.async(execute: {
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
    
    
   
    
    
    private func setAmountAndDuration(){
        var goalTime: Int?
        var goalsDetail: String?
        goalTime = Int(self.AgeDuration)
//            let userCurrentAge = Int(self.AgeDuration)!
//            durationSlider.minimumValue = Float(userCurrentAge < 40 ? 40 : userCurrentAge)
//            durationSlider.maximumValue = 70
//            goalsDetail = String(format: "You will get \u{20B9} %d when you are %d years old", self.income, goalTime!)
        
//        if firstLoad{
//            let height = FincartCommon.calculateHeightForLabel(goalsDetail!, width: self.view.frame.width - 48, font: UIFont.systemFont(ofSize: 15))
//           // goalsDetailsViewHeightConstraint.constant = goalsDetailsView.frame.height + (height - 30)
//            firstLoad = false
//        }
        durationValueLabel.text = String(format: "%d Years", goalTime!)
       // goalDetailsLabel.text = goalsDetail!
        durationSlider.setValue(Float(goalTime!), animated: true)
        //containerViewHeightConstraint.constant = durationDescriptionView.frame.origin.y + durationDescriptionView.frame.height + 10
    }
    private func calculateGetAmount(_ calculationType: String){
        let Age  = Int(self.durationSlider.value)
        self.AgeDuration  =  "\(Age)"
        let age  = Double(self.AgeDuration)
        let fundCalculationResult = FundCalculator.otherFund(0.0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: Double(self.income)!, years: age!, type: "R")
        print(fundCalculationResult)
        self.maturityAmount.text   =  String(fundCalculationResult.sip)
        self.income  =  "\(Int(fundCalculationResult.investmentSip))"//String(fundCalculationResult.investmentSip)
        //String(format: "%f", self.durationSlider.value)
        /*
        if calculationType.caseInsensitiveCompare("MODE") == ComparisonResult.orderedSame{
            if userGoalStatusServiceResponseElement?.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.BY_MONTHLY)
                userGoalStatusServiceResponseElement?.investAmount = String(format: "%.0f", calculatedResult.investmentSip)
            }else{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.BY_ONE_TIME)
                userGoalStatusServiceResponseElement?.investAmount = String(format: "%.0f", calculatedResult.investmentLumpsum)
            }
            self.income  =  String(fundCalculationResult.investmentSip)
            
        }else{
            if userGoalStatusServiceResponseElement?.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.SLIDER_CHANGE_BY_MONTHLY)
                userGoalStatusServiceResponseElement?.getAmount = String(format: "%.0f", calculatedResult.sip)
            }else{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.SLIDER_CHANGE_BY_ONETIME)
              //  let calculatedResult = FundCalculation.callMethodForCalculation(jsonObject, changeBy: FincartCommon.SLIDER_CHANGE_BY_ONETIME)
                userGoalStatusServiceResponseElement?.getAmount = String(format: "%.0f", calculatedResult.lumpsum)
            }
        }
 */
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return false
        }
        return true
    }

}
