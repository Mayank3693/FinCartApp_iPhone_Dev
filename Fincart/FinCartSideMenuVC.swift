//
//  FinCartSideMenuVC.swift
//  Fincart
//
//  Created by Kamal on 09/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import RESideMenu

class FinCartSideMenuVC : RESideMenu, RESideMenuDelegate, FinCartLeftMenuVCDelegate{
    var showLeftMenuOnViewDidAppear: Bool = true
    var selectionIndex: NSInteger = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func awakeFromNib(){
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.lightContent
        self.contentViewShadowColor = UIColor.black
        self.contentViewShadowOffset = CGSize(width: 0, height: 0)
        self.contentViewShadowOpacity = 0.6;
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = true;
        self.contentViewScaleValue = 0.85;
        
        if UIScreen.main.bounds.size.width >= 414 {
            self.contentViewInPortraitOffsetCenterX  = 110.0
        }
        else if (UIScreen.main.bounds.size.width > 320 && UIScreen.main.bounds.size.width < 414)
        {
            self.contentViewInPortraitOffsetCenterX  = 100.0
            
        }
        else
        {
            self.contentViewInPortraitOffsetCenterX  = 90.0;
        }
        
        self.contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "contentVC") as UIViewController!
        
        // ContentVC
        self.selectionIndex = 0;
        let finCartLeftMenuVC: FinCartLeftMenuVC! = (self.storyboard?.instantiateViewController(withIdentifier: "finCartLeftMenuVC") as UIViewController!) as! FinCartLeftMenuVC!
        finCartLeftMenuVC.fincartLeftMenuVCDelegate = self;
        self.leftMenuViewController = finCartLeftMenuVC
        self.rightMenuViewController = nil
        self.delegate = self
    }
    
    //MARKS:- RESideMenuDelegate
    func sideMenu(_ sideMenu: RESideMenu!, didRecognizePanGesture recognizer: UIPanGestureRecognizer!) {
        //
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, didHideMenuViewController menuViewController: UIViewController!) {
        //
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, didShowMenuViewController menuViewController: UIViewController!) {
        //
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, willHideMenuViewController menuViewController: UIViewController!) {
        //
    }
    
    func sideMenu(_ sideMenu: RESideMenu!, willShowMenuViewController menuViewController: UIViewController!) {
        //
    }
    
    //MARKS: - FinCartLeftMenuVCDelegate Protocol
    func leftMenu(_ leftMenuVC: FinCartLeftMenuVC!, selectionIndex: NSInteger) {
        switch selectionIndex {
        case 6:
            showKYC()
            break
        case 7:
            showGoals()
            break
        case 12:
            logout()
        default:
            break
        }
    }
    
    //MARKS: -
    public func populateDashboard(){
        let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "contentVC")
        self.setContentViewController(contentVC, animated: true)
        self.hideViewController()
    }
    
    private func showKYC()
    {
        let contentVC=self.storyboard?.instantiateViewController(withIdentifier: "FinCartKYCCheckNavigationVC")
        self.setContentViewController(contentVC, animated: true)
        self.hideViewController()
    }
    
    private func showGoals()
    {
        let contentVC=self.storyboard?.instantiateViewController(withIdentifier: "finCartGoalsNavigationVC")
        self.setContentViewController(contentVC, animated: true)
        self.hideViewController()
    }
    
    private func logout(){
        FinCartUserDefaults.sharedInstance.saveAccessToken(nil)
        FinCartUserDefaults.sharedInstance.saveRefershToken(nil)
        FinCartUserDefaults.sharedInstance.saveTokenType(nil)
        self.appDelegate.showLoginScreen()
    }
    
}
