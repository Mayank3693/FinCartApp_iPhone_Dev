//
//  FullViewFirstVC.swift
//  Fincart
//
//  Created by mayank on 23/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import CarbonKit

class FullViewFirstVC: UIViewController,CarbonTabSwipeNavigationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let items = ["Features", "Products", "About"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        // return viewController at index
        guard let storyboard = storyboard else { return UIViewController() }
        if index == 0 {
            return storyboard.instantiateViewController(withIdentifier: "FullViewFirstVC")
        }
        return storyboard.instantiateViewController(withIdentifier: "FullViewSecondVC")
//        else if index == 1{
//            return storyboard.instantiateViewController(withIdentifier: "FullViewSecondVC")
//        }else{
//            return storyboard.instantiateViewController(withIdentifier: "FullViewThirdVC")
//        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
