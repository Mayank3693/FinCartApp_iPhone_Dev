//
//  LoginViewController.swift
//  Fincart
//
//  Created by Vinay Kharb on 9/30/17.
//  Modified by Kamal Sharma on 1/1/18
//  Copyright © 2017 IVP. All rights reserved.
//

import UIKit
import QuartzCore

class FinCartLoginVC: UIViewController, UITextFieldDelegate{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerNowButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googlePlusButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var signButtonWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var logoImageViewWidthConstraint: NSLayoutConstraint!
    
    var accessTokenServiceResponse: AccessTokenServiceResponse?
    var userDetailsServiceResponse: UserDetailsServiceResponse?
    var activeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar for current view controller
        self.contentViewHeightConstraint.constant = self.registerNowButton.frame.origin.y + self.registerNowButton.frame.size.height
        self.signButtonWidthConstraint.constant = self.view.frame.size.width - 32
        //Adding Keyboard Notification Observers
        setupBackground()
        addKeyboardNotificationObserver(addObserver: true)
        
        //Adding Tap Gesture not dismiss keyboard if clicked outside of textfield
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        if self.view.frame.size.width < 375
        {
            logoImageViewWidthConstraint.constant = 200
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar on other view controllers
        addKeyboardNotificationObserver(addObserver: false)
    }
    
    func setupBackground() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background.jpg")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Actions
    @IBAction func signInButtonClicked(_ sender: UIButton) {
        if !Validation.validateEmail(userName.text){
            let alert = UIAlertController(title: "Invalid Email Address", message: "Please enter valid email address.", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
        else if !Validation.validatePassword(userPassword.text){
            let alert = UIAlertController(title: "Invalid Password", message: "Not a valid password(must not include spaces or special charcters and should contain more than 5 characters)", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true)
            // duration in seconds
            let duration: Double = 1.0
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
        else{
            FinCartMacros.showSVProgressHUD()
            loginUserAction()
        }
    }
    
    @IBAction func forgotPasswordButtonClicked(_ sender: UIButton){
        appDelegate.showForgotPasswordScreen()
    }
    
    @IBAction func registerNowButtonClicked(_ sender: UIButton){
        appDelegate.showRegistrationScreen()
    }
    
    @IBAction func faceBookButtonClicked(_ sender: UIButton){
        
    }
    
    @IBAction func googlePlusButtonClicked(_ sender: UIButton){
        
    }
    
    @IBAction func linkedinButtonClicked(_ sender: UIButton){
        
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.userName {
            self.userPassword.becomeFirstResponder()
        }
        else if textField == self.userPassword{
            self.userPassword.resignFirstResponder()
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
    
    //MARKS: - dismiss Keyboard
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    //MARKS:- private methods
    private func loginUserAction(){
        var userDetails = Dictionary<String, String>()
        userDetails.updateValue(userName.text!, forKey: FinCartMacros.kUserName)
        userDetails.updateValue(FinCartMacros.kFinCartGrantType, forKey: FinCartMacros.kGrantType)
        userDetails.updateValue(userPassword.text!, forKey: FinCartMacros.kUserPassword)
        userDetails.updateValue(FinCartMacros.kFincartClientID, forKey: FinCartMacros.kClientID)
        userDetails.updateValue(FinCartMacros.kFinCartClientSecret, forKey: FinCartMacros.kClientSecret)
        APIManager.sharedInstance.getAccessToken(userDetails, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
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
                        self.alertController("Login Failed", message: "Username or password may be incorrect. Please check the credentials")
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
                        self.alertController("Login Failed", message: "Username or password may be incorrecr. Please check the credentials")
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
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
            self.userPassword.text = ""
            self.userName.becomeFirstResponder()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}

