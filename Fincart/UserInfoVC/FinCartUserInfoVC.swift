//
//  UserInfoViewController.swift
//  Fincart
//
//  Created by Aman Taneja on 19/11/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import UIKit
import DLRadioButton

class FinCartUserInfoVC: FinCartViewController, UITextFieldDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var genderCategory: String!
    private var martialStatus: String!
    private var activeField: UITextField!
    var isSingleGoal: Bool! = false
    var isSingleGoalChild: Bool! = false
    var singleGoalCode: String?
    var childs: Int = 0
    var userInfoData: UserInfoData?
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userFullNameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var userMonthlyIncomeTextField: UITextField!
    @IBOutlet weak var userMonthlyExpenseTextField: UITextField!
    @IBOutlet weak var userMartialStatusView: UIView!
    @IBOutlet weak var kidsStatusView: UIView!
    @IBOutlet weak var userGenderStatusView: UIView!
    @IBOutlet weak var kidStatusValueLabel: UILabel!
    @IBOutlet weak var singleStatusButton: DLRadioButton!
    @IBOutlet weak var marriedStatusButton: DLRadioButton!
    @IBOutlet weak var maleGenderButton: DLRadioButton!
    @IBOutlet weak var femaleGenderButton: DLRadioButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var userImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var userImageVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var userFullNameTextFieldHeightConstraint: NSLayoutConstraint!
     @IBOutlet weak var userAgeTextFieldHeightConstraint: NSLayoutConstraint!
     @IBOutlet weak var userMonthlyIncomeTextFieldHeightConstraint: NSLayoutConstraint!
     @IBOutlet weak var userMonthlyExpenseTextFieldHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var singleStatusWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var martialStatusViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var martialStatusViewVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var kidsStatusViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var kidsStatusViewVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var maleGenderWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var genderStatusViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var genderStatusViewVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        userInfoData = UserInfoData()
        userInfoData?.name = finCartUserDefaults.retrieveUserFullName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupOpaqueNavigationBar()
        setUpTextFields(userFullNameTextField, "ic_user_icon")
        setUpTextFields(userAgeTextField, "ic_age_icon")
        setUpTextFields(userMonthlyIncomeTextField, "ic_income")
        setUpTextFields(userMonthlyExpenseTextField, "ic_expenses")
        if self.view.frame.width < 375{
            userImageWidthConstraint.constant = 91
            userImageVerticalSpacingConstraint.constant = -101
        }else if self.view.frame.width < 414{
            userImageWidthConstraint.constant = 105
            userImageVerticalSpacingConstraint.constant = -115
        }
        
        singleStatusWidthConstraint.constant = (self.view.frame.size.width - 124)/2
        maleGenderWidthConstraint.constant = (self.view.frame.size.width - 124)/2
        self.scrollView?.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        //Adding Keyboard Notification Observers
        addKeyboardNotificationObserver(addObserver: true)
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        setUpRadioButtonsViews()
        setUpTextFieldsValue()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentViewHeightConstraint.constant = self.view.frame.height - 50
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addKeyboardNotificationObserver(addObserver: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARKS:- Action Methods
    @IBAction func genderCategorySelection(_ button: DLRadioButton) {
        
        if button.titleLabel?.text?.caseInsensitiveCompare("male") == ComparisonResult.orderedSame
        {
            userInfoData?.genderStatusCode = "001"
        }else{
            userInfoData?.genderStatusCode = "002"
        }
    }
    
    @IBAction func martialStatusSelection(_ button: DLRadioButton) {
        if button.titleLabel?.text?.caseInsensitiveCompare("single") == ComparisonResult.orderedSame
        {
            userInfoData?.martialStatusCode = "001"
            userInfoData?.childsCount = 0
            self.kidStatusValueLabel.text = "No Child"
            childs = 0
            hideViews(isMartialStatusHide: false, isChildrenStatusHide: true, isGenderStatusHide: false)
        }else{
            if childs == 0{
                userInfoData?.martialStatusCode = "002"
            }else{
                userInfoData?.martialStatusCode = "003"
            }
            hideViews(isMartialStatusHide: false, isChildrenStatusHide: false, isGenderStatusHide: false)
        }
    }
    
    @IBAction func childSelectionAction(_ sender: UIButton){
        let alert = UIAlertController(title: "How many children do you have?", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        if !(isSingleGoal && isSingleGoalChild){
            alert.addAction(UIAlertAction(title: "No Child", style: .default, handler: { (action) in
                self.userInfoData?.martialStatusCode = "002"
                self.userInfoData?.childsCount = 0
                self.kidStatusValueLabel.text = "No Child"
                self.childs = 0
            }))
        }
        alert.addAction(UIAlertAction(title: "1 Child", style: .default, handler: { (action) in
            self.userInfoData?.martialStatusCode = "003"
            self.userInfoData?.childsCount = 1
            self.kidStatusValueLabel.text = "1 Child"
            self.childs = 1
        }))
        alert.addAction(UIAlertAction(title: "2 Children", style: .default, handler: { (action) in
            self.userInfoData?.martialStatusCode = "003"
            self.userInfoData?.childsCount = 2
            self.kidStatusValueLabel.text = "2 Children"
            self.childs = 2
        }))
        alert.addAction(UIAlertAction(title: "3 Children", style: .default, handler: { (action) in
            self.userInfoData?.martialStatusCode = "003"
            self.userInfoData?.childsCount = 3
            self.kidStatusValueLabel.text = "3 Children"
            self.childs = 3
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: {
                print("alert dismissed")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        if !Validation.validateUserFullName(userFullNameTextField.text){
            let alert = UIAlertController(title: "Validation Error", message: "Please enter user name.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }else if !Validation.validateUserAge(userAgeTextField.text){
            let alert = UIAlertController(title: "Validation Error", message: "Please enter valid age.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }

        }else if !Validation.validateMonthlyIncome(userMonthlyIncomeTextField.text){
            let alert = UIAlertController(title: "Validation Error", message: "Please enter monthly income.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }else if !Validation.validateMonthlyExpense(userMonthlyExpenseTextField.text){
            let alert = UIAlertController(title: "Validation Error", message: "Please enter monthly expense.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }else if !Validation.validateMartialStatus(userInfoData?.martialStatusCode){
            let alert = UIAlertController(title: "Validation Error", message: "Please select single or married martial status", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }else if !Validation.validateGenderCategory(userInfoData?.genderStatusCode){
            let alert = UIAlertController(title: "Validation Error", message: "Please select Female or male category", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }else {
            userInfoData?.name = userFullNameTextField.text
            userInfoData?.age = userAgeTextField.text
            userInfoData?.monthlySalary = userMonthlyIncomeTextField.text
            userInfoData?.monthlyExpense = userMonthlyExpenseTextField.text
            savePersonalDetails()
        }
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userFullNameTextField{
            userAgeTextField.becomeFirstResponder()
        }else if textField == userAgeTextField{
            userAgeTextField.resignFirstResponder()
        }else if textField == userMonthlyIncomeTextField{
            userMonthlyExpenseTextField.resignFirstResponder()
        }else if textField == userMonthlyExpenseTextField{
            userMonthlyExpenseTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // MARK: - Keyboard Notifications
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
        if (!aRect.contains(CGPoint(x : 0, y : activeField.frame.maxY))) {
            self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInsets: UIEdgeInsets! = UIEdgeInsets.zero
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentInset = contentInsets
        }
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    //MARKS: - Private methods
    private func setUpTextFieldsValue()
    {
        userFullNameTextField.text = userInfoData?.name
        userAgeTextField.text = (userInfoData?.age != nil ? userInfoData?.age : "")
        userMonthlyIncomeTextField.text = (userInfoData?.monthlySalary != nil ? userInfoData?.monthlySalary : "")
        userMonthlyExpenseTextField.text = (userInfoData?.monthlyExpense != nil ? userInfoData?.monthlyExpense : "")
    }
    
    private func setUpRadioButtonsViews()
    {
        if isSingleGoal && isSingleGoalChild
        {
            hideViews(isMartialStatusHide: true, isChildrenStatusHide: false, isGenderStatusHide: true)
            kidStatusValueLabel.text = "1 Child"
            self.childs = 1
            
        }
        else if isSingleGoal
        {
            hideViews(isMartialStatusHide: true, isChildrenStatusHide: true, isGenderStatusHide: true)
        }
        else
        {
            if !(userInfoData?.martialStatusCode?.caseInsensitiveCompare("001") == ComparisonResult.orderedSame){
                self.marriedStatusButton.isSelected = true
                setChildLabelValue()
                hideViews(isMartialStatusHide: false, isChildrenStatusHide: false, isGenderStatusHide: false)
                
            }else{
                self.singleStatusButton.isSelected = true
                hideViews(isMartialStatusHide: false, isChildrenStatusHide: true, isGenderStatusHide: false)
            }
            
            if userInfoData?.genderStatusCode?.caseInsensitiveCompare("001") == ComparisonResult.orderedSame{
                self.maleGenderButton.isSelected = true
            }else{
                self.femaleGenderButton.isSelected = true
            }
        }
    }
    
    private func hideViews(isMartialStatusHide: Bool, isChildrenStatusHide: Bool, isGenderStatusHide: Bool){
        UIView.transition(with: userMartialStatusView, duration: 0.0, options: .transitionCrossDissolve, animations: {
            self.userMartialStatusView.isHidden = isMartialStatusHide
            if isMartialStatusHide {
                self.martialStatusViewHeightConstraint.constant = 0
                self.martialStatusViewVerticalSpacingConstraint.constant = 0
            }else{
                self.martialStatusViewHeightConstraint.constant = 30
                self.martialStatusViewVerticalSpacingConstraint.constant = 8
            }
        })
        
        UIView.transition(with: kidsStatusView, duration: 0.0, options: .transitionCrossDissolve, animations: {
            self.kidsStatusView.isHidden = isChildrenStatusHide
            if isChildrenStatusHide {
                self.kidsStatusViewHeightConstraint.constant = 0
                self.kidsStatusViewVerticalSpacingConstraint.constant = 0
            }else{
                self.kidsStatusViewHeightConstraint.constant = 30
                self.kidsStatusViewVerticalSpacingConstraint.constant = 8
                self.kidStatusValueLabel.layer.borderColor = UIColor.gray.cgColor
                self.kidStatusValueLabel.layer.borderWidth = 1
            }
        })
        
        UIView.transition(with: userGenderStatusView, duration: 0.0, options: .transitionCrossDissolve, animations: {
            self.userGenderStatusView.isHidden = isGenderStatusHide
            if isGenderStatusHide {
                self.genderStatusViewHeightConstraint.constant = 0
                self.genderStatusViewVerticalSpacingConstraint.constant = 0
            }else{
                self.genderStatusViewHeightConstraint.constant = 30
                self.genderStatusViewVerticalSpacingConstraint.constant = 8
            }
        })
    }
    
    private func setChildLabelValue()
    {
        if userInfoData?.childsCount == 0{
            self.kidStatusValueLabel.text = "No Child"
        }else if userInfoData?.childsCount == 1{
            self.kidStatusValueLabel.text = "1 Child"
        }else{
            self.kidStatusValueLabel.text = String(describing: userInfoData?.childsCount) + " Children"
        }
    }
    
    private func setUpTextFields(_ activeField: UITextField, _ imageName: String){
        activeField.attributedPlaceholder = NSAttributedString(string: activeField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        let leftAddView = UIView.init(frame: CGRect(x: 0, y: 0, width : activeField.frame.height, height : activeField.frame.size.height))
        let midPointX = ceil((leftAddView.frame.size.width/4))
        let midPointY = ceil((leftAddView.frame.size.height/4))
        let leftimageView = UIImageView.init(frame: CGRect(x:(leftAddView.frame.size.width/2) - midPointX, y: (leftAddView.frame.size.height/2) - midPointY, width:(leftAddView.frame.size.width/2), height:(leftAddView.frame.size.height/2)))
        leftimageView.image = UIImage(named: imageName)
        leftAddView.addSubview(leftimageView)
        activeField.leftView = leftAddView
        activeField.textColor = UIColor.black
        activeField.leftViewMode = UITextFieldViewMode.always
    }
    
    //MARKS:- API Services
    private func savePersonalDetails(){
        FinCartMacros.showSVProgressHUD()
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        let monthlyIncome = Double((userInfoData?.monthlySalary)!)
        let annualIncome = String(format:"%.0f", monthlyIncome! * 12)
        var answerString = "C5~FQ1~" + (userInfoData?.name)!
        answerString += "|" + "C5~FQ2~" + (userInfoData?.age)!
        if !isSingleGoal {
            answerString += "|" + "C5~FQ3~" + (userInfoData?.genderStatusCode)!
            answerString += "|" + "C5~FQ4~" + (userInfoData?.martialStatusCode)!
            answerString += "|" + "C5~FQ6~" + String(format: "%d", (userInfoData?.childsCount)!)
        }else if isSingleGoal && isSingleGoalChild{
            answerString += "|" + "C5~FQ6~" + String(format: "%d", (userInfoData?.childsCount)!)
        }
        answerString += "|" + "C5~FQ10~" + annualIncome
        answerString += "|" + "C5~FQ11~" + (userInfoData?.monthlyExpense)!
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
                        if self.isSingleGoal{
                            if self.isSingleGoalChild && self.childs > 0{
                                self.navigateToChildBasicInfoVC(self.childs, isSingleGoal: true, goalCode: self.singleGoalCode!, income: monthlyIncome! * 12)
                            }else{
                                self.navigateToSingleGoalsVC("all_goals_with_retire", goalCode: self.singleGoalCode!, income: monthlyIncome! * 12)
                            }
                        }
                        else{
                            if self.userInfoData?.martialStatusCode == "003"{
                                self.navigateToChildBasicInfoVC(self.childs, isSingleGoal: false, goalCode: "", income: monthlyIncome! * 12)
                            }
                            else{
                                var jsonFile = ""
                                if self.userInfoData?.martialStatusCode == "002"{
                                    jsonFile += "married_"
                                }else{
                                    jsonFile += "single_"
                                }
                                if self.userInfoData?.genderStatusCode == "001"{
                                    jsonFile += "male"
                                }else{
                                    jsonFile += "female"
                                }
                                self.navigateTofulllFinancialGoalsVC(jsonFile, yesCount: 0, income: monthlyIncome! * 12)
                            }
                        }
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
    
    private func navigateToChildBasicInfoVC(_ childCount: Int, isSingleGoal: Bool, goalCode: String, income: Double)
    {
        let childInfoVC : ChildBasicInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "childBasicInfoVC") as! ChildBasicInfoVC
        childInfoVC.childCount = childCount
        childInfoVC.isSingleGoalValue = isSingleGoal
        childInfoVC.singleGoalCode = goalCode
        childInfoVC.income = income
        self.navigationController?.pushViewController(childInfoVC, animated: true)
        
    }
    
    private func navigateToSingleGoalsVC(_ json: String, goalCode: String, income: Double)
    {
        let userInfoVC : FinCartSingalQuestionnaireVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finCartSingalQuestionnaireVC") as! FinCartSingalQuestionnaireVC;
        userInfoVC.jsonFileName = json
        userInfoVC.singleGoalCode = goalCode
        userInfoVC.userIncome = income
        userInfoVC.childCount = self.userInfoData?.childsCount
        self.navigationController?.pushViewController(userInfoVC, animated: true)
    }
    
    private func navigateTofulllFinancialGoalsVC(_ json: String, yesCount: Int, income: Double)
    {
        let userInfoVC : FinCartQuestionnaireVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finCartQuestionnaireVC") as! FinCartQuestionnaireVC;
        userInfoVC.yesCount = yesCount
        userInfoVC.jsonFileName = json
        userInfoVC.income = income
        self.navigationController?.pushViewController(userInfoVC, animated: true)
    }
}
