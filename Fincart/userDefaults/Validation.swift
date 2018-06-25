//
//  Validation.swift
//  Fincart
//
//  Created by Kamal on 13/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class Validation: NSObject{
    
    static func validateEmail(_ emailID: String!) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if(emailID != nil || !emailID.isEmpty){
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: emailID)
        }
        else{
            return false
        }
    }
    
    static func validatePassword(_ password: String!) -> Bool{
        if(password != nil || !password.isEmpty){
            return password.count > 5
        }
        else{
            return false
        }
    }
    
    static func confirmPassword(_ password: String!, _ confirmPassword: String!) -> Bool{
        if(password != nil || confirmPassword != nil || !password.isEmpty || !confirmPassword.isEmpty){
            return password.elementsEqual(confirmPassword)
        }else{
            return false
        }
    }
    
    static func validateMobile(_ mobile: String!) -> Bool{
        let mobileRegex = "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[6789]\\d{9}$"
        if(mobile != nil || !mobile.isEmpty){
            let mobileTest = NSPredicate(format:"SELF MATCHES %@", mobileRegex)
            return mobileTest.evaluate(with: mobile)
        }else{
            return false
        }
    }
    
    static func  validateOTP(_ otp: String!) -> Bool{
        //let mobileRegex = "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[6789]\\d{9}$"
        if(otp != nil || !otp.isEmpty){
            return true
        }else{
            return false
        }
    }
    
    static func validateUserFullName(_ userName: String!) -> Bool{
        if userName.isEmpty{
            return false
        }
        else{
            return true
        }
    }
    
    static func validateUserAge(_ userAge: String!) -> Bool{
        if (userAge.count == 0){
            return false
        }
        else{
            return true
        }
    }
    
    static func validateMonthlyIncome(_ monthlyIncome: String!) -> Bool{
        if monthlyIncome.isEmpty{
            return false
        }
        else{
            return true
        }
    }
    
    static func validateMonthlyExpense(_ monthlyExpense: String!) -> Bool{
        if monthlyExpense.isEmpty{
            return false
        }
        else{
            return true
        }
    }
    
    static func validateMartialStatus(_ martialStatus: String?) -> Bool{
        if let status = martialStatus{
            return true
        }else{
            return false
        }
    }
    
    static func validateGenderCategory(_ genderCategory: String!) -> Bool{
        if let status = genderCategory{
            return true
        }else{
            return false
        }
    }
    
}
