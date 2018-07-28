//
//  TransactVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 23/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class TransactVC: UIViewController {
    @IBOutlet var transactBtnHeight: NSLayoutConstraint!
    @IBOutlet var transactMainViewHeight: NSLayoutConstraint!
    @IBOutlet var transBtn: UIButton!
    @IBOutlet var notSatisfiedMainView: UIView!
    @IBOutlet var proceedMainView: UIView!
    
    @IBOutlet var proceedBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         proceedBtn.layer.cornerRadius = 15.0
        notSatisfiedMainView.layer.cornerRadius = 5.0
        notSatisfiedMainView.dropShadow()
        proceedMainView.isHidden = true
        
       setUpBackButton()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func setUpBackButton(){
       
              let  imageName = "back_arrow";
             let   selector = #selector(back(_:))
        
            let leftBarButtonItem: UIBarButtonItem! = UIBarButtonItem.init(image: UIImage(named: imageName), style: UIBarButtonItemStyle.plain, target: self, action: selector)
            self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    }
    
    @objc func back(_ barButtonItem: UIBarButtonItem) {
        if(!proceedMainView.isHidden){
            
            transactMainViewHeight.constant = 220.0
            transactBtnHeight.constant = 40.0
            transBtn.isHidden = false
            proceedMainView.isHidden = true
            
        }
        else{
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
 
    @IBAction func transBtnAction(_ sender: Any) {
        
        
        transactMainViewHeight.constant = 180.0
        transactBtnHeight.constant = 0.0
        transBtn.isHidden = true
        proceedMainView.isHidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension UIView {
    

    func dropShadow(scale: Bool = true) {
   
       layer.shadowColor = UIColor.gray.cgColor
       layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
       layer.shadowRadius = 6
    }
    
   
}
