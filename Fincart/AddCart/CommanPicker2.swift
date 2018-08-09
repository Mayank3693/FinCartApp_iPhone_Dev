//
//  CommanPicker2.swift
//  Fincart
//
//  Created by Pankaj Raghav on 09/08/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//



import UIKit
import Foundation
//import SwiftyJSON

let kSearchPickerData2 = "pickerDataNotification2"

public enum TextFieldTag2:Int {
    
    case First_TF_Tag = 1
    case Second_TF_Tag = 2
   
    
}

class CommanPicker2:UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    //MARK:- ################# Class Variable ################################
    
    var currentArray = [String]()
    var currentTextField = UITextField()
    var _categoryTextFieldIndex: Int = 0
    let _newPickerView = UIPickerView()
    
    
    
    //Singleton Instance :-
    static let sharedInstance  = CommanPicker2 ()
    
    
    
    //MARK:- ###################  Calling method for ViewControllers #########
    
    func myPickerViewSetup(textField:UITextField, withArray pickerArray:[String], andTextFieldIndex textFieldIndex:TextFieldTag2, withVC vc:Any) -> Void {
        
        
        currentArray = pickerArray
        currentTextField = textField
        
        let controller = vc as! UIViewController
        let picker = self.getPickerView()
        _categoryTextFieldIndex = textFieldIndex.rawValue
        let toolBar = self.addToolBar(controller)
        
        picker.addSubview(toolBar)
        
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
        
        textField.inputView = picker
        textField.inputAccessoryView = toolBar
        
        
    }
    
    
    //MARK:- ############# Create Picker View ########################
    
    func getPickerView() -> UIPickerView {
        _newPickerView.dataSource = self
        _newPickerView.delegate = self
        _newPickerView.backgroundColor = UIColor.white
        _newPickerView.showsSelectionIndicator = true
        return _newPickerView
    }
    
    
    //MARK:- ################### Add ToolBar On Picker ##############
    
    func addToolBar(_ currentView: UIViewController) -> UIToolbar {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: currentView.view.frame.size.width, height: 40))
        toolBar.barStyle = .default
        toolBar.barTintColor = UIColor.darkGray
        let barButtonDone = UIBarButtonItem(title: "Done", style: .done, target: currentView, action: #selector(pickerToolBarAction))
        
        toolBar.items = [barButtonDone]
        barButtonDone.tintColor = UIColor.white
        return toolBar
    }
    
    
    
    //MARK:- ################### ToolBar Selector Method ###########
    
    @objc func pickerToolBarAction(_ sender: Any) {
        
    }
    
    
    //MARK:- ############# Picker Delegete Methods #################
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currentArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch _categoryTextFieldIndex {
         
            
        case TextFieldTag2(rawValue: TextFieldTag2.First_TF_Tag.rawValue)!.rawValue:
            return currentArray[row]
            
            
        case TextFieldTag2(rawValue: TextFieldTag2.Second_TF_Tag.rawValue)!.rawValue:
            return currentArray[row]
            
        
            
        default:
            return ""
            //            return  (currentArray.count > 0) ? currentArray[0].stringValue : "";
            
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectData(textFieldIndex: _categoryTextFieldIndex,index: row)
    }
    
    func selectData(textFieldIndex :Int ,index :Int) {
   
        var dataString : String = ""
        
        switch textFieldIndex {
        case TextFieldTag2(rawValue: TextFieldTag2.First_TF_Tag.rawValue)!.rawValue:
            dataString = currentArray[index]
            break
            
        case TextFieldTag2(rawValue: TextFieldTag2.Second_TF_Tag.rawValue)!.rawValue:
           dataString = currentArray[index]
            break
      
            
        default:
            break
        }
        
        
        let  dict:[String :Any] = ["dataField": dataString,"indexTag":textFieldIndex]
        
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: kSearchPickerData2) , object: nil, userInfo: dict)
        
    }
    
    
}


