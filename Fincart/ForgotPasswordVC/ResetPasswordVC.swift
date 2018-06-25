//
//  ResetPasswordVC.swift
//  Fincart
//
//  Created by Kamal on 19/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController, UITextFieldDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var activeField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: RoundRectUIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFields(emailIdTextField, "ic_email_profile")
        setUpTextFields(passwordTextField, "ic_padlock")
        addKeyboardNotificationObserver(addObserver: true)
        
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let height = submitButton.frame.origin.y + submitButton.frame.size.height
        if height > self.view.frame.height {
            containerViewHeightConstraint.constant = height
        }
        else{
            containerViewHeightConstraint.constant = self.view.frame.size.height + 30
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addKeyboardNotificationObserver(addObserver: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailIdTextField{
            self.passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            self.passwordTextField.resignFirstResponder()
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
    
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if !Validation.validateEmail(emailIdTextField.text){
            let alert = UIAlertController(title: "Invalid Email Address", message: "Please enter valid email address.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 0.5
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }else if !Validation.validatePassword(passwordTextField.text){
            let alert = UIAlertController(title: "Invalid Password", message: "Please enter valid password.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 0.5
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
        else{
            appDelegate.showLoginScreen()
        }
    }
    
    //MARKS:- Private methods
    private func setUpTextFields(_ activeField: UITextField, _ imageName: String){
        activeField.attributedPlaceholder = NSAttributedString(string: activeField.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 124/255, green: 122/255, blue: 122/255, alpha: 1)])
        let leftAddView = UIView.init(frame: CGRect(x: 0, y: 0, width : activeField.frame.size.height, height : activeField.frame.size.height))
        let leftimageView = UIImageView.init(frame: CGRect(x:(leftAddView.frame.size.width/2) - 13, y: (leftAddView.frame.size.height/2) - 13, width:26, height:26))
        leftimageView.image = UIImage(named: imageName)
        leftAddView.addSubview(leftimageView)
        activeField.leftView = leftAddView
        activeField.textColor = UIColor.black
        activeField.leftViewMode = UITextFieldViewMode.always
        activeField.layer.masksToBounds = true
        activeField.layer.cornerRadius = activeField.frame.size.height/2
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
    
    //MARKS: - dismiss Keyboard
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
}
