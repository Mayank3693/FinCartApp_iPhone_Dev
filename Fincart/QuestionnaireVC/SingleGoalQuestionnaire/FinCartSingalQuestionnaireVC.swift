//
//  FinCartSingalQuestionnaireVC.swift
//  Fincart
//
//  Created by Kamal on 16/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import DLRadioButton

class FinCartSingalQuestionnaireVC: FinCartViewController, UITextViewDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private var optionHeight: CGFloat?
    var singleGoalCode: String?
    var jsonFileName : String?
    var jsonObject : JsonBase?
    var quesAnsArray = [Int:String]()
    var ansText: String?
    var buttonIndexCount = 1
    var buttonIncrementMax : Int = 0
    var buttonIncrementMin : Int = 0
    var incrementLabel : UILabel?
    var singleGoalList: SingleGoalList?
    var navigationIndex = 0
    var activeTextView: UITextView?
    var questionFinished: Bool? = false
    var userIncome: Double?
    var childCount: Int? = 0
    var slider: UISlider?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var goalImageView: UIImageView!
    
    @IBOutlet weak var questionLabelConstraint: NSLayoutConstraint!
    @IBOutlet weak var goalImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var goalImageViewVerticalSpacingConstraint: NSLayoutConstraint!
    @IBOutlet weak var optionsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var optionsViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var previousButtonWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleGoalList = SingleGoalList()
        singleGoalList?.singleGoalDetailsList = [SingleGoalDetails]()
        parseJSON()
        getGoalList()
        getDefaultOptions()
        getOptionHeight()
        let baseObject  = singleGoalList?.getObjectAtIndex(navigationIndex)
        displayAnsOptionType(_ansType: (baseObject?.anstype)!, _quesString: (baseObject?.ques)!, _optionArray: (baseObject?.options)!, _indexCount: navigationIndex)
        self.view.setNeedsDisplay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Adding Keyboard Notification Observers
        addKeyboardNotificationObserver(addObserver: true)
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        if self.view.frame.width < 375{
            goalImageViewWidthConstraint.constant = 91
            goalImageViewVerticalSpacingConstraint.constant = -101
        }else if self.view.frame.width < 414{
            goalImageViewWidthConstraint.constant = 105
            goalImageViewVerticalSpacingConstraint.constant = -115
        }else{
            goalImageViewWidthConstraint.constant = 116
            goalImageViewVerticalSpacingConstraint.constant = -126
        }
        buttonContainerViewHeightConstraint.constant = optionHeight!
        previousButtonWidthConstraint.constant = (self.view.frame.width - 52)/2
        previousButton.layer.cornerRadius = optionHeight!/2
        nextButton.layer.cornerRadius = optionHeight!/2
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addKeyboardNotificationObserver(addObserver: false)
        for view in self.optionsView.subviews{
            optionsView.willRemoveSubview(view)
            view.removeFromSuperview()
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        tagQuestions(navigationIndex)
    }
    
    @IBAction func previousQuestion(_ sender: UIButton) {
        updatingPreviousQues()
    }
    
    @objc func radioButtonClicked(_ sender: DLRadioButton)
    {
        ansText = sender.titleLabel?.text
        quesAnsArray.updateValue(ansText!, forKey: navigationIndex)
        tagQuestions(navigationIndex)
    }
    
    @objc func incrementSubtract(_ sender: UIButton){
        buttonIndexCount = buttonIndexCount - 1
        var resultString : String?
        if buttonIndexCount >= buttonIncrementMin{
            if buttonIndexCount >= 2{
                resultString = String(buttonIndexCount) + " YEARS"
                incrementLabel?.text = resultString
            }else{
                resultString = "1 YEAR"
                incrementLabel?.text = resultString
            }
            quesAnsArray.updateValue(resultString!, forKey: navigationIndex)
        }
        else{
            buttonIndexCount = buttonIncrementMin
        }
    }
    
    @objc func incrementAdded(_ sender: UIButton){
        buttonIndexCount = buttonIndexCount + 1
        var resultString : String?
        if buttonIndexCount <= buttonIncrementMax {
            if buttonIndexCount == 1{
                resultString = "1 YEAR"
                incrementLabel?.text = resultString
            }
            else{
                resultString = String(buttonIndexCount) + " YEARS"
                incrementLabel?.text = resultString
            }
            quesAnsArray.updateValue(resultString!, forKey: navigationIndex)
        }else{
            buttonIndexCount = buttonIncrementMax
        }
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
    
    private func getGoalList(){
        for index in 0 ..< ((jsonObject?.baseObject?.count)!){
            let parentBase = jsonObject?.baseObject?[index]
            if parentBase?.goalcode?.caseInsensitiveCompare(singleGoalCode!) == ComparisonResult.orderedSame{
                if parentBase?.quesArray?.count == 0{
                    setObjectValue(index, isChild: false, parentBase: parentBase!)
                }else{
                    for subIndex in 0 ..< ((parentBase?.quesArray?.count)!){
                        setObjectValue(subIndex, isChild: true, parentBase: parentBase!)
                    }
                }
                break
            }
        }
    }
    
    private func setObjectValue(_ index: Int, isChild: Bool?, parentBase: BaseObject)
    {
        let singleGoalDetailsObject = SingleGoalDetails()
        if isChild! {
            let baseObject = parentBase.quesArray?[index]
            singleGoalDetailsObject.ques = baseObject?.ques
            singleGoalDetailsObject.anstype = baseObject?.anstype
            singleGoalDetailsObject.defaultOption = baseObject?.defaultOption
            singleGoalDetailsObject.goalcode = baseObject?.goalcode
            singleGoalDetailsObject.noOfoptions = baseObject?.noOfoptions
            singleGoalDetailsObject.questioncode = baseObject?.questioncode
            singleGoalDetailsObject.options = [SingleGoalOptionsArray]()
            for subindex in 0 ..< (baseObject?.options?.count)!{
                let optionsObject = baseObject?.options?[subindex]
                let singleOptionArray = SingleGoalOptionsArray()
                singleOptionArray.key = optionsObject?.key
                singleOptionArray.value = optionsObject?.value
                singleGoalDetailsObject.addOptionArray(singleOptionArray)
            }
        }else{
            let baseObject = parentBase
            singleGoalDetailsObject.ques = baseObject.ques
            singleGoalDetailsObject.anstype = baseObject.anstype
            singleGoalDetailsObject.defaultOption = baseObject.defaultOption
            singleGoalDetailsObject.goalcode = baseObject.goalcode
            singleGoalDetailsObject.noOfoptions = baseObject.noOfoptions
            singleGoalDetailsObject.questioncode = baseObject.questioncode
            singleGoalDetailsObject.options = [SingleGoalOptionsArray]()
            for subindex in 0 ..< (baseObject.options?.count)!{
                let optionsObject = baseObject.options?[subindex]
                let singleOptionArray = SingleGoalOptionsArray()
                singleOptionArray.key = optionsObject?.key
                if singleGoalDetailsObject.goalcode?.caseInsensitiveCompare(FincartCommon.GOAL_BANK_BALANCE) == ComparisonResult.orderedSame{
                    let rate = 0.1 * Double((subindex + 1))
                    singleOptionArray.value = self.getSavingFromIncome(self.userIncome!, rate: rate)
                }else
                {
                    singleOptionArray.value = optionsObject?.value
                }
                singleGoalDetailsObject.addOptionArray(singleOptionArray)
            }
        }
        singleGoalList?.addObject(singleGoalDetailsObject)
    }
    
    private func getDefaultOptions(){
        for index in 0 ..< (singleGoalList?.singleGoalDetailsList?.count)!
        {
            let baseObject = singleGoalList?.getObjectAtIndex(index)
            let defaultAnsOption = (baseObject?.defaultOption)!
            if defaultAnsOption.isEmpty{
                quesAnsArray.updateValue("", forKey: index)
            }
            else{
                for quesIndex in 0 ..< (baseObject?.options?.count)!{
                    if baseObject?.options?[quesIndex].key?.caseInsensitiveCompare(defaultAnsOption) == ComparisonResult.orderedSame{
                        quesAnsArray.updateValue((baseObject?.options?[quesIndex].value)!, forKey: index)
                    }
                }
            }
        }
    }
    
    private func displayAnsOptionType(_ansType: String, _quesString: String, _optionArray: [SingleGoalOptionsArray], _indexCount: Int)
    {
        questionLabel.text = _quesString
        questionLabelConstraint.constant = FincartCommon.calculateHeightForLabel(_quesString, width: self.questionLabel.frame.width, font: UIFont.systemFont(ofSize: 15, weight: .semibold))
        buttonIndexCount = 1
        updateImageView(_indexCount)
        if _ansType.caseInsensitiveCompare("checkbox") == ComparisonResult.orderedSame {
            setUpCheckBoxes(_optionArray, _indexCount: _indexCount)
        }
        else if _ansType.caseInsensitiveCompare("incredecre") == ComparisonResult.orderedSame {
            setUpIncrementButtons(_optionArray, _indexCount: _indexCount)
        }
        else if _ansType.caseInsensitiveCompare("scrollincredecre") == ComparisonResult.orderedSame{
            setUpScrollIncrement(_optionArray, _indexCount: _indexCount)
        }
        else if _ansType.caseInsensitiveCompare("textfield") == ComparisonResult.orderedSame {
            setUpTextField(_optionArray)
        }
    }
    
    private func updatingPreviousQues(){
        if navigationIndex == 0{
            self.navigationController?.popViewController(animated: true)
        }else{
            navigationIndex = navigationIndex - 1
            let baseObject  = singleGoalList?.getObjectAtIndex(navigationIndex)
            displayAnsOptionType(_ansType: (baseObject?.anstype)!, _quesString: (baseObject?.ques)!, _optionArray: (baseObject?.options)!, _indexCount: navigationIndex)
        }
    }
    
    private func updatingNextQues(){
        navigationIndex = navigationIndex + 1
        if navigationIndex < (singleGoalList?.singleGoalDetailsList?.count)!
        {
            let baseObject  = singleGoalList?.getObjectAtIndex(navigationIndex)
            displayAnsOptionType(_ansType: (baseObject?.anstype)!, _quesString: (baseObject?.ques)!, _optionArray: (baseObject?.options)!, _indexCount: navigationIndex)
        }else{
            navigationIndex = navigationIndex - 1
            questionFinished = true
            FinCartMacros.showSVProgressHUD()
            reviewTaggedQuestion()
        }
    }
    
    private func setUpCheckBoxes(_ optionArray: [SingleGoalOptionsArray], _indexCount: Int){
        optionsViewWidthConstraint.constant = self.view.frame.width - 32
        optionsViewHeightConstraint.constant = (optionHeight! * CGFloat(optionArray.count)) + CGFloat(5 * (optionArray.count - 1))
        let width = self.view.frame.width - 32
        for view in self.optionsView.subviews{
            optionsView.willRemoveSubview(view)
            view.removeFromSuperview()
        }
        let buttonArray: NSMutableArray = NSMutableArray()
        let mutableArray : NSMutableArray = NSMutableArray()
        var textValue = optionArray[0].value!
        let firstRadioButton: DLRadioButton = createRadioButton(CGRect(x: 0, y: 0, width: width, height: optionHeight!), _text: textValue, _indexCount: _indexCount)
        optionsView.addSubview(firstRadioButton)
        var leadingConstraint = NSLayoutConstraint(item: firstRadioButton, attribute:.leading, relatedBy: .equal, toItem: optionsView, attribute: .leading, multiplier: 1.0, constant: 0)
        var topConstraint = NSLayoutConstraint(item: firstRadioButton, attribute: .top, relatedBy: .equal, toItem: optionsView, attribute: .top, multiplier: 1.0, constant: 0)
        var heightConstraint = NSLayoutConstraint(item: firstRadioButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
        var trailingConstraint = NSLayoutConstraint(item: firstRadioButton, attribute: .trailing, relatedBy: .equal, toItem: optionsView, attribute: .trailing, multiplier: 1.0, constant: 0)
        firstRadioButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, topConstraint, trailingConstraint, heightConstraint])
        buttonArray.add(firstRadioButton)
        for index in 1 ..< (optionArray.count){
            textValue = optionArray[index].value!
            let secondRadioButton: DLRadioButton = createRadioButton(CGRect(x: 0, y: 0, width: width, height: optionHeight!), _text: textValue, _indexCount: _indexCount)
            optionsView.addSubview(secondRadioButton)
            leadingConstraint = NSLayoutConstraint(item: secondRadioButton, attribute:.leading, relatedBy: .equal, toItem: optionsView, attribute: .leading, multiplier: 1.0, constant: 0)
            topConstraint = NSLayoutConstraint(item: secondRadioButton, attribute: .top, relatedBy: .equal, toItem: buttonArray[index - 1], attribute: .bottom, multiplier: 1.0, constant: 10)
            heightConstraint = NSLayoutConstraint(item: secondRadioButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
            trailingConstraint = NSLayoutConstraint(item: secondRadioButton, attribute: .trailing, relatedBy: .equal, toItem: optionsView, attribute: .trailing, multiplier: 1.0, constant: 0)
            secondRadioButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([leadingConstraint, topConstraint, trailingConstraint, heightConstraint])
            buttonArray.add(secondRadioButton)
            mutableArray.add(secondRadioButton)
        }
        firstRadioButton.otherButtons = mutableArray as! [DLRadioButton]
    }
    
    private func setUpScrollIncrement(_ optionArray: [SingleGoalOptionsArray], _indexCount: Int){
        optionsViewWidthConstraint.constant = self.view.frame.width - 32
        optionsViewHeightConstraint.constant = optionHeight! + 5
        let width = self.view.frame.width - 32
        for view in self.optionsView.subviews{
            optionsView.willRemoveSubview(view)
            view.removeFromSuperview()
        }
        
        let minimiumValueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: optionHeight!, height: optionHeight!))
        minimiumValueLabel.textColor = UIColor.black
        minimiumValueLabel.textAlignment = .center
        optionsView.addSubview(minimiumValueLabel)
        var leadingConstraint = NSLayoutConstraint(item: minimiumValueLabel, attribute:.leading, relatedBy: .equal, toItem: optionsView, attribute: .leading, multiplier: 1.0, constant: 0)
        var vertialSpacing = NSLayoutConstraint(item: minimiumValueLabel, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        var heightConstraint = NSLayoutConstraint(item: minimiumValueLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
        var widthConstraint = NSLayoutConstraint(item: minimiumValueLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
        minimiumValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, vertialSpacing, heightConstraint, widthConstraint])
        
        slider = UISlider.init(frame: CGRect(x: 0, y: 0, width: width - ((optionHeight! + 10) * 2), height: optionHeight!))
        let intialValue = optionArray.first?.value
        let minimumValue = intialValue?.components(separatedBy: NSCharacterSet.decimalDigits.inverted
            ).joined(separator: "")
        let lastValue = optionArray.last?.value
        let maximumValue = lastValue?.components(separatedBy: NSCharacterSet.decimalDigits.inverted
            ).joined(separator: "")
        var defaultValue = ""
        defaultValue  = quesAnsArray[_indexCount]!
        let defaultRange = defaultValue.components(separatedBy: NSCharacterSet.decimalDigits.inverted
            ).joined(separator: "")
        slider?.minimumValue = (Float(minimumValue!))!
        slider?.maximumValue = (Float(maximumValue!))!
        slider?.setValue((Float(defaultRange))!, animated: true)
        slider?.isContinuous = true
        optionsView.addSubview(slider!)
        leadingConstraint = NSLayoutConstraint(item: slider!, attribute:.leading, relatedBy: .equal, toItem: minimiumValueLabel, attribute: .trailing, multiplier: 1.0, constant: 10)
        vertialSpacing = NSLayoutConstraint(item: slider!, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        heightConstraint = NSLayoutConstraint(item: slider!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
        slider?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, vertialSpacing, heightConstraint])
        nextButton.isEnabled = true
        
        let maximumValueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: optionHeight!, height: optionHeight!))
        maximumValueLabel.textColor = UIColor.black
        maximumValueLabel.textAlignment = .center
        optionsView.addSubview(maximumValueLabel)
        leadingConstraint = NSLayoutConstraint(item: maximumValueLabel, attribute:.leading, relatedBy: .equal, toItem: slider!, attribute: .trailing, multiplier: 1.0, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: maximumValueLabel, attribute:.trailing, relatedBy: .equal, toItem: optionsView, attribute: .trailing, multiplier: 1.0, constant: 0)
        vertialSpacing = NSLayoutConstraint(item: maximumValueLabel, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        heightConstraint = NSLayoutConstraint(item: maximumValueLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
        widthConstraint = NSLayoutConstraint(item: maximumValueLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: optionHeight!)
        maximumValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, vertialSpacing, heightConstraint, widthConstraint])
        
        minimiumValueLabel.text = minimumValue
        maximumValueLabel.text = maximumValue
    }
    
    private func setUpIncrementButtons(_ optionArray: [SingleGoalOptionsArray], _indexCount: Int){
        optionsViewWidthConstraint.constant = self.view.frame.width - 32
        let width = self.view.frame.width - 32
        optionsViewHeightConstraint.constant = optionHeight! + 5
        for view in self.optionsView.subviews{
            optionsView.willRemoveSubview(view)
            view.removeFromSuperview()
        }
        let height: CGFloat = optionHeight!
        let subtractButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: height, height: height))
        subtractButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        subtractButton.addTarget(self,action:#selector(incrementSubtract),
                                 for:.touchUpInside)
        subtractButton.setBackgroundImage(UIImage(named: "icon_subtract"), for: UIControlState.normal)
        optionsView.addSubview(subtractButton)
        var leadingConstraint = NSLayoutConstraint(item: subtractButton, attribute:.leading, relatedBy: .equal, toItem: optionsView, attribute: .leading, multiplier: 1.0, constant: 0)
        var verticalSpacing = NSLayoutConstraint(item: subtractButton, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        var heightConstraint = NSLayoutConstraint(item: subtractButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        var widthConstraint = NSLayoutConstraint(item: subtractButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, verticalSpacing, heightConstraint, widthConstraint])
        
        incrementLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: width - ((height * 2) + 20), height: height))
        ansText = quesAnsArray[_indexCount]
        incrementLabel?.text = ansText
        buttonIncrementMin = Int((optionArray.first?.value!.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: ""))!)!
        buttonIncrementMax = Int((optionArray.last?.value!.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: ""))!)!
        nextButton.isEnabled = true
        incrementLabel?.textColor = UIColor.white
        incrementLabel?.textAlignment = .center
        incrementLabel?.backgroundColor = UIColor(red: 10/255, green: 64/255, blue: 150/255, alpha: 1)
        optionsView.addSubview(incrementLabel!)
        leadingConstraint = NSLayoutConstraint(item: incrementLabel!, attribute:.leading, relatedBy: .equal, toItem: subtractButton, attribute: .trailing, multiplier: 1.0, constant: 10)
        verticalSpacing = NSLayoutConstraint(item: incrementLabel!, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        heightConstraint = NSLayoutConstraint(item: incrementLabel!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        incrementLabel?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, verticalSpacing, heightConstraint])
        
        let additionButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: height, height: height))
        additionButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        additionButton.addTarget(self,action:#selector(incrementAdded),
                                 for:.touchUpInside)
        additionButton.setBackgroundImage(UIImage(named: "icon_add"), for: UIControlState.normal)
        optionsView.addSubview(additionButton)
        leadingConstraint = NSLayoutConstraint(item: additionButton, attribute:.leading, relatedBy: .equal, toItem: incrementLabel!, attribute: .trailing, multiplier: 1.0, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: additionButton, attribute:.trailing, relatedBy: .equal, toItem: optionsView, attribute: .trailing, multiplier: 1.0, constant: 0)
        verticalSpacing = NSLayoutConstraint(item: additionButton, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        heightConstraint = NSLayoutConstraint(item: additionButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        widthConstraint = NSLayoutConstraint(item: additionButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        additionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, verticalSpacing, heightConstraint, widthConstraint])
    }
    
    private func setUpTextField(_ optionArray: [SingleGoalOptionsArray]){
        optionsViewWidthConstraint.constant = self.view.frame.width - 32
        let width = self.view.frame.width - 32
        for view in self.optionsView.subviews{
            optionsView.willRemoveSubview(view)
            view.removeFromSuperview()
        }
        let height: CGFloat = 100
        optionsViewHeightConstraint.constant = height + 5
        let textView = UITextView.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        textView.sizeToFit()
        textView.isScrollEnabled = true
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1.0;
        textView.layer.cornerRadius = 5.0;
        textView.delegate = self
        optionsView.addSubview(textView)
        let leadingConstraint = NSLayoutConstraint(item: textView, attribute:.leading, relatedBy: .equal, toItem: optionsView, attribute: .leading, multiplier: 1.0, constant: 0)
        let verticalSpacing = NSLayoutConstraint(item: textView, attribute: .centerY, relatedBy: .equal, toItem: optionsView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: textView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        let trailingConstraint = NSLayoutConstraint(item: textView, attribute: .trailing, relatedBy: .equal, toItem: optionsView, attribute: .trailing, multiplier: 1.0, constant: 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([leadingConstraint, verticalSpacing, heightConstraint, trailingConstraint])
    }
    
    private func createRadioButton(_ frame: CGRect, _text: String, _indexCount: Int) -> DLRadioButton{
        nextButton.isEnabled = false
        let radioButton: DLRadioButton = DLRadioButton.init(frame: frame)
        radioButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        radioButton.setTitle(_text, for: UIControlState.normal)
        radioButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        radioButton.iconSize = 25
        radioButton.indicatorSize = 15
        radioButton.iconStrokeWidth = 2
        radioButton.marginWidth = 10
        radioButton.iconColor = UIColor.blue
        radioButton.indicatorColor = UIColor.orange
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        radioButton.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        radioButton.marginWidth = 10
        radioButton.addTarget(self,action:#selector(radioButtonClicked),
                              for:.touchUpInside)
        radioButton.accessibilityIdentifier = _text
        ansText = quesAnsArray[_indexCount]
        if ansText?.caseInsensitiveCompare(radioButton.accessibilityIdentifier!) == ComparisonResult.orderedSame{
            radioButton.isSelected = true
            nextButton.isEnabled = true
        }
        return radioButton
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
        
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
    }
    
    //MARKS: - dismiss Keyboard
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        activeTextView?.resignFirstResponder()
        return true
    }
    
    private func tagQuestions(_ index: Int)
    {
        //FinCartMacros.showSVProgressHUD()
        var dictionary = Dictionary<String, String>()
        var string: String! = quesAnsArray[index]
        string = getNumericValueFromString(string)
        let baseObject = singleGoalList?.getObjectAtIndex(index)
        dictionary = FincartCommon.getTaggedQuestionDictionary(baseObject?.questioncode, goalCode: baseObject?.goalcode, answer: string, child: childCount!)
        self.view.isUserInteractionEnabled = false
        APIManager.sharedInstance.setQuestionTags(dictionary, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 {
                    if self.questionFinished! {
                        self.reviewTaggedQuestion()
                    }else
                    {
                        DispatchQueue.main.async(execute: {
                            self.view.isUserInteractionEnabled = true
                            self.updatingNextQues()
                        })
                    }
                }
                else if httpResponse.statusCode == 401 {
                    self.refreshAccessToken(false)
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func refreshAccessToken(_ isReviewService: Bool)
    {
        FincartCommon.refreshAccessToken(success: { (responseCode) in
            if responseCode == 200{
                if isReviewService{
                    self.reviewTaggedQuestion()
                }else{
                    self.tagQuestions(self.navigationIndex)
                }
            }else{
                self.getAccessToken(isReviewService)
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func getAccessToken(_ isReviewService: Bool)
    {
        FincartCommon.getAccessToken(success: { (responseCode) in
            if responseCode == 200{
                if isReviewService{
                    self.reviewTaggedQuestion()
                }else{
                    self.tagQuestions(self.navigationIndex)
                }
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
                    self.refreshAccessToken(true)
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
    
    private func getSavingFromIncome(_ income: Double, rate: Double) -> String
    {
        let savingValue = income * rate * 5
        var savingReturn = ""
        if savingValue >= 1000.00 && savingValue < 100000.00{
            savingReturn += String(format:"%.2f K", (savingValue/1000.00))
        }else if savingValue >= 100000.00 && savingValue < 10000000.00{
            savingReturn += String(format:"%.2f Lac", (savingValue/100000.00))
        }else if savingValue >= 10000000.00{
            savingReturn += String(format:"%.2f Cr", (savingValue/10000000.00))
        }
        return savingReturn
    }
    
    private func updateImageView(_ index:Int)
    {
        let baseObject = jsonObject?.baseObject![index]
        let stringValue = FincartCommon.getImageNameForGoalCode((baseObject?.goalcode)!)
        let scaledImage = UIImage(named: stringValue)
        scaledImage?.draw(in: CGRect(x: 0, y: 0, width: goalImageView.frame.size.width, height: goalImageView.frame.size.height))
        goalImageView.image = scaledImage
    }
    
    private func getOptionHeight(){
        if self.view.frame.size.height < 667{
            optionHeight = 30
        }else if self.view.frame.size.height < 812{
            optionHeight = 40
        }else {
            optionHeight = 50
        }
    }
    
    private func getNumericValueFromString(_ text: String) -> String{
        var string: String! = text
        if string.uppercased().contains("YEARS"){
            string = string.uppercased()
            let range = string.range(of: "YEARS")
            string.removeSubrange(range!)
            string = string.trimmingCharacters(in: .whitespaces)
        }else if string.uppercased().contains("YEAR"){
            string = string.uppercased()
            let range = string.range(of: "YEAR")
            string.removeSubrange(range!)
            string = string.trimmingCharacters(in: .whitespaces)
        }else if string.uppercased().contains("LAC"){
            string = string.uppercased()
            let range = string.range(of: "LAC")
            string.removeSubrange(range!)
            string = string.trimmingCharacters(in: .whitespaces)
            let amount = Double(string)! * 100000
            string = String(format:"%.0f", amount)
        }
        else if string.uppercased().contains("CR"){
            string = string.uppercased()
            let range = string.range(of: "CR")
            string.removeSubrange(range!)
            string = string.trimmingCharacters(in: .whitespaces)
            let amount = Double(string)! * 10000000
            string = String(format:"%.0f", amount)
        }
        return string
    }
}

