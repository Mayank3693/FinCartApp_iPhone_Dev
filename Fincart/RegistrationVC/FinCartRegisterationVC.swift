//
//  RegisterViewController.swift
//  Fincart
//
//  Created by Aman Taneja on 11/11/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import UIKit

class FinCartRegisterationVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var countrySTDCodeTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonAlreadyRegistered: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var registerButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageViewWidthConstraint: NSLayoutConstraint!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var activeField: UITextField!
    var registerServiceResponse: RegisterUserServiceResponse?
    var accessTokenServiceResponse: AccessTokenServiceResponse?
    var userDetailsServiceResponse: UserDetailsServiceResponse?
    private var usernameValue:String!
    private var passwordValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contentViewHeightConstraint.constant = self.buttonAlreadyRegistered.frame.origin.y + self.buttonAlreadyRegistered.frame.size.height + 8
        setupBackground()
        //Adding Keyboard Notification Observers
        addKeyboardNotificationObserver(addObserver: true)
        
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        if self.view.frame.size.width < 375{
            logoImageViewWidthConstraint.constant = 200
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.registerButtonWidthConstraint.constant = self.view.frame.size.width - 32
        addKeyboardNotificationObserver(addObserver: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupBackground() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background.jpg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    //MARKS: - Actions
    @IBAction func clickOnFacebookLogin(_ sender: UIButton) {
    }
    
    @IBAction func clickOnGoogleLogin(_ sender: UIButton) {
    }
    
    @IBAction func clickOnLinkedinLogin(_ sender: UIButton) {
    }
    
    @IBAction func clickOnRegistration(_ sender: UIButton) {
        if !Validation.validateEmail(emailTextField.text){
            let alert = UIAlertController(title: "Invalid Email Address", message: "Please enter valid email address.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 0.5
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
//        else if !Validation.validateMobile(mobileTextField.text){
//            let alert = UIAlertController(title: "Invalid Mobile Number", message: "Not a valid mobile number(should contains 10 digits)", preferredStyle: UIAlertControllerStyle.alert)
//            self.present(alert, animated: true)
//            // duration in seconds
//            let duration: Double = 0.5
//
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
//                alert.dismiss(animated: true)
//            }
//        }
        else if !Validation.validatePassword(passwordTextField.text){
            let alert = UIAlertController(title: "Invalid Password", message: "Not a valid password(must not include spaces or special charcters and should contain more than 5 characters)", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 0.5
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
        else{
            FinCartMacros.showSVProgressHUD()
            registerAction()
        }
    }
    
    @IBAction func clickOnAlreadyRegistered(_ sender: UIButton) {
        self.appDelegate.showLoginScreen()
    }
    
    //MARKS: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.userNameTextField {
            self.emailTextField.becomeFirstResponder()
        }
        else if textField == self.emailTextField{
            self.mobileTextField.becomeFirstResponder()
        }
        else if textField == self.mobileTextField{
            self.passwordTextField.becomeFirstResponder()
        }
        else if textField == self.passwordTextField{
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.countrySTDCodeTextField {
            return false
        }
        else{
            return true
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
    
    //Marks:- Private methods
    private func registerAction(){
        var userDetails = Dictionary<String, String>()
        usernameValue = emailTextField.text!
        passwordValue = passwordTextField.text!
        userDetails.updateValue(userNameTextField.text!, forKey: FinCartMacros.kName)
        userDetails.updateValue(usernameValue, forKey: FinCartMacros.kUserID)
        userDetails.updateValue(passwordValue, forKey: FinCartMacros.kPassword)
        userDetails.updateValue("IOS", forKey: FinCartMacros.kClientStatus)
        userDetails.updateValue(mobileTextField.text!, forKey: FinCartMacros.kMobile)
        userDetails.updateValue("", forKey: FinCartMacros.kCompanyCode)
        userDetails.updateValue("", forKey: FinCartMacros.kClientStatus)
        APIManager.sharedInstance.registerUser(userDetails, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
                     if let StringResponse = String(data: data! as! Data, encoding: String.Encoding.utf8) as String! {
                        do{
                            self.registerServiceResponse = try RegisterUserServiceResponse(StringResponse)
                            if self.registerServiceResponse?.status?.caseInsensitiveCompare("success") == ComparisonResult.orderedSame{
                                self.loginUserAction()
                            }
                            else
                            {
                                SVProgressHUD.dismiss()
                                self.alertController("Registeration Failed", message: "Email Already registered. Please another email")
                            }
                        }catch{}
                    }
                }else
                {
                    SVProgressHUD.dismiss()
                    self.alertController("Registeration Failed", message: "Please try again to register the account.")
                }
            }
            else{
                SVProgressHUD.dismiss()
                self.alertController("Server Error", message: "Server is not responding, please try after sometime.")
            }
        }) { (error) in
            SVProgressHUD.dismiss()
            self.alertController("Error", message: error.localizedDescription)
        }
    }
    
    private func loginUserAction(){
        var userDetails = Dictionary<String, String>()
        userDetails.updateValue(usernameValue, forKey: FinCartMacros.kUserName)
        userDetails.updateValue(passwordValue, forKey: FinCartMacros.kUserPassword)
        userDetails.updateValue(FinCartMacros.kFinCartGrantType, forKey: FinCartMacros.kGrantType)
        userDetails.updateValue(FinCartMacros.kFincartClientID, forKey: FinCartMacros.kClientID)
        userDetails.updateValue(FinCartMacros.kFinCartClientSecret, forKey: FinCartMacros.kClientSecret)
        APIManager.sharedInstance.getAccessToken(userDetails, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    do
                    {
                        self.accessTokenServiceResponse = try AccessTokenServiceResponse(data: data as! Data)
                        FinCartUserDefaults.sharedInstance.saveAccessToken(self.accessTokenServiceResponse?.accessToken)
                        FinCartUserDefaults.sharedInstance.saveRefershToken(self.accessTokenServiceResponse?.refreshToken)
                        FinCartUserDefaults.sharedInstance.saveTokenType(self.accessTokenServiceResponse?.tokenType)
                        self.fetchUserDetails()
                    }catch{}
                }
                else{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.alertForLoginFailure()
                    })
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertForLoginFailure()
            })
        }
    }
    
    private func fetchUserDetails(){
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.fetchUserDetails(access_token!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
                    do{
                        self.userDetailsServiceResponse = try UserDetailsServiceResponse(data: data as! Data)
                        FinCartUserDefaults.sharedInstance.saveUserFullName((self.userDetailsServiceResponse?.cafDetails!["ClientName"])!)
                        FinCartUserDefaults.sharedInstance.saveMobile((self.userDetailsServiceResponse?.cafDetails!["Mobile"])!)
                        FinCartUserDefaults.sharedInstance.saveUserName((self.userDetailsServiceResponse?.cafDetails!["UserId"])!)
                        FinCartUserDefaults.sharedInstance.saveUserImageURL((self.userDetailsServiceResponse?.cafDetails!["profilePic"])!)
                        FinCartUserDefaults.sharedInstance.saveUserPassword((self.userDetailsServiceResponse?.cafDetails!["UserPass"])!)
                        FinCartUserDefaults.sharedInstance.saveKycStatus((self.userDetailsServiceResponse?.cafDetails!["kycStatus"])!)
                        FinCartUserDefaults.sharedInstance.saveIsLoggedin(true)
                    }catch{}
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.appDelegate.setUpRootViewController()
                    })
                }
                else{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.alertForLoginFailure()
                    })
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertForLoginFailure()
            })
        }
    }
    
    private func alertForLoginFailure(){
        let alert = UIAlertController(title: "Registration Status", message: "Your account registered successfully. Please try to login", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel) { (alertAction) in
            self.appDelegate.showLoginScreen()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
            self.passwordTextField.text = ""
            self.passwordTextField.becomeFirstResponder()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
