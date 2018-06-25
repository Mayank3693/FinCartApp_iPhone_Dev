//
//  EditGoalsDetailsVC.swift
//  Fincart
//
//  Created by Kamal on 16/04/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import DLRadioButton

class EditGoalsDetailsVC: FinCartViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var goalsDetailsView: UIView!
    @IBOutlet weak var investmentDetailsView: UIView!
    @IBOutlet weak var modeOfInvestmentView: UIView!
    @IBOutlet weak var riskOfInvestmentView: UIView!
    @IBOutlet weak var durationDescriptionView: UIView!
    
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalDetailsLabel: UILabel!
    @IBOutlet weak var amountDescriptionLabel: UILabel!
    @IBOutlet weak var amountDescriptionImageView: UIImageView!
    @IBOutlet weak var subtractImageView: UIImageView!
    @IBOutlet weak var addImageView: UIImageView!
    @IBOutlet weak var amountSignLabel: UILabel!
    @IBOutlet weak var amountDetailsTextField: UITextField!
    @IBOutlet weak var modeOfInvestmentInageView: UIImageView!
    @IBOutlet weak var modeOfInvestmentDescriptionLabel: UILabel!
    @IBOutlet weak var riskOfInvestmentDescriptionImageView: UIImageView!
    @IBOutlet weak var riskOfInvestmentDescriptionLabel: UILabel!
    @IBOutlet weak var durationDescriptionImageView: UIImageView!
    @IBOutlet weak var durationDescriptionLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var oneTimeModeOfInvestment: DLRadioButton!
    @IBOutlet weak var monthlyModeOfInvestment: DLRadioButton!
    @IBOutlet weak var lowRiskType: DLRadioButton!
    @IBOutlet weak var mediumRiskType: DLRadioButton!
    @IBOutlet weak var highRiskType: DLRadioButton!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var amountSubView: UIView!
    
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var goalsDetailsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var goalImageWidthConstraint: NSLayoutConstraint!
    
    //Variable and Constants
    var userGoalStatusServiceResponseElement: UserGoalStatusServiceResponseElement?
    var firstLoad = true
    var activeTextField: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        let imageURL = userGoalStatusServiceResponseElement?.goalImage
        let url:URL! = URL(string: imageURL!)
        let task = URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async(execute: { () -> Void in
                        let img:UIImage! = UIImage(data: data)
                        self.goalImageView.image = img
                })
            }
        })
        task.resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardNotificationObserver(addObserver: true)
        
        lowRiskType.otherButtons = [mediumRiskType, highRiskType]
        
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        durationSlider.addTarget(self, action: #selector(sliderEndedTracking), for: UIControlEvents.touchUpInside)
        durationSlider.addTarget(self, action: #selector(sliderEndedTracking), for: UIControlEvents.touchUpOutside)
        goalsDetailsView.layer.cornerRadius = 8
        goalImageView.clipsToBounds = true
        investmentDetailsView.layer.cornerRadius = 8
        investmentDetailsView.clipsToBounds = true
        modeOfInvestmentView.layer.cornerRadius = 8
        modeOfInvestmentView.clipsToBounds = true
        riskOfInvestmentView.layer.cornerRadius = 8
        riskOfInvestmentView.clipsToBounds = true
        durationDescriptionView.layer.cornerRadius = 8
        durationDescriptionView.clipsToBounds = true
        if self.view.frame.width < 375{
            goalImageWidthConstraint.constant = 90
        }else if self.view.frame.width < 414{
            goalImageWidthConstraint.constant = 105
        }
        self.scrollView?.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height - 50)
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: amountSubView.frame.height - 1, width: amountSubView.frame.width, height: 1)
        amountSubView.layer.addSublayer(border)
        setDataForGoalEdit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        containerViewHeightConstraint.constant = durationDescriptionView.frame.origin.y + durationDescriptionView.frame.height + 10
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            userGoalStatusServiceResponseElement?.investAmount = String(format: "%d", investAmount!)
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
    @IBAction func selectModeOfInvestment(_ sender: DLRadioButton) {
        if sender.titleLabel?.text?.caseInsensitiveCompare("MONTHLY") == ComparisonResult.orderedSame{
            userGoalStatusServiceResponseElement?.investmentType = "S"
        }else{
            userGoalStatusServiceResponseElement?.investmentType = "L"
        }
        calculateGetAmount("MODE")
        setDataForGoalEdit()
    }
    
    @IBAction func selectRiskOfInvestment(_ sender: DLRadioButton) {
        if sender.titleLabel?.text?.caseInsensitiveCompare("LOW") == ComparisonResult.orderedSame{
            userGoalStatusServiceResponseElement?.risk = "L"
        }else if sender.titleLabel?.text?.caseInsensitiveCompare("MEDIUM") == ComparisonResult.orderedSame{
            userGoalStatusServiceResponseElement?.risk = "M"
        }else{
            userGoalStatusServiceResponseElement?.risk = "H"
        }
        setDataForGoalEdit()
    }
    
    @IBAction func selectDurationValue(_ sender: UISlider) {
        durationSlider.setValue(Float(Int(sender.value)), animated: true)
        durationValueLabel.text = Int(sender.value) == 1 ? String(format : "%d Year", Int(sender.value)) : String(format : "%d Years", Int(sender.value))
         if (userGoalStatusServiceResponseElement?.goalCode)!.caseInsensitiveCompare(FincartCommon.GOAL_RETIRE) == ComparisonResult.orderedSame{
            let goalTime = Int(sender.value) -  Int((userGoalStatusServiceResponseElement?.userCurrentAge)!)!
            userGoalStatusServiceResponseElement?.goaltime = String(format : "%d", goalTime)
            
        }else if(userGoalStatusServiceResponseElement?.goalCode)!.caseInsensitiveCompare(FincartCommon.GOAL_TIME_OFF) == ComparisonResult.orderedSame{
            userGoalStatusServiceResponseElement?.sabbaticalStartTime = String(format : "%d", Int(sender.value))
         }else{
            userGoalStatusServiceResponseElement?.goaltime = String(format : "%d", Int(sender.value))
        }
    }
    
    @IBAction func performUpdateAction(_ sender: UIButton) {
        FinCartMacros.showSVProgressHUD()
        hitAPIForGoalUpdate()
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
            var investAmount = Int(self.amountDetailsTextField.text!)
            if investAmount! < 500{
                investAmount = 500
            }else if investAmount! > 5000000{
                investAmount = 5000000
            }
            self.userGoalStatusServiceResponseElement?.investAmount = String(format: "%d", investAmount!)
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
        goalDescriptionLabel.text = (userGoalStatusServiceResponseElement?.goalName)! + " Achieved :" + (userGoalStatusServiceResponseElement?.goalAchieved)! + " %"
        amountSignLabel.text = "\u{20B9}"
        amountDetailsTextField.text = userGoalStatusServiceResponseElement?.investAmount
        if userGoalStatusServiceResponseElement?.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
            monthlyModeOfInvestment.isSelected = true
        }else{
            oneTimeModeOfInvestment.isSelected = true
        }
        if userGoalStatusServiceResponseElement?.risk?.caseInsensitiveCompare("L") == ComparisonResult.orderedSame{
            lowRiskType.isSelected = true
        }else if userGoalStatusServiceResponseElement?.risk?.caseInsensitiveCompare("M") == ComparisonResult.orderedSame{
            mediumRiskType.isSelected = true
        }else{
            highRiskType.isSelected = true
        }
        setAmountAndDuration()
    }
    
    private func setAmountAndDuration(){
        var goalTime: Int?
        var goalsDetail: String?
        durationSlider.minimumValue = 1
        durationSlider.maximumValue = 100
        if (userGoalStatusServiceResponseElement?.goalCode)!.caseInsensitiveCompare(FincartCommon.GOAL_RETIRE) == ComparisonResult.orderedSame{
            durationDescriptionLabel.text = "Retirement Age"
            goalTime = Int((userGoalStatusServiceResponseElement?.userCurrentAge)!)! +  Int((userGoalStatusServiceResponseElement?.goaltime)!)!
            let userCurrentAge = Int((userGoalStatusServiceResponseElement?.userCurrentAge)!)!
            durationSlider.minimumValue = Float(userCurrentAge < 40 ? 40 : userCurrentAge)
            durationSlider.maximumValue = 70
            goalsDetail = String(format: "You will get \u{20B9} %d when you are %d years old", (userGoalStatusServiceResponseElement?.getAmount)!, goalTime!)
        }else if (userGoalStatusServiceResponseElement?.goalCode)!.caseInsensitiveCompare(FincartCommon.GOAL_TIME_OFF) == ComparisonResult.orderedSame{
            durationDescriptionLabel.text = "Sabbatical Start Time"
            goalTime = Int((userGoalStatusServiceResponseElement?.sabbaticalStartTime)!)
            goalsDetail = String(format: "You will get \u{20B9} %d after %d years", (userGoalStatusServiceResponseElement?.getAmount)!, goalTime!)
        }else{
            durationDescriptionLabel.text = "Duration of investment"
            goalTime = Int((userGoalStatusServiceResponseElement?.goaltime)!)
            goalsDetail = String(format: "You will get \u{20B9} %d after %d years", (userGoalStatusServiceResponseElement?.getAmount)!, goalTime!)
        }
        if firstLoad{
            let height = FincartCommon.calculateHeightForLabel(goalsDetail!, width: self.view.frame.width - 48, font: UIFont.systemFont(ofSize: 15))
            goalsDetailsViewHeightConstraint.constant = goalsDetailsView.frame.height + (height - 30)
            firstLoad = false
        }
        durationValueLabel.text = String(format: "%d Years", goalTime!)
        goalDetailsLabel.text = goalsDetail!
        durationSlider.setValue(Float(goalTime!), animated: true)
        containerViewHeightConstraint.constant = durationDescriptionView.frame.origin.y + durationDescriptionView.frame.height + 10
    }
    
    private func calculateGetAmount(_ calculationType: String){
        if calculationType.caseInsensitiveCompare("MODE") == ComparisonResult.orderedSame{
            if userGoalStatusServiceResponseElement?.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.BY_MONTHLY)
                userGoalStatusServiceResponseElement?.investAmount = String(format: "%.0f", calculatedResult.investmentSip)
            }else{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.BY_ONE_TIME)
                userGoalStatusServiceResponseElement?.investAmount = String(format: "%.0f", calculatedResult.investmentLumpsum)
            }
        }else{
            if userGoalStatusServiceResponseElement?.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.SLIDER_CHANGE_BY_MONTHLY)
                userGoalStatusServiceResponseElement?.getAmount = String(format: "%.0f", calculatedResult.sip)
            }else{
                let calculatedResult = FundCalculation.callMethodForCalculation(userGoalStatusServiceResponseElement!, changeBy: FincartCommon.SLIDER_CHANGE_BY_ONETIME)
                userGoalStatusServiceResponseElement?.getAmount = String(format: "%.0f", calculatedResult.lumpsum)
            }
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return false
        }
        return true
    }
    
    //MARKS:- API SERVICES
    private func hitAPIForGoalUpdate(){
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.updateEditGoalDetails(access_token!, userGoalStatusServiceResponseElement: userGoalStatusServiceResponseElement!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 {
                    if let StringResponse = String(data: data! as! Data, encoding: String.Encoding.utf8) as String! {
                        print(StringResponse)
                    }
                }
            }
        }) { (error) in
            //
        }
    }
}
