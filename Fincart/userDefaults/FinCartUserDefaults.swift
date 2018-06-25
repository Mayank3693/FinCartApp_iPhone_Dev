//
//  FinCartUserDefaults.swift
//  Fincart
//
//  Created by Kamal on 15/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

class FinCartUserDefaults : NSObject{
    
    var isUserLoggedIn: Bool?
    var isFirstTimeLogin: Bool?
    var isUserRegistered: Bool?
    var isDeviceTokenRegistered: Bool?
    var tokenType: String?
    var userName: String?
    var userPassword: String?
    var accessToken: String?
    var refreshToken: String?
    var userImageURL: String?
    var userFullName: String?
    var mobile: String?
    var basicId: String?
    var investorType: String?
    var pan: String?
    var name: String?
    var aadhar: String?
    var occupation: String?
    var annualIncome: String?
    var ifsc: String?
    var accountType: String?
    var accountNo: String?
    var accountHolderName: String?
    var incomeSource: String?
    var firstNomineeName: String?
    var firstNomineeDob: String?
    var firstNomineeShare: String?
    var firstNomineeRelation: String?
    var secondNomineeName: String?
    var secondNomineeDob: String?
    var secondNomineeShare: String?
    var secondNomineeRelation: String?
    var thirdNomineeName: String?
    var thirdNomineeDob: String?
    var thirdNomineeShare: String?
    var thirdNomineeRelation: String?
    var bankAddress: String?
    var bankCity: String?
    var micr: String?
    var bankName: String?
    var nriName: String?
    var nriCountry: String?
    var politicallyExposed: String?
    var firstTaxCountry: String?
    var firstIdNo: String?
    var firstIdType: String?
    var secondTaxCountry: String?
    var secondIdNo: String?
    var secondIdType: String?
    var thirdTaxCountry: String?
    var thirdIdNo: String?
    var thirdIdType: String?
    var dob: String?
    var state: String?
    var pincode: String?
    var address: String?
    var city: String?
    var branch: String?
    var kycStatus: String?

    static let sharedInstance = FinCartUserDefaults()
    
    private override init() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "WebKitDiskImageCacheEnabled")
        //Need to set userImage
        isUserLoggedIn = userDefaults.bool(forKey: FinCartMacros.kIsUserLoggedIn)
        isFirstTimeLogin = userDefaults.bool(forKey: FinCartMacros.kIsFirstTimeLogin)
        userName = userDefaults.string(forKey: FinCartMacros.kUserName)
        userPassword = userDefaults.string(forKey: FinCartMacros.kUserPassword)
        isDeviceTokenRegistered = userDefaults.bool(forKey: FinCartMacros.kIsDeviceRegistered)
        accessToken = userDefaults.string(forKey: FinCartMacros.kAccessToken)
        refreshToken = userDefaults.string(forKey: FinCartMacros.kRefreshToken)
        isUserRegistered = userDefaults.bool(forKey: FinCartMacros.kIsUserRegistered)
        userFullName = userDefaults.string(forKey: FinCartMacros.kUserFullName)
        userImageURL = userDefaults.string(forKey: FinCartMacros.kUserImageURL)
        mobile = userDefaults.string(forKey: FinCartMacros.kMobile)
        basicId = userDefaults.string(forKey: FinCartMacros.kBasicId)
        investorType = userDefaults.string(forKey: FinCartMacros.kInvestorType)
        pan = userDefaults.string(forKey: FinCartMacros.kPan)
        name = userDefaults.string(forKey: FinCartMacros.kName)
        aadhar = userDefaults.string(forKey: FinCartMacros.kAadhar)
        occupation = userDefaults.string(forKey: FinCartMacros.kOccupation)
        annualIncome = userDefaults.string(forKey: FinCartMacros.kAnnualIncome)
        ifsc = userDefaults.string(forKey: FinCartMacros.kIfsc)
        accountType = userDefaults.string(forKey: FinCartMacros.kAccountType)
        accountNo = userDefaults.string(forKey: FinCartMacros.kAccountNo)
        accountHolderName = userDefaults.string(forKey: FinCartMacros.kAccountHolderName)
        incomeSource = userDefaults.string(forKey: FinCartMacros.kIncomeSource)
        firstNomineeName = userDefaults.string(forKey: FinCartMacros.kFirstNomineeName)
        firstNomineeDob = userDefaults.string(forKey: FinCartMacros.kFirstNomineeDob)
        firstNomineeShare = userDefaults.string(forKey: FinCartMacros.kFirstNomineeShare)
        firstNomineeRelation = userDefaults.string(forKey: FinCartMacros.kFirstNomineeRelation)
        secondNomineeName = userDefaults.string(forKey: FinCartMacros.kSecondNomineeName)
        secondNomineeDob = userDefaults.string(forKey: FinCartMacros.kSecondNomineeDob)
        secondNomineeShare = userDefaults.string(forKey: FinCartMacros.kSecondNomineeShare)
        secondNomineeRelation = userDefaults.string(forKey: FinCartMacros.kSecondNomineeRelation)
        thirdNomineeName = userDefaults.string(forKey: FinCartMacros.kThirdNomineeName)
        thirdNomineeDob = userDefaults.string(forKey: FinCartMacros.kThirdNomineeDob)
        thirdNomineeShare = userDefaults.string(forKey: FinCartMacros.kThirdNomineeShare)
        thirdNomineeRelation = userDefaults.string(forKey: FinCartMacros.kThirdNomineeRelation)
        bankAddress = userDefaults.string(forKey: FinCartMacros.kBankAddress)
        bankCity = userDefaults.string(forKey: FinCartMacros.kBankCity)
        micr = userDefaults.string(forKey: FinCartMacros.kMicr)
        bankName = userDefaults.string(forKey: FinCartMacros.kBankName)
        nriName = userDefaults.string(forKey: FinCartMacros.kNriName)
        nriCountry = userDefaults.string(forKey: FinCartMacros.kNriCountry)
        firstTaxCountry = userDefaults.string(forKey: FinCartMacros.kFirstTaxCountry)
        firstIdNo = userDefaults.string(forKey: FinCartMacros.kFirstIdNo)
        firstIdType = userDefaults.string(forKey: FinCartMacros.kFirstIdType)
        secondTaxCountry = userDefaults.string(forKey: FinCartMacros.kSecondTaxCountry)
        secondIdNo = userDefaults.string(forKey: FinCartMacros.kSecondIdNo)
        secondIdType = userDefaults.string(forKey: FinCartMacros.kSecondIdType)
        thirdTaxCountry = userDefaults.string(forKey: FinCartMacros.kThirdTaxCountry)
        thirdIdNo = userDefaults.string(forKey: FinCartMacros.kThirdIdNo)
        thirdIdType = userDefaults.string(forKey: FinCartMacros.kThirdIdType)
        politicallyExposed = userDefaults.string(forKey: FinCartMacros.kPoliticallyExposed)
        dob = userDefaults.string(forKey: FinCartMacros.kDob)
        state = userDefaults.string(forKey: FinCartMacros.kState)
        pincode = userDefaults.string(forKey: FinCartMacros.kPincode)
        address = userDefaults.string(forKey: FinCartMacros.kAddress)
        city = userDefaults.string(forKey: FinCartMacros.kCity)
        branch = userDefaults.string(forKey: FinCartMacros.kBranch)
        kycStatus = userDefaults.string(forKey: FinCartMacros.kKycStatus)
        tokenType = userDefaults.string(forKey: FinCartMacros.kTokenType)
    }
    
    func saveUserName(_ userName: String!){
        if userName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kUserName)
        }else{
            UserDefaults.standard.set(userName, forKey: FinCartMacros.kUserName)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveUserPassword(_ password: String!){
        if password == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kUserPassword)
        }else{
            UserDefaults.standard.set(password, forKey: FinCartMacros.kUserPassword)
        }
        UserDefaults.standard.synchronize()
    }

    
    func saveAccessToken(_ accessToken: String!){
        if accessToken == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAccessToken)
        }else{
            UserDefaults.standard.set(accessToken, forKey: FinCartMacros.kAccessToken)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveRefershToken(_ refreshToken: String!){
        if refreshToken == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kRefreshToken)
        }else{
            UserDefaults.standard.set(refreshToken, forKey: FinCartMacros.kRefreshToken)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveTokenType(_ tokenType: String!){
        if tokenType == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kTokenType)
        }else{
            UserDefaults.standard.set(tokenType, forKey: FinCartMacros.kTokenType)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveUserFullName(_ userFullName: String!) {
        if userFullName == nil{
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kUserFullName)
        }else{
           UserDefaults.standard.set(userFullName, forKey: FinCartMacros.kUserFullName)
        }
    }
    
    func saveUserImageURL(_ userImageURL: String!){
        if userImageURL == nil{
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kUserImageURL)
        }else{
            UserDefaults.standard.set(userImageURL, forKey: FinCartMacros.kUserImageURL)
        }
    }
    
    func saveMobile(_ mobile: String!){
        if mobile == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kMobile)
        }else{
            UserDefaults.standard.set(mobile, forKey: FinCartMacros.kMobile)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveBasicId(_ basicId: String!){
        if basicId == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kBasicId)
        }else{
            UserDefaults.standard.set(basicId, forKey: FinCartMacros.kBasicId)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveIsGoal(_ isGoal: Bool!){
        if isGoal ==  nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kIsGoal)
        }else{
            UserDefaults.standard.set(isGoal, forKey: FinCartMacros.kIsGoal)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveIsLoggedin(_ isLoggedIn: Bool!){
        if isLoggedIn ==  nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kIsUserLoggedIn)
        }else{
            UserDefaults.standard.set(isLoggedIn, forKey: FinCartMacros.kIsUserLoggedIn)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveIsUserRegistered(_ isUserRegistered: Bool!){
        if isUserRegistered ==  nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kIsUserRegistered)
        }else{
            UserDefaults.standard.set(isUserRegistered, forKey: FinCartMacros.kIsUserRegistered)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveInvestorTypeKey(_ investorType: String!){
        if investorType == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kInvestorType)
        }else{
            UserDefaults.standard.set(investorType, forKey: FinCartMacros.kInvestorType)
        }
        UserDefaults.standard.synchronize()
    }
    func saveOccupationKey(_ occupation: String!){
        if occupation == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kOccupation)
        }else{
            UserDefaults.standard.set(occupation, forKey: FinCartMacros.kOccupation)
        }
        UserDefaults.standard.synchronize()
    }
    func saveAnnualIncomeKey(_ annualIncome: String!){
        if annualIncome == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAnnualIncome)
        }else{
            UserDefaults.standard.set(annualIncome, forKey: FinCartMacros.kAnnualIncome)
        }
        UserDefaults.standard.synchronize()
    }
    
   
    func savePan(_ pan: String!){
        if pan == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kPan)
        }else{
            UserDefaults.standard.set(pan, forKey: FinCartMacros.kPan)
        }
        UserDefaults.standard.synchronize()
    }
    func saveName(_ name: String!){
        if name == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kName)
        }else{
            UserDefaults.standard.set(name, forKey: FinCartMacros.kName)
        }
        UserDefaults.standard.synchronize()
    }
    func saveAadhar(_ aadhar: String!){
        if aadhar == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAadhar)
        }else{
            UserDefaults.standard.set(aadhar, forKey: FinCartMacros.kAadhar)
        }
        UserDefaults.standard.synchronize()
    }
    func saveIfsc(_ ifsc: String!){
        if ifsc == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kIfsc)
        }else{
            UserDefaults.standard.set(ifsc, forKey: FinCartMacros.kIfsc)
        }
        UserDefaults.standard.synchronize()
    }
    func saveBranch(_ branch: String!){
        if branch == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kBranch)
        }else{
            UserDefaults.standard.set(branch, forKey: FinCartMacros.kBranch)
        }
        UserDefaults.standard.synchronize()
    }
    func saveAccountTypeKey(_ accountType: String!){
        if accountType == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAccountType)
        }else{
            UserDefaults.standard.set(accountType, forKey: FinCartMacros.kAccountType)
        }
        UserDefaults.standard.synchronize()
    }
    func saveAccountNo(_ accountNo: String!){
        if accountNo == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAccountNo)
        }else{
            UserDefaults.standard.set(accountNo, forKey: FinCartMacros.kAccountNo)
        }
        UserDefaults.standard.synchronize()
    }
    func saveAccountHolderName(_ accountHolderName: String!){
        if accountHolderName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAccountHolderName)
        }else{
            UserDefaults.standard.set(accountHolderName, forKey: FinCartMacros.kAccountHolderName)
        }
        UserDefaults.standard.synchronize()
    }
    func saveIncomeSourceKey(_ incomeSource: String!){
        if incomeSource == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kIncomeSource)
        }else{
            UserDefaults.standard.set(incomeSource, forKey: FinCartMacros.kIncomeSource)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstNomineeName(_ firstNomineeName: String!){
        if firstNomineeName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstNomineeName)
        }else{
            UserDefaults.standard.set(firstNomineeName, forKey: FinCartMacros.kFirstNomineeName)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstNomineeDob(_ firstNomineeDob: String!){
        if firstNomineeDob == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstNomineeDob)
        }else{
            UserDefaults.standard.set(firstNomineeDob, forKey: FinCartMacros.kFirstNomineeDob)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstNomineeShare(_ firstNomineeShare: String!){
        if firstNomineeShare == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstNomineeShare)
        }else{
            UserDefaults.standard.set(firstNomineeShare, forKey: FinCartMacros.kFirstNomineeShare)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstNomineeRelation(_ firstNomineeRelation: String!){
        if firstNomineeRelation == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstNomineeRelation)
        }else{
            UserDefaults.standard.set(firstNomineeRelation, forKey: FinCartMacros.kFirstNomineeRelation)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondNomineeName(_ secondNomineeName: String!){
        if secondNomineeName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondNomineeName)
        }else{
            UserDefaults.standard.set(secondNomineeName, forKey: FinCartMacros.kSecondNomineeName)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondNomineeDob(_ secondNomineeDob: String!){
        if secondNomineeDob == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondNomineeDob)
        }else{
            UserDefaults.standard.set(secondNomineeDob, forKey: FinCartMacros.kSecondNomineeDob)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondNomineeShare(_ secondNomineeShare: String!){
        if secondNomineeShare == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondNomineeShare)
        }else{
            UserDefaults.standard.set(secondNomineeShare, forKey: FinCartMacros.kSecondNomineeShare)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondNomineeRelation(_ secondNomineeRelation: String!){
        if secondNomineeRelation == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondNomineeRelation)
        }else{
            UserDefaults.standard.set(secondNomineeRelation, forKey: FinCartMacros.kSecondNomineeRelation)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdNomineeName(_ thirdNomineeName: String!){
        if thirdNomineeName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdNomineeName)
        }else{
            UserDefaults.standard.set(thirdNomineeName, forKey: FinCartMacros.kThirdNomineeName)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdNomineeDob(_ thirdNomineeDob: String!){
        if thirdNomineeDob == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdNomineeDob)
        }else{
            UserDefaults.standard.set(thirdNomineeDob, forKey: FinCartMacros.kThirdNomineeDob)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdNomineeShare(_ thirdNomineeShare: String!){
        if thirdNomineeShare == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdNomineeShare)
        }else{
            UserDefaults.standard.set(thirdNomineeShare, forKey: FinCartMacros.kThirdNomineeShare)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdNomineeRelation(_ thirdNomineeRelation: String!){
        if thirdNomineeRelation == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdNomineeRelation)
        }else{
            UserDefaults.standard.set(thirdNomineeRelation, forKey: FinCartMacros.kThirdNomineeRelation)
        }
        UserDefaults.standard.synchronize()
    }
    func saveBankAddress(_ bankAddress: String!){
        if bankAddress == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kBankAddress)
        }else{
            UserDefaults.standard.set(bankAddress, forKey: FinCartMacros.kBankAddress)
        }
        UserDefaults.standard.synchronize()
    }
    func saveBankCity(_ bankCity: String!){
        if bankCity == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kBankCity)
        }else{
            UserDefaults.standard.set(bankCity, forKey: FinCartMacros.kBankCity)
        }
        UserDefaults.standard.synchronize()
    }
    func saveMicr(_ micr: String!){
        if micr == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kMicr)
        }else{
            UserDefaults.standard.set(micr, forKey: FinCartMacros.kMicr)
        }
        UserDefaults.standard.synchronize()
    }
    func saveBankName(_ bankName: String!){
        if bankName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kBankName)
        }else{
            UserDefaults.standard.set(bankName, forKey: FinCartMacros.kBankName)
        }
        UserDefaults.standard.synchronize()
    }
    
    func saveNriName(_ nriName: String!){
        if nriName == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kNriName)
        }else{
            UserDefaults.standard.set(nriName, forKey: FinCartMacros.kNriName)
        }
        UserDefaults.standard.synchronize()
    }
    func saveNriCountry(_ nriCountry: String!){
        if nriCountry == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kNriCountry)
        }else{
            UserDefaults.standard.set(nriCountry, forKey: FinCartMacros.kNriCountry)
        }
        UserDefaults.standard.synchronize()
    }
    func savePoliticallyExposedKey(_ politicallyExposed: String!){
        if politicallyExposed == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kPoliticallyExposed)
        }else{
            UserDefaults.standard.set(politicallyExposed, forKey: FinCartMacros.kPoliticallyExposed)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstTaxCountry(_ firstTaxCountry: String!){
        if firstTaxCountry == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstTaxCountry)
        }else{
            UserDefaults.standard.set(firstTaxCountry, forKey: FinCartMacros.kFirstTaxCountry)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstIdNo(_ firstIdNo: String!){
        if firstIdNo == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstIdNo)
        }else{
            UserDefaults.standard.set(firstIdNo, forKey: FinCartMacros.kFirstIdNo)
        }
        UserDefaults.standard.synchronize()
    }
    func saveFirstIdType(_ firstIdType: String!){
        if firstIdType == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kFirstIdType)
        }else{
            UserDefaults.standard.set(firstIdType, forKey: FinCartMacros.kFirstIdType)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondTaxCountry(_ secondTaxCountry: String!){
        if secondTaxCountry == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondTaxCountry)
        }else{
            UserDefaults.standard.set(secondTaxCountry, forKey: FinCartMacros.kSecondTaxCountry)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondIdNo(_ secondIdNo: String!){
        if secondIdNo == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondIdNo)
        }else{
            UserDefaults.standard.set(secondIdNo, forKey: FinCartMacros.kSecondIdNo)
        }
        UserDefaults.standard.synchronize()
    }
    func saveSecondIdType(_ secondIdType: String!){
        if secondIdType == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kSecondIdType)
        }else{
            UserDefaults.standard.set(secondIdType, forKey: FinCartMacros.kSecondIdType)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdTaxCountry(_ thirdTaxCountry: String!){
        if thirdTaxCountry == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdTaxCountry)
        }else{
            UserDefaults.standard.set(thirdTaxCountry, forKey: FinCartMacros.kThirdTaxCountry)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdIdNo(_ thirdIdNo: String!){
        if thirdIdNo == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdIdNo)
        }else{
            UserDefaults.standard.set(thirdIdNo, forKey: FinCartMacros.kThirdIdNo)
        }
        UserDefaults.standard.synchronize()
    }
    func saveThirdIdType(_ thirdIdType: String!){
        if thirdIdType == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kThirdIdType)
        }else{
            UserDefaults.standard.set(thirdIdType, forKey: FinCartMacros.kThirdIdType)
        }
        UserDefaults.standard.synchronize()
    }
    func saveDob(_ dob: String!){
        if dob == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kDob)
        }else{
            UserDefaults.standard.set(dob, forKey: FinCartMacros.kDob)
        }
        UserDefaults.standard.synchronize()
    }
    func saveState(_ state: String!){
        if state == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kState)
        }else{
            UserDefaults.standard.set(state, forKey: FinCartMacros.kState)
        }
        UserDefaults.standard.synchronize()
    }
    func savePincode(_ pincode: String!){
        if pincode == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kPincode)
        }else{
            UserDefaults.standard.set(pincode, forKey: FinCartMacros.kPincode)
        }
        UserDefaults.standard.synchronize()
    }
    func saveAddress(_ address: String!){
        if address == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kAddress)
        }else{
            UserDefaults.standard.set(address, forKey: FinCartMacros.kAddress)
        }
        UserDefaults.standard.synchronize()
    }
    func saveCity(_ city: String!){
        if city == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kCity)
        }else{
            UserDefaults.standard.set(city, forKey: FinCartMacros.kCity)
        }
        UserDefaults.standard.synchronize()
    }
    func saveKycStatus(_ kycStatus: String!){
        if kycStatus == nil {
            UserDefaults.standard.removeObject(forKey: FinCartMacros.kKycStatus)
        }else{
            UserDefaults.standard.set(kycStatus, forKey: FinCartMacros.kKycStatus)
        }
        UserDefaults.standard.synchronize()
    }
    func retrieveUserImageURL() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kUserImageURL)
    }
    
    func retrievePassword() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kUserPassword)
    }
    
    func retrieveUserName() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kUserName)
    }
    
    func retrieveAccessToken() -> String?{
         return UserDefaults.standard.string(forKey: FinCartMacros.kAccessToken)
    }
    
    func retrieveRefershToken() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kRefreshToken)
    }
    
    func retrieveIsLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: FinCartMacros.kIsUserLoggedIn)
    }
    
    func retrieveIsUserRegistered() -> Bool {
        return UserDefaults.standard.bool(forKey: FinCartMacros.kIsUserRegistered)
    }
    
    func retrieveUserFullName() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kUserFullName)
    }
    func retrieveMobile() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kMobile)!
    }
    func retrieveBasicId() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kBasicId)!
    }
    func retrieveInvestorTypeKey() -> String?{
        return UserDefaults.standard.string(forKey: FinCartMacros.kInvestorType)!
    }
    
    func retrievePan() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kPan)!
    }
    func retrieveName() -> String {
        return UserDefaults.standard.value(forKey: FinCartMacros.kName) as! String
    }
    func retrieveAadhar() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kAadhar)!
    }
    func retrieveOccupationKey() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kOccupation)!
    }
    func retrieveAnnualIncomeKey() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kAnnualIncome)!
    }
    func retrieveIfsc() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kIfsc)!
    }
    func retrieveAccountTypeKey() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kAccountType)!
    }
    func retrieveAccountNo() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kAccountNo)!
    }
    func retrieveAccountHolderName() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kAccountHolderName)!
    }
    func retrieveIncomeSourceKey() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kIncomeSource)!
    }
    func retrieveFirstNomineeName() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstNomineeName)!
    }
    func retrieveFirstNomineeDob() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstNomineeDob)!
    }
    func retrieveFirstNomineeShare() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstNomineeShare)!
    }
    func retrieveFirstNomineeRelation() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstNomineeRelation)!
    }
    func retrieveSecondNomineeName() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondNomineeName)!
    }
    func retrieveSecondNomineeDob() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondNomineeDob)!
    }
    func retrieveSecondNomineeShare() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondNomineeShare)!
    }
    func retrieveSecondNomineeRelation() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondNomineeRelation)!
    }
    func retrieveThirdNomineeName() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdNomineeName)!
    }
    func retrieveThirdNomineeDob() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdNomineeDob)!
    }
    func retrieveThirdNomineeShare() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdNomineeShare)!
    }
    func retrieveThirdNomineeRelation() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdNomineeRelation)!
    }
    func retrieveBankAddress() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kBankAddress)!
    }
    func retrieveBankCity() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kBankCity)!
    }
    func retrieveMicr() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kMicr)!
    }
    func retrieveBankName() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kBankName)!
    }
    func retrieveBranch() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kBranch)!
    }
    func retrieveNriName() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kNriName)!
    }
    func retrieveNriCountry() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kNriCountry)!
    }
    func retrievePoliticallyExposedKey() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kPoliticallyExposed)!
    }
    func retrieveFirstTaxCountry() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstTaxCountry)!
    }
    func retrieveFirstIdNo() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstIdNo)!
    }
    func retrieveFirstIdType() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kFirstIdType)!
    }
    func retrieveSecondTaxCountry() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondTaxCountry)!
    }
    func retrieveSecondIdNo() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondIdNo)!
    }
    func retrieveSecondIdType() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kSecondIdType)!
    }
    func retrieveThirdTaxCountry() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdTaxCountry)!
    }
    func retrieveThirdIdNo() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdIdNo)!
    }
    func retrieveThirdIdType() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kThirdIdType)!
    }
    func retrieveDob() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kDob)!
    }
    func retrieveState() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kState)!
    }
    func retrievePincode() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kPincode)!
    }
    func retrieveAddress() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kAddress)!
    }
    func retrieveCity() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kCity)!
    }
    func retrieveKycStatus() -> String {
        return UserDefaults.standard.string(forKey: FinCartMacros.kKycStatus)!
    }
    func retrieveIsGoalStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: FinCartMacros.kIsGoal)
    }
    func saveImage(_ image: UIImage, _withName: String, _withExtension: String, _directoryPath: String){
        if _withExtension.caseInsensitiveCompare("png") == ComparisonResult.orderedSame {
            let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(_withName).appendingPathExtension(_withExtension)
            do{
                try UIImagePNGRepresentation(image)?.write(to: fileURL, options: Data.WritingOptions.atomicWrite)
            }catch{
            
            }
        }
    }
    
    func loadImageWithFileName(_ withName: String, _withExtension: String, _directoryPath: String) -> UIImage?{
        let image = UIImage(contentsOfFile: String.init(format: "%@/%@.%@", _directoryPath, withName, _withExtension))
        return image
    }
}
