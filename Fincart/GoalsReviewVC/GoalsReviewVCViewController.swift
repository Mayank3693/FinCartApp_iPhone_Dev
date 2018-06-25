//
//  GoalsReviewVCViewController.swift
//  Fincart
//
//  Created by Kamal on 23/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class GoalsReviewVC: FinCartViewController, UITableViewDelegate, UITableViewDataSource, UITableViewCellDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    func goalsReviewCellChangeInvestmentType(_ sender: GoalsReviewTableViewCell) {
        let alert = UIAlertController(title: "INVESTMENT TYPE", message: "SELECT INVESTMENT TYPE", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "MONTHLY", style: .default, handler: { (action) in
            sender.investmentTypeLabel.text = "MONTHLY"
        }))
        alert.addAction(UIAlertAction(title: "ANNUALLY", style: .default, handler: { (action) in
            sender.investmentTypeLabel.text = "ANNUALLY"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: {
                print("alert dismissed")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func goalsReviewCellEditTap(_ sender: GoalsReviewTableViewCell) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        selectedIndex = tappedIndexPath.section
        tableView.reloadData()
    }
    
    func goalsReviewCellRemoveTap(_ sender: GoalsReviewTableViewCell) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        selectedIndex = tappedIndexPath.section
        FinCartMacros.showSVProgressHUD()
        removeReviewGoal()
    }
    
    func goalsReviewCellReCalculateTap(_ sender: GoalsReviewTableViewCell) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        let goalReviewData: GoalsReviewElement = goalsReviewModel[tappedIndexPath.section]
        goalReviewData.investAmount = sender.investmentAmountTextField.text
        if sender.investmentTypeLabel.text?.caseInsensitiveCompare("Monthly") == ComparisonResult.orderedSame {
            goalReviewData.investmentType = "S"
        }else{
            goalReviewData.investmentType = "L"
        }
        goalsReviewModel.remove(at: tappedIndexPath.section)
        goalsReviewModel.insert(calculateInvestment(goalReviewData, cell: sender), at: tappedIndexPath.section)
        selectedIndex = goalsReviewModel.count + 1
        tableView.reloadData()
    }

    public var jsonString: String!
    var goalsReviewModel: GoalsReview!
    var imageCache = [String:UIImage]()
    var selectedIndex : Int!
    var activeField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return goalsReviewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = calculateHeightForFundValue(goalsReviewModel[indexPath.section].recommendedFund!, width: tableView.frame.size.width - 164)
        if selectedIndex == indexPath.section{
            return 263 + height
        }else{
            return 190 + height
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalsReviewCell") as! GoalsReviewTableViewCell
        cell.delegate = self
        cell.childView.layer.cornerRadius = 10
        cell.childView.clipsToBounds = true
        cell.goalName.text = goalsReviewModel[indexPath.section].goalName
        cell.amountValueLabel.text = "\u{20B9} " + goalsReviewModel[indexPath.section].getAmount!
        cell.durationValueLabel.text = goalsReviewModel[indexPath.section].goaltime! + "  Year"
        if goalsReviewModel[indexPath.section].investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame
        {
            cell.investValueLabel.text = "\u{20B9} " + goalsReviewModel[indexPath.section].investAmount! + " Monthly"
        }else{
            cell.investValueLabel.text = "\u{20B9} " + goalsReviewModel[indexPath.section].investAmount! + " Annually"
        }
        cell.fundValueLabel.text = goalsReviewModel[indexPath.section].recommendedFund
        if selectedIndex == indexPath.section{
            cell.editButton.isHidden = true
            cell.removeButton.isHidden = true
            cell.recalculateButton.isHidden = false
            cell.editView.isHidden = false
            cell.editViewHeightConstraint.constant = 65
            cell.verticalSpaceConstraint.constant = 8
            cell.investmentAmountTextField.layer.borderColor = UIColor.lightGray.cgColor
            cell.investmentAmountTextField.layer.borderWidth = 1
            cell.investmentTypeLabel.layer.borderColor = UIColor.lightGray.cgColor
            cell.investmentTypeLabel.layer.borderWidth = 1
            cell.investAmountTextFieldWidthConstraint.constant = (tableView.frame.size.width - 16)/2
            cell.editViewLabelWidthConstraint.constant = (tableView.frame.size.width - 16)/2
            cell.investmentAmountTextField.text = goalsReviewModel[indexPath.section].investAmount!
        }else{
            cell.editButton.isHidden = false
            cell.removeButton.isHidden = false
            cell.recalculateButton.isHidden = true
            cell.editButtonWidthConstraint.constant = (tableView.frame.size.width - 16)/2
            cell.editView.isHidden = true
            cell.editViewHeightConstraint.constant = 0
            cell.verticalSpaceConstraint.constant = 0
        }
        if let img = imageCache[goalsReviewModel[indexPath.section].goalName!] {
            cell.goalsImageView.image = img
        }else
        {
            let imageURL = goalsReviewModel[indexPath.section].goalImage
            let url:URL! = URL(string: imageURL!)
            let task = URLSession.shared.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async(execute: { () -> Void in
                        if let updateCell: GoalsReviewTableViewCell = tableView.cellForRow(at: indexPath) as? GoalsReviewTableViewCell  {
                            let img:UIImage! = UIImage(data: data)
                            self.imageCache[self.goalsReviewModel[indexPath.section].goalName!] = img
                            updateCell.goalsImageView.image = img
                            self.tableView.reloadData()
                        }
                    })
                }
            })
            task.resume()
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardNotificationObserver(addObserver: true)
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        self.navigationItem.hidesBackButton = true
        do{
            goalsReviewModel = try GoalsReview(jsonString)
        }catch{}
        selectedIndex = goalsReviewModel.count + 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardNotificationObserver(addObserver: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func calculateHeightForFundValue(_ value: String, width: CGFloat) -> CGFloat{
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = (value as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        let height = ceil(boundingBox.height)
        return height
    }
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    private func removeReviewGoal()
    {
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        let goalCode = goalsReviewModel[selectedIndex].goalCode
        APIManager.sharedInstance.removeReviewGoal(accessToken!, goalCode: goalCode!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.goalsReviewModel.remove(at: self.selectedIndex)
                        if self.goalsReviewModel.count == 0{
                            self.appDelegate.showDashboardScreen()
                        }else{
                            self.selectedIndex = self.goalsReviewModel.count + 1
                            self.tableView.reloadData()
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken("remove")
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func refreshAccessToken(_ type: String)
    {
        FincartCommon.refreshAccessToken(success: { (responseCode) in
            if responseCode == 200{
                if type.caseInsensitiveCompare("remove") == ComparisonResult.orderedSame{
                    self.removeReviewGoal()
                }
                else{
                    self.saveAndTransactAPI()
                }
            }else{
                self.getAccessToken(type)
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func getAccessToken(_ type: String)
    {
        FincartCommon.getAccessToken(success: { (responseCode) in
            if responseCode == 200{
                if type.caseInsensitiveCompare("remove") == ComparisonResult.orderedSame{
                    self.removeReviewGoal()
                }
                else{
                    self.saveAndTransactAPI()
                }
            }else{
                SVProgressHUD.dismiss()
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
    
    private func calculateInvestment(_ goalReviewElement: GoalsReviewElement, cell: GoalsReviewTableViewCell) -> GoalsReviewElement
    {
        let goalReviewData = goalReviewElement
        if goalReviewElement.investmentType?.caseInsensitiveCompare("S") == ComparisonResult.orderedSame{
            let fundCalculationResult = FundCalculation.callMethodForCalculation(goalReviewElement, changeBy: FincartCommon.SLIDER_CHANGE_BY_MONTHLY)
            goalReviewData.investAmount = String(format: "%.0f",fundCalculationResult.investmentSip)
            goalReviewData.getAmount = String(format: "%.0f", fundCalculationResult.sip)
        }else{
            let fundCalculationResult = FundCalculation.callMethodForCalculation(goalReviewElement, changeBy: FincartCommon.SLIDER_CHANGE_BY_ONETIME)
            goalReviewData.investAmount = String(format: "%.0f", fundCalculationResult.investmentLumpsum)
            goalReviewData.getAmount = String(format: "%.0f", fundCalculationResult.lumpsum)
        }
        return goalReviewData
    }
    
    //MARKS: - dismiss Keyboard
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func saveAndTransactAction(_ sender: Any) {
        saveAndTransactAPI()
    }
    
    private func saveAndTransactAPI()
    {
        let isGoal = FinCartUserDefaults.sharedInstance.retrieveIsGoalStatus()
        FinCartMacros.showSVProgressHUD()
        singleGaolSaveAndTransact()
//        if isGoal{
//            let kycStatus = FinCartUserDefaults.sharedInstance.retrieveKycStatus()
//            if kycStatus.caseInsensitiveCompare("N") == ComparisonResult.orderedSame ||
//                kycStatus.caseInsensitiveCompare("NO") == ComparisonResult.orderedSame{
//                let finCartCheckKyc: FinCartKYCCheckVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FinCartKYCCheckVC") as! FinCartKYCCheckVC
//                self.navigationController?.pushViewController(finCartCheckKyc, animated: true)
//            }else{
//                FinCartMacros.showSVProgressHUD()
//                singleGaolSaveAndTransact()
//            }
//        }else{
//            let kycStatus = FinCartUserDefaults.sharedInstance.retrieveKycStatus()
//            if kycStatus.caseInsensitiveCompare("N") == ComparisonResult.orderedSame ||
//                kycStatus.caseInsensitiveCompare("NO") == ComparisonResult.orderedSame{
//                let finCartCheckKyc: FinCartKYCCheckVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FinCartKYCCheckVC") as! FinCartKYCCheckVC
//                self.navigationController?.pushViewController(finCartCheckKyc, animated: true)
//            }else{
//                FinCartMacros.showSVProgressHUD()
//                fullFinancialGoalSaveAndTransact()
//            }
//        }
    }
    
    private func fullFinancialGoalSaveAndTransact(){
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.saveReview(accessToken!, goalReviewData: goalsReviewModel, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        FinCartUserDefaults.sharedInstance.saveIsGoal(true)
                        self.appDelegate.showDashboardScreen()
                    })
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken("save")
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
    
    private func singleGaolSaveAndTransact(){
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.saveSingleReview(accessToken!, goalReviewData: goalsReviewModel[0], success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.appDelegate.showDashboardScreen()
                    })
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken("save")
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
        if let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Get my height size
            let myheight = tableView.frame.height
            // Get the top Y point where the keyboard will finish on the view
            let keyboardEndPoint = myheight - keyboardFrame.height
            // Get the the bottom Y point of the textInput and transform it to the currentView coordinates.
            if let pointInTable = activeField.superview?.convert(activeField.frame.origin, to: tableView) {
                let textFieldBottomPoint = pointInTable.y + activeField.frame.size.height + 20
                // Finally check if the keyboard will cover the textInput
                if keyboardEndPoint <= textFieldBottomPoint {
                    tableView.contentOffset.y = textFieldBottomPoint - keyboardEndPoint
                } else {
                    tableView.contentOffset.y = 0
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        tableView.contentOffset.y = 0
    }
    
    private func navigateToKYC(){
        
    }
}
