//
//  FincartCommon.swift
//  Fincart
//
//  Created by Kamal on 22/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class FincartCommon: NSObject {
    
    static let SLIDER_CHANGE_BY_MONTHLY: Int = 1001
    static let SLIDER_CHANGE_BY_ONETIME: Int = 1002
    static let BY_MONTHLY: Int = 1003
    static let BY_ONE_TIME: Int = 1004
    
    static let FULL_FINANCIAL="C5"
    static let GOAL_PLANING_KIDS="FG11"
    static let GOAL_STUDIES="FG5"
    static let GOAL_OWN_WEDDING="FG7"
    static let GOAL_TRAVEL_PLAN="FG6"
    static let GOAL_TIME_OFF="FG10"
    static let GOAL_OWN_BUSINESS="FG2"
    static let GOAL_HOUSE="FG4"
    static let GOAL_CAR="FG3"
    static let GOAL_BIKE="FG1"
    static let GOAL_BANK_BALANCE="FG8"
    static let GOAL_RETIRE="FG9"
    static let GOAL_OTHER="other"
    static let GOAL_OTHER_CODE="FG14"
    static let GOAL_CHILD_EDUCATION="001"
    static let GOAL_CHILD_WEDDING="002"
    static let GOAL_HAVING_KIDS="003"
    static let GOAL_RETIRE_QUES_CODE="FG9"
    static let CHILD_EDU_GOAL="FG12"
    static let CHILD_EDU_QUES="FQ47"
    static let CHILD_EDU_LOC_GOAL="FG12"
    static let CHILD_EDU_LOC_QUES="FQ48"
    static let CHILD_WEDS_GOAL="FG13"
    static let CHILD_WEDS_QUES="FQ49"
    static let CHILD_EDU_WEDS_GOAL="FG13"
    static let CHILD_EDU_WEDS_QUES="FQ50"
    static let CHILD_TELL_US_GOAL="FG12"
    static let CHILD_TELL_US_QUES="FQ7"
    static let EMERGENCY_GOAL="FG17"
    
    static func refreshAccessToken(success: @escaping (_ responseCode: Int) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        let refreshToken = FinCartUserDefaults.sharedInstance.retrieveRefershToken()
        var userDetails = Dictionary<String, String>()
        userDetails.updateValue(refreshToken!, forKey: FinCartMacros.kRefreshToken)
        userDetails.updateValue("refresh_token", forKey: FinCartMacros.kGrantType)
        userDetails.updateValue(FinCartMacros.kFincartClientID, forKey: FinCartMacros.kClientID)
        userDetails.updateValue(FinCartMacros.kFinCartClientSecret, forKey: FinCartMacros.kClientSecret)
        APIManager.sharedInstance.getAccessToken(userDetails, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
                    do
                    {
                        let accessTokenServiceResponse = try AccessTokenServiceResponse(data: data as! Data)
                        FinCartUserDefaults.sharedInstance.saveAccessToken(accessTokenServiceResponse.accessToken)
                        FinCartUserDefaults.sharedInstance.saveRefershToken(accessTokenServiceResponse.refreshToken)
                        FinCartUserDefaults.sharedInstance.saveTokenType(accessTokenServiceResponse.tokenType)
                    }catch{}
                }
                success(httpResponse.statusCode)
            }
        }) { (error) in
            failure(error)
        }
    }
    
    static func getAccessToken(success: @escaping (_ responseCode: Int) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        let userID = FinCartUserDefaults.sharedInstance.retrieveUserName()
        let password = FinCartUserDefaults.sharedInstance.retrievePassword()
        var userDetails = Dictionary<String, String>()
        userDetails.updateValue(userID!, forKey: FinCartMacros.kUserName)
        userDetails.updateValue(FinCartMacros.kFinCartGrantType, forKey: FinCartMacros.kGrantType)
        userDetails.updateValue(password!, forKey: FinCartMacros.kUserPassword)
        userDetails.updateValue(FinCartMacros.kFincartClientID, forKey: FinCartMacros.kClientID)
        userDetails.updateValue(FinCartMacros.kFinCartClientSecret, forKey: FinCartMacros.kClientSecret)
        APIManager.sharedInstance.getAccessToken(userDetails, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{
                    do
                    {
                        let accessTokenServiceResponse = try AccessTokenServiceResponse(data: data as! Data)
                        FinCartUserDefaults.sharedInstance.saveAccessToken(accessTokenServiceResponse.accessToken)
                        FinCartUserDefaults.sharedInstance.saveRefershToken(accessTokenServiceResponse.refreshToken)
                        FinCartUserDefaults.sharedInstance.saveTokenType(accessTokenServiceResponse.tokenType)
                    }catch{}
                }
                success(httpResponse.statusCode)
            }
        }) { (error) in
            failure(error)
        }
    }
    
    static func getTaggedQuestionDictionary(_ questionCode: String!, goalCode: String!, answer: String!, child: Int) -> Dictionary<String, String>
    {
        var dictionary = Dictionary<String, String>()
        dictionary.updateValue("", forKey: "ID")
        dictionary.updateValue(questionCode, forKey: "Code")
        dictionary.updateValue(goalCode, forKey: "GoalCode")
        dictionary.updateValue(FincartGoalCodes.getCodeForSelectedOption(goalCode, questionCode: questionCode, answer: answer, child: child), forKey: "Answer")
        dictionary.updateValue("AAPP", forKey: "Device")
        dictionary.updateValue("", forKey: "BrowserIp")
        dictionary.updateValue(FinCartUserDefaults.sharedInstance.retrieveUserName()!, forKey: "CreatedByEmail")
        dictionary.updateValue(FinCartUserDefaults.sharedInstance.retrieveMobile()!, forKey: "CreatedByMobile")
        dictionary.updateValue("", forKey: "Desc")
        dictionary.updateValue("", forKey: "AnswerType")
        dictionary.updateValue("", forKey: "Device_Version")
        dictionary.updateValue("", forKey: "BrowserId")
        dictionary.updateValue("", forKey: "CreatedDatetime")
        dictionary.updateValue("", forKey: "UpdatedByEmail")
        dictionary.updateValue("", forKey: "UpdatedByMobile")
        dictionary.updateValue("", forKey: "UpdatedDatetime")
        dictionary.updateValue("", forKey: "Status")
        return dictionary
    }
    
    static func getImageNameForGoalCode(_ goalCode: String) -> String
    {
        var dictionary = Dictionary<String, String>()
        dictionary.updateValue("default_user", forKey: FincartCommon.GOAL_PLANING_KIDS)
        dictionary.updateValue("house_goal_main", forKey: FincartCommon.GOAL_HOUSE)
        dictionary.updateValue("car_goal_main", forKey: FincartCommon.GOAL_CAR)
        dictionary.updateValue("bike_goal_main", forKey: FincartCommon.GOAL_BIKE)
        dictionary.updateValue("wedding_main", forKey: FincartCommon.GOAL_OWN_WEDDING)
        dictionary.updateValue("travel_goal_main", forKey: FincartCommon.GOAL_TRAVEL_PLAN)
        dictionary.updateValue("default_user", forKey: FincartCommon.GOAL_TIME_OFF)
        dictionary.updateValue("bank_goal_main", forKey: FincartCommon.GOAL_BANK_BALANCE)
        dictionary.updateValue("retirement_goal_main", forKey: FincartCommon.GOAL_RETIRE)
        dictionary.updateValue("startup_goal_main", forKey: FincartCommon.GOAL_OWN_BUSINESS)
        dictionary.updateValue("default_user", forKey: FincartCommon.GOAL_STUDIES)
        dictionary.updateValue("other_goal_main", forKey: FincartCommon.GOAL_OTHER)
        dictionary.updateValue("child_education_goal_main", forKey: FincartCommon.GOAL_CHILD_EDUCATION)
        dictionary.updateValue("default_user", forKey: FincartCommon.GOAL_CHILD_WEDDING)
        if dictionary.keys.contains(goalCode){
            return dictionary[goalCode]!
        }else{
            return "default_user"
        }
    }
    
    static func calculateHeightForLabel(_ value: String, width: CGFloat, font: UIFont) -> CGFloat{
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = (value as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        let height = ceil(boundingBox.height)
        return height
    }    
}
