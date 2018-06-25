//
//  ChildBasicInfoVC.swift
//  Fincart
//
//  Created by Kamal on 30/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class ChildBasicInfoVC: FinCartViewController, UITableViewDelegate, UITableViewDataSource, ChildInfoTableViewCellDelegate, ChildPlanningTableViewCellDelegate, ChildStudyPlansDetailTableViewCellDelegate, ChildWeddingPlansDetailTableViewCellDelegate, UITextFieldDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var isPickerHidden: Bool? =  true
    private var selectedIndex: Int? = 0
    var childCount: Int?
    var activeField: UITextField?
    private var navigatingIndex: Int?
    private var navigatedArray = [Int]()
    var isSingleGoalValue: Bool?
    var singleGoalCode: String?
    private let quesArray: [String]? = ["Tell us a little about them?", "Planning for children's Education?", "Where do you want children's to study?", "Planning for children's wedding?", "How do you want the celebrations?"]
    var kidDataArray: KidDataArrayList?
    var income: Double?
    
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var childInfoTableView: UITableView!
    @IBOutlet weak var previousButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var verticalSpacingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kidDataArray = KidDataArrayList()
        kidDataArray?.kidDataArrayList = [KidData]()
        navigatingIndex = 0;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupOpaqueNavigationBar()
        //Adding Keyboard Notification Observers
        addKeyboardNotificationObserver(addObserver: true)
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        if self.view.frame.width < 375{
            imageViewWidthConstraint.constant = 91
            verticalSpacingConstraint.constant = -101
        }else if self.view.frame.width < 414{
            imageViewWidthConstraint.constant = 105
            verticalSpacingConstraint.constant = -115
        }
        previousButtonWidthConstraint.constant = (self.view.frame.size.width -  32)/2
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addKeyboardNotificationObserver(addObserver: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if navigatingIndex == 2 || navigatingIndex == 4{
            return (navigatingIndex! == 2 ? kidDataArray?.childCountForStudy : kidDataArray?.childCountForWeddingPlan)!
        }else{
            if (kidDataArray?.kidDataArrayList?.count)! > 0{
                return (kidDataArray?.kidDataArrayList?.count)!
            }else{
                return childCount!
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if navigatingIndex == 0{
            if selectedIndex == indexPath.section && !isPickerHidden!{
                return 206
            }else{
                return 106
            }
        }else if navigatingIndex == 1 || navigatingIndex == 3{
            return 40
        }else{
            return 86
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        quesLabel.text = quesArray?[navigatingIndex!]
        if navigatingIndex == 0
        {
            let cell: ChildInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "childInfoTableViewCell", for: indexPath) as! ChildInfoTableViewCell
            cell.delegate = self
            cell.childNameTestField.layer.borderColor = UIColor.gray.cgColor
            cell.childNameTestField.layer.borderWidth = 1
            cell.genderViewWidthConstraint.constant = (tableView.frame.size.width - 8)/2
            cell.genderCategoryContainer.layer.borderWidth = 1
            cell.genderCategoryContainer.layer.borderColor = UIColor.gray.cgColor
            cell.ageContainer.layer.borderWidth = 1
            cell.ageContainer.layer.borderColor = UIColor.gray.cgColor
            if (kidDataArray?.kidDataArrayList?.count)! > 0
            {
                cell.childNameTestField.text = kidDataArray?.kidDataArrayList![indexPath.section].childName
                cell.childYearLabel.text = (kidDataArray?.kidDataArrayList![indexPath.section].age)! + " Years"
                if kidDataArray?.kidDataArrayList![indexPath.section].gender?.caseInsensitiveCompare("001") == ComparisonResult.orderedSame{
                    cell.childGenderLabel.text = "Male"
                }else
                {
                    cell.childGenderLabel.text = "Female"
                }
            }
            cell.pickerView.isHidden = cell.isPickerViewHidden!
            return cell
        }
        else if navigatingIndex == 1 || navigatingIndex == 3
        {
            let cell: ChildPlanningTableViewCell = tableView.dequeueReusableCell(withIdentifier: "childPlanningTableViewCell", for: indexPath) as! ChildPlanningTableViewCell
            cell.delegate = self
            let kidData: KidData! = kidDataArray?.getObjectAtIndex(indexPath.section)
            cell.childNameLabel.text = kidData.childName
            if navigatingIndex == 1{
                cell.switchOutlet.setOn(kidData.forEducation!, animated: true)
            }else{
                cell.switchOutlet.setOn(kidData.forWedding!, animated: true)
            }
            return cell
        }
        else if navigatingIndex == 2
        {
            let cell: ChildStudyPlansDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "childStudyPlansDetailTableViewCell", for: indexPath) as! ChildStudyPlansDetailTableViewCell
            cell.delegate = self
            let kidData: KidData! = kidDataArray?.getObjectAtIndex(indexPath.section)
            cell.childNameLabel.text = kidData.childName
            cell.childNameLabel.layer.borderColor = UIColor.gray.cgColor
            cell.childNameLabel.layer.borderWidth = 1
            cell.button.layer.borderColor  = UIColor.gray.cgColor
            cell.button.layer.borderWidth = 1
            cell.studyLocationLabel.text = kidData.educationLocation
            return cell
        }else{
            let cell: ChildWeddingPlanDetailsTableCell = tableView.dequeueReusableCell(withIdentifier: "childWeddingPlanDetailsTableCell", for: indexPath) as! ChildWeddingPlanDetailsTableCell
            cell.delegate = self
            cell.childNameLabel.layer.borderColor = UIColor.gray.cgColor
            cell.childNameLabel.layer.borderWidth = 1
            cell.button.layer.borderColor  = UIColor.gray.cgColor
            cell.button.layer.borderWidth = 1
            let kidData: KidData! = kidDataArray?.getObjectAtIndex(indexPath.section)
            cell.childNameLabel.text = kidData.childName
            cell.weddingTypeLabel.text = kidData.weddingType
            return cell
        }
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func selectChildGender(_ sender: ChildInfoTableViewCell) {
        let alert = UIAlertController(title: "", message: "Select Child Gender", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Male", style: .default, handler: { (action) in
            sender.childGenderLabel.text = "Male"
        }))
        alert.addAction(UIAlertAction(title: "Female", style: .default, handler: { (action) in
            sender.childGenderLabel.text = "Female"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: {
                print("alert dismissed")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectChildAge(_ sender: ChildInfoTableViewCell) {
        guard let tappedIndexPath = childInfoTableView.indexPath(for: sender) else { return }
        selectedIndex = tappedIndexPath.section
        sender.isPickerViewHidden = !sender.isPickerViewHidden!
        isPickerHidden = sender.isPickerViewHidden!
        childInfoTableView.reloadData()
    }
    
    func selectedChildAge(_ sender: ChildInfoTableViewCell, age: String){
        sender.childYearLabel.text = age + " Years"
    }
    
    func selectPlanAction(_ sender: ChildPlanningTableViewCell, value: Bool) {
        guard let tappedIndexPath = childInfoTableView.indexPath(for: sender) else { return }
        var kidData = kidDataArray?.getObjectAtIndex(tappedIndexPath.section)
        if navigatingIndex == 1{
            if value{
                kidDataArray?.childCountForStudy = (kidDataArray?.childCountForStudy)! + 1
            }else{
                kidDataArray?.childCountForStudy = (kidDataArray?.childCountForStudy)! - 1
            }
            kidData?.forEducation = value
        }else{
            if value{
                kidDataArray?.childCountForWeddingPlan = (kidDataArray?.childCountForWeddingPlan)! + 1
            }else{
                kidDataArray?.childCountForWeddingPlan = (kidDataArray?.childCountForWeddingPlan)! - 1
            }
            kidData?.forWedding = value
        }
        kidData = kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
    }
    
    func selectStudyLocationAction(_ sender: ChildStudyPlansDetailTableViewCell) {
        guard let tappedIndexPath = childInfoTableView.indexPath(for: sender) else { return }
        var kidData = kidDataArray?.getObjectAtIndex(tappedIndexPath.section)
        let alert = UIAlertController(title: "", message: "Select Study Location", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "USA OR CANADA", style: .default, handler: { (action) in
            sender.studyLocationLabel.text = "USA OR CANADA"
            kidData?.educationLocation = "USA OR CANADA"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "EUROPE", style: .default, handler: { (action) in
            sender.studyLocationLabel.text = "EUROPE"
            kidData?.educationLocation = "EUROPE"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "SOUTH EAST ASIA", style: .default, handler: { (action) in
            sender.studyLocationLabel.text = "SOUTH EAST ASIA"
            kidData?.educationLocation = "SOUTH EAST ASIA"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "INDIA", style: .default, handler: { (action) in
            sender.studyLocationLabel.text = "INDIA"
            kidData?.educationLocation = "INDIA"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "OTHER", style: .default, handler: { (action) in
            sender.studyLocationLabel.text = "OTHER"
            kidData?.educationLocation = "OTHER"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: {
                print("alert dismissed")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectWeddingTypeAction(_ sender: ChildWeddingPlanDetailsTableCell) {
        guard let tappedIndexPath = childInfoTableView.indexPath(for: sender) else { return }
        var kidData = kidDataArray?.getObjectAtIndex(tappedIndexPath.section)
        let alert = UIAlertController(title: "", message: "Select Wedding Celebration", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "SIMPLE", style: .default, handler: { (action) in
            sender.weddingTypeLabel.text = "SIMPLE"
            kidData?.educationLocation = "SIMPLE"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "MODERATE", style: .default, handler: { (action) in
            sender.weddingTypeLabel.text = "MODERATE"
            kidData?.educationLocation = "MODERATE"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "LAVISH", style: .default, handler: { (action) in
            sender.weddingTypeLabel.text = "LAVISH"
            kidData?.educationLocation = "LAVISH"
            kidData = self.kidDataArray?.updateObjectAtIndex(tappedIndexPath.section, kidDataObject: kidData!)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: {
                print("alert dismissed")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func previousButtonAction(_ sender: UIButton) {
        if navigatingIndex == 0{
            self.navigationController?.popViewController(animated: true)
        }else{
            navigatingIndex = navigatedArray.last
            navigatedArray.removeLast()
            childInfoTableView.reloadData()
        }
        
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        selectedIndex = 0
        if navigatingIndex == 0{
            var isValidated = true
            for index in 0 ..< childCount!{
                let indexPath = IndexPath(row: 0, section: index)
                let cell: ChildInfoTableViewCell = childInfoTableView.cellForRow(at: indexPath) as! ChildInfoTableViewCell
                if !Validation.validateUserFullName(cell.childNameTestField.text){
                    isValidated = false
                    let alert = UIAlertController(title: "Validation Error", message: "Please enter child name.", preferredStyle: UIAlertControllerStyle.alert)
                    self.present(alert, animated: true)
                    // duration in seconds
                    let duration: Double = 1.0
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                        alert.dismiss(animated: true)
                    }
                    break;
                }else{
                    if (kidDataArray?.kidDataArrayList?.count)! > index{
                        var kidData = kidDataArray?.getObjectAtIndex(index)
                        kidData?.childName = cell.childNameTestField.text
                        var age: String! = cell.childYearLabel.text
                        let range = age.range(of: " Years")
                        age.removeSubrange(range!)
                        kidData?.age = age
                        kidData?.gender = cell.childGenderLabel.text
                        kidData = (kidDataArray?.updateObjectAtIndex(index, kidDataObject: kidData!))!
                    }else{
                        let kidData = KidData()
                        kidData.childName = cell.childNameTestField.text
                        var age: String! = cell.childYearLabel.text
                        let range = age.range(of: " Years")
                        age.removeSubrange(range!)
                        kidData.age = age
                        kidData.gender = cell.childGenderLabel.text
                        kidDataArray?.addObject(kidDataObject: kidData)
                    }
                }
            }
            if isValidated{
                FinCartMacros.showSVProgressHUD()
                callTagChildInfo()
            }
        }else if navigatingIndex == 1 || navigatingIndex == 3 {
            FinCartMacros.showSVProgressHUD()
            callTagChildPlan()
        }else{
            FinCartMacros.showSVProgressHUD()
            callTagChildPlanDetails()
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
            let myheight = childInfoTableView.frame.height
            // Get the top Y point where the keyboard will finish on the view
            let keyboardEndPoint = myheight - keyboardFrame.height
            // Get the the bottom Y point of the textInput and transform it to the currentView coordinates.
            if let pointInTable = activeField?.superview?.convert((activeField?.frame.origin)!, to: childInfoTableView) {
                let textFieldBottomPoint = pointInTable.y + (activeField?.frame.size.height)! + 20
                // Finally check if the keyboard will cover the textInput
                if keyboardEndPoint <= textFieldBottomPoint {
                    childInfoTableView.contentOffset.y = textFieldBottomPoint - keyboardEndPoint
                } else {
                    childInfoTableView.contentOffset.y = 0
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        childInfoTableView.contentOffset.y = 0
    }
    
    //MARKS: - dismiss Keyboard
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    private func callTagChildInfo(){
        var answer = ""
        for index in 0 ..< (kidDataArray?.kidDataArrayList?.count)!{
            let kidData = kidDataArray?.getObjectAtIndex(index)
            if index == (kidDataArray?.kidDataArrayList?.count)! - 1{
                answer += (kidData?.childName)! + "~"
                answer += (kidData?.age)! + "~"
                if (kidData?.gender)!.caseInsensitiveCompare("Male") == ComparisonResult.orderedSame{
                    answer += "001"
                }else{
                    answer += "002"
                }
            }else{
                answer += (kidData?.childName)! + "~"
                answer += (kidData?.age)! + "~"
                if (kidData?.gender)!.caseInsensitiveCompare("Male") == ComparisonResult.orderedSame{
                    answer += "001|"
                }else{
                    answer += "002|"
                }
            }
        }
        APIManager.sharedInstance.setQuestionTags(FincartCommon.getTaggedQuestionDictionary(FincartCommon.CHILD_TELL_US_QUES, goalCode: FincartCommon.CHILD_TELL_US_GOAL, answer: answer, child: (kidDataArray?.kidDataArrayList?.count)!), success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.navigatedArray.append(self.navigatingIndex!)
                        if self.isSingleGoalValue!{
                            if self.singleGoalCode?.caseInsensitiveCompare(FincartCommon.CHILD_WEDS_GOAL) == ComparisonResult.orderedSame{
                                self.navigatingIndex = 3
                            }else{
                                self.navigatingIndex = 1
                            }
                        }else
                        {
                            self.navigatingIndex = 1
                        }
                        self.childInfoTableView.reloadData()
                    })
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken("childInfo")
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func callTagChildPlan()
    {
        var answer = ""
        var goalCode = ""
        var quesCode = ""
        if navigatingIndex == 1{
            answer = kidDataArray?.childCountForStudy != 0 ? "1" : "0"
            goalCode = FincartCommon.CHILD_EDU_GOAL
            quesCode = FincartCommon.CHILD_EDU_QUES
        }else{
            answer = kidDataArray?.childCountForWeddingPlan != 0 ? "1" : "0"
            goalCode = FincartCommon.CHILD_WEDS_GOAL
            quesCode = FincartCommon.CHILD_WEDS_QUES
        }
        APIManager.sharedInstance.setQuestionTags(FincartCommon.getTaggedQuestionDictionary(quesCode, goalCode: goalCode, answer: answer, child: (kidDataArray?.kidDataArrayList?.count)!), success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.navigatedArray.append(self.navigatingIndex!)
                        if self.navigatingIndex == 1{
                            if self.isSingleGoalValue!{
                                if self.kidDataArray?.childCountForStudy == 0{
                                    self.reviewTaggedQuestion()
                                }
                                else{
                                    self.navigatingIndex = 2
                                    self.childInfoTableView.reloadData()
                                }
                            }else{
                                if self.kidDataArray?.childCountForStudy == 0{
                                    self.navigatingIndex = 3
                                }else{
                                    self.navigatingIndex = 2
                                }
                                self.childInfoTableView.reloadData()
                            }
                        }else{
                            if self.isSingleGoalValue!{
                                if self.kidDataArray?.childCountForWeddingPlan == 0{
                                    self.reviewTaggedQuestion()
                                }else{
                                    self.navigatingIndex = 4
                                    self.childInfoTableView.reloadData()
                                }
                            }else{
                                if self.kidDataArray?.childCountForWeddingPlan == 0{
                                    if self.kidDataArray?.childCountForStudy == 0{
                                        self.navigateToFullFinacialVC("have_child", yesCount: 0)
                                    }else{
                                        self.navigateToFullFinacialVC("have_child", yesCount: 1)
                                    }
                                }else{
                                    self.navigatingIndex = 4
                                    self.childInfoTableView.reloadData()
                                }
                            }
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken("callTagChildPlan")
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func callTagChildPlanDetails(){
        var answer = ""
        var goalCode = ""
        var quesCode = ""
        if navigatingIndex == 2{
            goalCode = FincartCommon.CHILD_EDU_LOC_GOAL
            quesCode = FincartCommon.CHILD_EDU_LOC_QUES
            for index in 0 ..< (kidDataArray?.kidDataArrayList?.count)!{
                let kidData = kidDataArray?.getObjectAtIndex(index)
                if index == (kidDataArray?.kidDataArrayList?.count)! - 1{
                    answer += (kidData?.childName)! + "~"
                    answer += self.getLocationCode((kidData?.educationLocation)!)
                }else{
                    answer += (kidData?.childName)! + "~"
                    answer += self.getLocationCode((kidData?.educationLocation)!) + "|"
                }
            }
        }else{
            goalCode = FincartCommon.CHILD_EDU_WEDS_GOAL
            quesCode = FincartCommon.CHILD_EDU_WEDS_QUES
            for index in 0 ..< (kidDataArray?.kidDataArrayList?.count)!{
                let kidData = kidDataArray?.getObjectAtIndex(index)
                if index == (kidDataArray?.kidDataArrayList?.count)! - 1{
                    answer += (kidData?.childName)! + "~"
                    answer += self.getWeddingCode((kidData?.weddingType)!)
                }else{
                    answer += (kidData?.childName)! + "~"
                    answer += self.getWeddingCode((kidData?.weddingType)!) + "|"
                }
            }
        }
        APIManager.sharedInstance.setQuestionTags(FincartCommon.getTaggedQuestionDictionary(quesCode, goalCode: goalCode, answer: answer, child: (kidDataArray?.kidDataArrayList?.count)!), success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.navigatedArray.append(self.navigatingIndex!)
                        if self.navigatingIndex == 2{
                            if self.isSingleGoalValue!{
                                self.reviewTaggedQuestion()
                            }else{
                                self.navigatingIndex = 3
                                self.childInfoTableView.reloadData()
                            }
                        }else{
                            if self.isSingleGoalValue!{
                               self.reviewTaggedQuestion()
                            }else{
                                if self.kidDataArray?.childCountForStudy == 0{
                                    self.navigateToFullFinacialVC("have_child", yesCount: 1)
                                }else{
                                    self.navigateToFullFinacialVC("have_child", yesCount: 2)
                                }
                            }
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken("callTagChildPlanDetails")
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
                if type.caseInsensitiveCompare("childInfo") == ComparisonResult.orderedSame{
                    self.callTagChildInfo()
                }
                else if type.caseInsensitiveCompare("callTagChildPlan") == ComparisonResult.orderedSame{
                    self.callTagChildPlan()
                }
                else if type.caseInsensitiveCompare("callTagChildPlanDetails") == ComparisonResult.orderedSame{
                    self.callTagChildPlanDetails()
                }
                else if type.caseInsensitiveCompare("reviewTaggedQuestion") == ComparisonResult.orderedSame{
                    self.reviewTaggedQuestion()
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
                if type.caseInsensitiveCompare("childInfo") == ComparisonResult.orderedSame{
                    self.callTagChildInfo()
                }
                else if type.caseInsensitiveCompare("callTagChildPlan") == ComparisonResult.orderedSame{
                    self.callTagChildPlan()
                }else if type.caseInsensitiveCompare("callTagChildPlanDetails") == ComparisonResult.orderedSame{
                    self.callTagChildPlanDetails()
                }else if type.caseInsensitiveCompare("reviewTaggedQuestion") == ComparisonResult.orderedSame{
                    self.reviewTaggedQuestion()
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
    
    private func reviewTaggedQuestion()
    {
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.reviewTaggedGoals(accessToken!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
                    if let StringResponse = String(data: data! as! Data, encoding: String.Encoding.utf8) as String! {
                        DispatchQueue.main.async(execute: {
                            SVProgressHUD.dismiss()
                            let userInfoVC : GoalsReviewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "goalsReviewVC") as! GoalsReviewVC;
                            userInfoVC.jsonString = StringResponse
                            self.navigationController?.pushViewController(userInfoVC, animated: true)
                        })
                    }
                }
                else if httpResponse.statusCode == 401{
                    self.refreshAccessToken("reviewTaggedQuestion")
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
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    private func  getLocationCode(_ location: String) -> String!
    {
        if location.caseInsensitiveCompare("USA OR CANADA") == ComparisonResult.orderedSame{
            return "001"
        }else if location.caseInsensitiveCompare("INDIA") == ComparisonResult.orderedSame{
            return "004"
        }else if location.caseInsensitiveCompare("EUROPE") == ComparisonResult.orderedSame{
            return "002"
        }else{
            return "003"
        }
    }
    
    private func  getWeddingCode(_ location: String) -> String!
    {
        if location.caseInsensitiveCompare("SIMPLE") == ComparisonResult.orderedSame{
            return "001"
        }else if location.caseInsensitiveCompare("MODERATE") == ComparisonResult.orderedSame{
            return "002"
        }else{
            return "003"
        }
    }
    
    private func navigateToFullFinacialVC(_ json: String, yesCount: Int)
    {
        let userInfoVC : FinCartQuestionnaireVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "finCartQuestionnaireVC") as! FinCartQuestionnaireVC;
        userInfoVC.yesCount = yesCount
        userInfoVC.jsonFileName = json
        userInfoVC.income = income
        self.navigationController?.pushViewController(userInfoVC, animated: true)
    }
}
