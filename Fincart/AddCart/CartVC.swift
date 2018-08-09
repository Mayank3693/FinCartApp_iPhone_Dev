//
//  CartVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 09/08/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class CartVC: FinCartViewController,UITextFieldDelegate {
 
    @IBOutlet var firstTF: UITextField!
    @IBOutlet var secondTF: UITextField!
    var firstArr  = [String]()
    var secondArr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          firstArr = ["a","b","c"]
          secondArr = ["d","e","f"]
        setupOpaqueNavigationBar()
        setUpBackButton()
        self.navigationItem.title="Cart"
self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:UIColor.white]
       

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
           NotificationCenter.default.addObserver(self, selector: #selector(self.updateValue(_:)), name: NSNotification.Name(rawValue: kSearchPickerData2), object: nil)
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstTF {
            CommanPicker2.sharedInstance.myPickerViewSetup(textField: textField, withArray: (self.firstArr as? [String])! , andTextFieldIndex: TextFieldTag2(rawValue: TextFieldTag2.First_TF_Tag.rawValue)!, withVC: self)
        }
        else if textField == secondTF {
            CommanPicker2.sharedInstance.myPickerViewSetup(textField: textField, withArray: (self.secondArr as? [String])! , andTextFieldIndex: TextFieldTag2(rawValue: TextFieldTag2.Second_TF_Tag.rawValue)!, withVC: self)
        }
        
    }
    
    @objc func pickerToolBarAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    
    //MARK:-  Notification Center observer  
    @objc func updateValue(_ notification: NSNotification) {
        
        
     
        if let data = notification.userInfo{
            
            if let index = data["indexTag"] as? Int {
                
                switch Int(index){
                    
                case TextFieldTag2(rawValue: TextFieldTag2.First_TF_Tag.rawValue)!.rawValue:
                    firstTF.text = data["dataField"] as? String
                    break
                    
                case TextFieldTag2(rawValue: TextFieldTag2.Second_TF_Tag.rawValue)!.rawValue:
                    secondTF.text = data["dataField"] as? String
                    break
                    
                default:
                    print("Default")
                    
                }
            }
        }
        
        print(notification.userInfo ?? "")
        
        
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
