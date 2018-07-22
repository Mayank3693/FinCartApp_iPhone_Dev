//
//  FinCartViewController.swift
//  Fincart
//
//  Created by Kamal on 09/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FinCartViewController: UIViewController{
    
    func setUpBackButton(){
        if self.navigationController != nil {
            
            let viewControllerCount: NSInteger! = self.navigationController?.viewControllers.count
            var imageName: String = "";
            var selector: Selector! = nil
            //SEL selector = NULL;
            
            if (viewControllerCount ==  1 || viewControllerCount == 3)
            {
                imageName = "menu";
                selector = #selector(showMenu(_:))
            }
            else if (viewControllerCount > 1)
            {
                imageName = "back_arrow";
                selector = #selector(goBack(_:))
            }
            let leftBarButtonItem: UIBarButtonItem! = UIBarButtonItem.init(image: UIImage(named: imageName), style: UIBarButtonItemStyle.plain, target: self, action: selector)
            self.navigationItem.leftBarButtonItem = leftBarButtonItem;
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    //<--- Shadow effect on view ---->
    func setOpacity(view : UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 5
    }
    
    func setupOpaqueNavigationBar(){
        self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func showMenu(_ barButtonItem: UIBarButtonItem){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.fincartSideMenuVC?.presentLeftMenuViewController()
    }
    
    @objc func goBack(_ barButtonItem: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
}
