//
//  Utils.swift
//  Pipeline
//
//  Created by Chetan Aggarwal on 21/10/16.
//  Copyright © 2016 Indus Valley Partners. All rights reserved.
//

import UIKit
import PopupDialog

class Utils: NSObject {
    
    var popup:PopupDialog!
    
    let dialogAppearance = PopupDialogDefaultView.appearance()
    
    func popUp(title:String,message:String){
        
        popup = PopupDialog(title: title, message: message)
        let buttonOne = CancelButton(title: "OK"){
            
        }
        popup.addButtons([buttonOne])
        
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    class func dataFromJSON(_ jsonObject: Any?) -> Data? {
        
        guard let lJSON = jsonObject else {
            return nil
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: lJSON, options: .prettyPrinted)
            return data
        }
        catch {
            return nil
        }
    }
    
    class func JSONFromData(_ data: Data) -> Any?{
        
        do {
            let config = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return config as AnyObject
        }
        catch {
            return nil
        }
    }

    class func stringFromData(_ data: Data?) -> String? {
        guard let _ = data else {
            return nil
        }
        
        return NSString(data:data!, encoding:String.Encoding.utf8.rawValue) as String?
    }
    
    class func isValidString(_ string: String?) -> Bool {
        if string != nil && !string!.isEmpty && string != "" && string != "<null>" && string != "NULL" {
            return true
        }
        else {
            return false
        }
    }
    
    class func isValidPassword(_ password: String?) -> Bool {
        if password != nil && !password!.isEmpty && password != "" && password!.count > 3 {
            return true
        }
        else {
            return false
        }
    }
    
    class func isValidDouble(_ number: Any?) -> Bool {
        
        if number != nil {
            if let _ = number as? Double {
                return true
            }
        }
        return false
    }
    
    class func newError(_ domain: String = kStringComIvpMobility, code: Int = 0, localizedDesc: String) -> NSError {
        return NSError(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey : localizedDesc])
    }
    
    class func defaultNotificationCenter() -> NotificationCenter {
        return NotificationCenter.default
    }
}
