//
//  FinCartMacros.swift
//  Fincart
//
//  Created by Kamal on 15/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FinCartMacros{
    
    //Constant Values
    static let kFinCartClientSecret = "264e3285b0934defa5067bfb4bc9d682"
    static let kFincartClientID = "fincartApp"
    static let kFinCartGrantType = "password"
    
    //MARKS:- storyboard identifiers
    
    //MARKS:- API Urls
    static let kBaseUrl = "https://api.fincart.com/"
    static let kFinTokenUrl = "fintoken"
    static let kFinLoggedInDetailsUrl = "api/user/LoggedInDetails"
    static let kFinRegistrationUrl = "api/user/app/register"
    static let kFinForgotPasswordOTP = "api/user/forgotPasswordOTP"
    static let KFinFetchAllGoals = "/api/goal/fetch/all/app"
    static let kFinCheckPanStatusUrl = "api/user/panexist"
    static let kFinKYCStatusUrl = "api/caf/kycstatus"
    static let kFinCheckIfsc = "api/invest/bankbranch/IFSC"
    static let kFinEKYCUrl = "https://api.fincart.com/ekyc.aspx"
    static let kFinUploadSignature = "api/document/signSpecimen/"
    static let kFinAppFullSave = "api/caf/appFullSave"
    static let kFinResetTaggedQuestions = "api/question/reset/taggedquestions"
    static let kFinBulkTagsURL = "api/question/bulk/tag"
    static let kQuestionTagURL = "api/question/tag"
    static let kReviewTaggedGoals = "api/goal/review"
    static let kRemoveReviewGoals = "api/goal/remove/{goalcode}"
    static let kSaveReviewURL = "api/goal/save/app"
    static let kUserGoalStatusURL = "api/goal/fetch/all/app"
    static let kSaveSingleGoalURL = "api/goal/save/single/app"
    static let kUpdateEditGoal = "api/goal/update/app"
    static let kFetchSavedGoalsCode = "/api/goal/fetchSavedGoalCodes"
    
    //MARKS:- API's params and user defaults keys
    static let kIsUserRegistered = "isUserRegistered"
    static let kIsUserLoggedIn = "isUserLoggedIn"
    static let kIsGoal = "isGoal"
    static let kIsFirstTimeLogin = "isFirstTimeLogin"
    static let kIsDeviceRegistered = "isDeviceRegistered"
    static let kUserName = "username"
    static let kUserPassword = "password"
    static let kGrantType = "grant_type"
    static let kClientID = "client_id"
    static let kClientSecret = "client_secret"
    static let kAccessToken = "access_token"
    static let kTokenType = "token_type"
    static let kExpiresIn = "expires_in"
    static let kRefreshToken = "refresh_token"
    static let kName = "Name"
    static let kUserID = "Userid"
    static let kClientStatus = "ClientStatus"
    static let kMobile = "Mobile"
    static let kCompanyCode = "companyCode"
    static let kCompanyName = "companyName"
    static let kPassword = "Password"
    static let kUserFullName = "userFullName"
    static let kUserImage = "userImage"
    static let kUserImageURL = "userImageURL"
    static let kRegistrationStatus = "status"
    static let kEmail = "email"
    static let kBasicId = "BasicId"
    static let kInvestorType = "InvestorType"
    static let kPan = "Pan"
    static let kAadhar = "Aadhar"
    static let kOccupation = "Occupation"
    static let kAnnualIncome = "Income"
    static let kIfsc = "Ifsc"
    static let kAccountType = "AccountType"
    static let kAccountNo = "AccountNo"
    static let kAccountHolderName = "AccountHolderName"
    static let kIncomeSource = "IncomeSource"
    static let kFirstNomineeName = "FirstNomineeName"
    static let kFirstNomineeDob = "FirstNomineeDob"
    static let kFirstNomineeShare = "FirstNomineeShare"
    static let kFirstNomineeRelation = "FirstNomineeRelation"
    static let kSecondNomineeName = "SecondNomineeName"
    static let kSecondNomineeDob = "SecondNomineeDob"
    static let kSecondNomineeShare = "SecondNomineeShare"
    static let kSecondNomineeRelation = "SecondNomineeRelation"
    static let kThirdNomineeName = "ThirdNomineeName"
    static let kThirdNomineeDob = "ThirdNomineeDob"
    static let kThirdNomineeShare = "ThirdNomineeShare"
    static let kThirdNomineeRelation = "ThirdNomineeRelation"
    static let kBankAddress = "BankAddress"
    static let kBankCity = "BankCity"
    static let kMicr = "Micr"
    static let kBankName = "BankName"
    static let kNriName = "NriName"
    static let kNriCountry = "NriCountry"
    static let kPoliticallyExposed = "PoliticallyExposed"
    static let kFirstTaxCountry = "FirstTaxCountry"
    static let kFirstIdNo = "FirstIdNo"
    static let kFirstIdType = "FirstIdType"
    static let kSecondTaxCountry = "SecondTaxCountry"
    static let kSecondIdNo = "SecondIdNo"
    static let kSecondIdType = "SecondIdType"
    static let kThirdTaxCountry = "ThirdTaxCountry"
    static let kThirdIdNo = "ThirdIdNo"
    static let kThirdIdType = "ThirdIdType"
    static let kDob = "Dob"
    static let kState = "State"
    static let kPincode = "Pincode"
    static let kAddress = "Address"
    static let kCity = "City"
    static let kBranch = "Branch"
    static let kKycStatus = "KycStatus"
    
    static func showSVProgressHUD()
    {
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.setRingNoTextRadius(40)
        SVProgressHUD.setRingThickness(2)
        SVProgressHUD.setForegroundColor(UIColor(red: 1/255, green: 86/255, blue: 167/255, alpha: 1))
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        // SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat)
        SVProgressHUD.show(withStatus: "Please wait ...")
    }
}
