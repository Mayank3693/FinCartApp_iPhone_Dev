//
//  AppDelegate.swift
//  Fincart
//
//  Created by Vinay Kharb on 9/30/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import UIKit
import RESideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var fincartSideMenuVC: FinCartSideMenuVC?
    var hideLeftMenu: Bool! = false
    let access_token: String? = nil
    let refresh_token: String? = nil
    //dsabs.kjabafjf
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        setupPageControl()
        isUserLoggedIn()
        setUpRootViewController()
        
        print("Application did finish launching")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func showFatalErrorMsg(msg: String){
        let alertController = UIAlertController(title: "Something went wrong!!", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        alertController.addAction(okAction)
        
        UIApplication.shared.delegate?.window??.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    public func setUpRootViewController(){
        if !showWalkThrough() {
            showDashboardScreen()
        }
        if (self.window?.rootViewController is FinCartSideMenuVC) {
            self.fincartSideMenuVC = self.window?.rootViewController as? FinCartSideMenuVC
        }
        else{
            self.fincartSideMenuVC = nil
        }
    }
    
    func showGoalsReviewScreen(){
        //goalsReviewNavigationVC
    }
    
    func showWalkThrough() -> Bool{
        let finCartUSerDefaults = FinCartUserDefaults.sharedInstance;
        if !finCartUSerDefaults.retrieveIsLoggedIn() {
            if (!(self.window?.rootViewController is FinCartWalkThroughVC)){
                setupWalkThroughAsRootViewController()
            }
            else{
                
            }
            return true
        }
        return false
    }
    
    func showLoginScreen(){
        if (!(self.window?.rootViewController is FinCartLoginVC)){
            setupLoginControllerAsRootViewController()
        }
        if (self.window?.rootViewController is FinCartSideMenuVC) {
            self.fincartSideMenuVC = self.window?.rootViewController as? FinCartSideMenuVC
        }
        else{
            self.fincartSideMenuVC = nil
        }
    }
    
    func showRegistrationScreen(){
        if (!(self.window?.rootViewController is FinCartRegisterationVC)){
            setupRegistrationControllerAsRootViewController()
        }
        if (self.window?.rootViewController is FinCartSideMenuVC) {
            self.fincartSideMenuVC = self.window?.rootViewController as? FinCartSideMenuVC
        }
        else{
            self.fincartSideMenuVC = nil
        }
    }
    
    func showForgotPasswordScreen(){
        if (!(self.window?.rootViewController is ForgotPasswordVC)){
            setupForgotPasswordControllerAsRootViewController()
        }
        if (self.window?.rootViewController is FinCartSideMenuVC) {
            self.fincartSideMenuVC = self.window?.rootViewController as? FinCartSideMenuVC
        }
        else{
            self.fincartSideMenuVC = nil
        }
    }
    
    func showGetOTPVCScreen(){
        if (!(self.window?.rootViewController is GetOTPVC)){
            setupGetOtpControllerAsRootViewController()
        }
        if (self.window?.rootViewController is FinCartSideMenuVC) {
            self.fincartSideMenuVC = self.window?.rootViewController as? FinCartSideMenuVC
        }
        else{
            self.fincartSideMenuVC = nil
        }
    }
    
    func showResetPasswordScreen(){
        if (!(self.window?.rootViewController is ResetPasswordVC)){
            setupResetPasswordControllerAsRootViewController()
        }
        if (self.window?.rootViewController is FinCartSideMenuVC) {
            self.fincartSideMenuVC = self.window?.rootViewController as? FinCartSideMenuVC
        }
        else{
            self.fincartSideMenuVC = nil
        }
    }
    
    func setupWalkThroughAsRootViewController(){
        let storyBoard:UIStoryboard! = self.window?.rootViewController?.storyboard
        let finCartWalkThroughVC: FinCartWalkThroughVC! = storyBoard.instantiateViewController(withIdentifier: "finCartWalkThrough") as! FinCartWalkThroughVC
        animateAddRootViewController(finCartWalkThroughVC) { (finished) in
            if finished{
                
            }
        }
    }
    
    func setupLoginControllerAsRootViewController(){
        let storyBoard:UIStoryboard! = self.window?.rootViewController?.storyboard
        let fincartLogInVC: FinCartLoginVC! = storyBoard.instantiateViewController(withIdentifier: "userLoginScreen") as! FinCartLoginVC
        animateAddRootViewController(fincartLogInVC) { (finished) in
            if finished{
                
            }
        }
    }
    
    func setupRegistrationControllerAsRootViewController(){
        let storyBoard:UIStoryboard! = self.window?.rootViewController?.storyboard
        let finCartRegistrationVC: FinCartRegisterationVC! = storyBoard.instantiateViewController(withIdentifier: "userRegisterScreen") as! FinCartRegisterationVC
        animateAddRootViewController(finCartRegistrationVC) { (finished) in
            if finished{
                
            }
        }
    }
    
    func setupForgotPasswordControllerAsRootViewController(){
        let storyBoard:UIStoryboard! = self.window?.rootViewController?.storyboard
        let forgotPasswordVC: ForgotPasswordVC! = storyBoard.instantiateViewController(withIdentifier: "forgotPasswordVC") as! ForgotPasswordVC
        animateAddRootViewController(forgotPasswordVC) { (finished) in
            if finished{
                
            }
        }
    }
    
    func setupGetOtpControllerAsRootViewController(){
        let storyBoard:UIStoryboard! = self.window?.rootViewController?.storyboard
        let getOtpVC: GetOTPVC! = storyBoard.instantiateViewController(withIdentifier: "getOtpVC") as! GetOTPVC
        animateAddRootViewController(getOtpVC) { (finished) in
            if finished{
                
            }
        }
    }
    
    func setupResetPasswordControllerAsRootViewController(){
        let storyBoard:UIStoryboard! = self.window?.rootViewController?.storyboard
        let resetPassword: ResetPasswordVC! = storyBoard.instantiateViewController(withIdentifier: "resetPasswordVC") as! ResetPasswordVC
        animateAddRootViewController(resetPassword) { (finished) in
            if finished{
                
            }
        }
    }
    
    func showDashboardScreen(){
        let rootVC: FinCartSideMenuVC! = self.window?.rootViewController as? FinCartSideMenuVC
        if (rootVC === FinCartSideMenuVC.self)
        {
            rootVC.showLeftMenuOnViewDidAppear = !self.hideLeftMenu!;
            self.fincartSideMenuVC?.populateDashboard()
        }
        else
        {
            let storyboard = self.window?.rootViewController?.storyboard;
            let rootVC: FinCartSideMenuVC! = storyboard?.instantiateViewController(withIdentifier: "fincartSideMenuRootVC") as! FinCartSideMenuVC
            rootVC.showLeftMenuOnViewDidAppear = !(self.hideLeftMenu!);
            self.animateAddRootViewController(rootVC, completionHandler: { (finished) in
                if finished{
                    
                }
            })
        }
        self.fincartSideMenuVC = rootVC;
    }
    
    func animateAddRootViewController(_ viewController: UIViewController!, completionHandler: @escaping (_ finshed:Bool)->Void){
        let view: UIView! = self.window?.rootViewController?.view.snapshotView(afterScreenUpdates: true)
        self.window?.rootViewController = viewController
        self.window?.addSubview(view)
        UIView.transition(with: view, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            view.alpha = 0.0
        }, completion:{ finished in
                view.removeFromSuperview()
            completionHandler(finished)
        })
    }
    
    private func isUserLoggedIn(){
        let finCartUSerDefaults = FinCartUserDefaults.sharedInstance;
        let access_token : String! = finCartUSerDefaults.retrieveAccessToken();
        if access_token == nil {
            finCartUSerDefaults.saveIsLoggedin(false)
        }else{
            
        }
    }
    
    private func setupPageControl() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor(red: 196/255, green: 34/255, blue: 76/255, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 244/255, green: 113/255, blue: 248/255, alpha: 1)
    }
}

