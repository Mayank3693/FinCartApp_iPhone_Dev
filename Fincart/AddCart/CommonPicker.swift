

import UIKit
import Foundation
//import SwiftyJSON
 
 let kSearchPickerData = "pickerDataNotification"

public enum TextFieldTag:Int {
    
    case Invest_TF_Tag = 1
    case Account_TF_Tag = 2
    case Mandate_TF_Tag = 3
    case Bank_TF_Tag = 4
    case Folio_TF_Tag = 5
    case Divident_TF_Tag = 6
    case SipDate_TF_Tag = 7
    case SipTill_TF_Tag = 8
    
}

class CommonPicker:UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    //MARK:- ################# Class Variable ################################
    
    var currentArray = [[String : Any]]()
    var currentTextField = UITextField()
    var _categoryTextFieldIndex: Int = 0
    let _newPickerView = UIPickerView()
    
    
    
    //Singleton Instance :-
    static let sharedInstance  = CommonPicker ()
    
    
    
    //MARK:- ###################  Calling method for ViewControllers #########
    
    func myPickerViewSetup(textField:UITextField, withArray pickerArray:[[String : Any]], andTextFieldIndex textFieldIndex:TextFieldTag, withVC vc:Any) -> Void {
        
        
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
            
//        case Invest_TF_Tag = 1
//        case Account_TF_Tag = 2
//        case Mandate_TF_Tag = 3
//        case Bank_TF_Tag = 4
//        case Folio_TF_Tag = 5
//        case Divident_TF_Tag = 6
//        case SipDate_TF_Tag = 7
//        case SipTill_TF_Tag = 8
            
        case TextFieldTag(rawValue: TextFieldTag.Invest_TF_Tag.rawValue)!.rawValue:
            return currentArray[row]["username"] as? String ?? "N/A"
            
            
        case TextFieldTag(rawValue: TextFieldTag.Account_TF_Tag.rawValue)!.rawValue:
            return "\(currentArray[row]["FirstApplicant"] as? String ?? "N/A") - Joint1 - \(currentArray[row]["SecondApplicant"] as? String ?? "N/A") - Joint2 - \(currentArray[row]["ThirdApplicant"] as? String ?? "N/A")"
            
        case TextFieldTag(rawValue: TextFieldTag.Mandate_TF_Tag.rawValue)!.rawValue:
            return currentArray[row][""] as? String ?? ""
            
        case TextFieldTag(rawValue: TextFieldTag.Bank_TF_Tag.rawValue)!.rawValue:
            return "\(currentArray[row]["Bank_Name"] as? String ?? "N/A") - \(currentArray[row]["Acc_no"] as? String ?? "N/A")"
            
        case TextFieldTag(rawValue: TextFieldTag.Folio_TF_Tag.rawValue)!.rawValue:
            return currentArray[row]["FolioNo"] as? String ?? "N/A"
            
            
        case TextFieldTag(rawValue: TextFieldTag.Divident_TF_Tag.rawValue)!.rawValue:
            return currentArray[row][""] as? String ?? ""
            
        case TextFieldTag(rawValue: TextFieldTag.SipDate_TF_Tag.rawValue)!.rawValue:
            return currentArray[row][""] as? String ?? ""
            
        case TextFieldTag(rawValue: TextFieldTag.SipTill_TF_Tag.rawValue)!.rawValue:
            return currentArray[row][""] as? String ?? ""
            
        default:
            return ""
//            return  (currentArray.count > 0) ? currentArray[0].stringValue : "";
            
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectData(textFieldIndex: _categoryTextFieldIndex,index: row)
    }
    
    func selectData(textFieldIndex :Int ,index :Int) {
        //        case Invest_TF_Tag = 1
        //        case Account_TF_Tag = 2
        //        case Mandate_TF_Tag = 3
        //        case Bank_TF_Tag = 4
        //        case Folio_TF_Tag = 5
        //        case Divident_TF_Tag = 6
        //        case SipDate_TF_Tag = 7
        //        case SipTill_TF_Tag = 8
        var dataString : String = ""
        
        switch textFieldIndex {
        case TextFieldTag(rawValue: TextFieldTag.Invest_TF_Tag.rawValue)!.rawValue:
           dataString = currentArray[index]["username"] as? String ?? "N/A"
            break
            
        case TextFieldTag(rawValue: TextFieldTag.Account_TF_Tag.rawValue)!.rawValue:
            dataString = "\(currentArray[index]["FirstApplicant"] as? String ?? "N/A") - Joint1 - \(currentArray[index]["SecondApplicant"] as? String ?? "N/A") - Joint2 - \(currentArray[index]["ThirdApplicant"] as? String ?? "N/A")"
            break
            
            
        case TextFieldTag(rawValue: TextFieldTag.Mandate_TF_Tag.rawValue)!.rawValue:
            dataString = currentArray[index][""] as? String ?? ""
            break
            
            
        case TextFieldTag(rawValue: TextFieldTag.Bank_TF_Tag.rawValue)!.rawValue:
            dataString = "\(currentArray[index]["Bank_Name"] as? String ?? "N/A") - \(currentArray[index]["Acc_no"] as? String ?? "N/A")"
            break
            
        case TextFieldTag(rawValue: TextFieldTag.Folio_TF_Tag.rawValue)!.rawValue:
            dataString = currentArray[index]["FolioNo"] as? String ?? "N/A"
            
            break
            
        case TextFieldTag(rawValue: TextFieldTag.Divident_TF_Tag.rawValue)!.rawValue:
            dataString = currentArray[index][""] as? String ?? ""
            break
            
            
        case TextFieldTag(rawValue: TextFieldTag.SipDate_TF_Tag.rawValue)!.rawValue:
            dataString = currentArray[index][""] as? String ?? ""
            break
            
            
        case TextFieldTag(rawValue: TextFieldTag.SipTill_TF_Tag.rawValue)!.rawValue:
            dataString = currentArray[index][""] as? String ?? ""
            break
            
            
        default:
           break
        }
        
        
        let  dict:[String :Any] = ["dataField": dataString,"indexTag":textFieldIndex]

        NotificationCenter.default.post(name:NSNotification.Name(rawValue: kSearchPickerData) , object: nil, userInfo: dict)
        
    }
    

}

