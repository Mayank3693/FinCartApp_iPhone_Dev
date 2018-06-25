//
//  APIManager.swift
//  Fincart
//
//  Created by Kamal on 21/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import Foundation

class APIManager: NSObject {
    
    static let sharedInstance = APIManager(baseURL: FinCartMacros.kBaseUrl)
    let baseURL: String!
    var session :  URLSession!
    var sessionConfiguration: URLSessionConfiguration!
    
    private init(baseURL: String) {
        self.baseURL = baseURL
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: self.sessionConfiguration!)
    }
    
    private func intialiseURLSession() -> URLSession
    {
        return self.session
    }
    
    //MARKS:- Check Network Connectivity
    
    
    //MARKS: - Login Services
    func getAccessToken(_ userDetails: Dictionary<String, String>, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kFinTokenUrl)!)
        var userDetailsData : String = ""
        for (key, value) in userDetails {
            if key.elementsEqual((userDetails.first?.key)!){
                userDetailsData += key + "=" + value
            }else{
                userDetailsData += "&" + key + "=" + value
            }
        }
        request.httpBody = userDetailsData.data(using:String.Encoding.utf8, allowLossyConversion: false)!
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil
            {
                failure(error!)
            }
            else
            {
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func fetchUserDetails(_ accessToken: String, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kFinLoggedInDetailsUrl)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    //MARKS:- Register Services
    func registerUser(_ registerDetails: Dictionary<String, String>, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kFinRegistrationUrl)!)
        var userRegistrationDetails : String = ""
        for (key, value) in registerDetails {
            if key.elementsEqual((registerDetails.first?.key)!){
                userRegistrationDetails += key + "=" + value
            }else{
                userRegistrationDetails += "&" + key + "=" + value
            }
        }
        print(userRegistrationDetails)
        request.httpBody = userRegistrationDetails.data(using:String.Encoding.utf8, allowLossyConversion: false)!
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil
            {
                failure(error!)
            }
            else
            {
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    //MARKS:- Questions Service
    func resetTaggedQuestions(_ accessToken: String, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kFinResetTaggedQuestions)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "DELETE"
        
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func savePersonalInfoData(_ accessToken: String, personalDetails: Dictionary<String, String>, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kFinBulkTagsURL)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            let data = try JSONSerialization.data(withJSONObject: personalDetails, options: .prettyPrinted)
            request.httpBody = data
        } catch let error {
            failure(error)
        }
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func setQuestionTags(_ taggedQuestion: Dictionary<String, String>, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kQuestionTagURL)!)
        request.httpMethod = "POST"
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            let data = try JSONSerialization.data(withJSONObject: taggedQuestion, options: .prettyPrinted)
            request.httpBody = data
        } catch let error {
            failure(error)
        }
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func reviewTaggedGoals(_ accessToken: String, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kReviewTaggedGoals)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func removeReviewGoal(_ accessToken: String, goalCode: String, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        let stringURL = baseURL + FinCartMacros.kRemoveReviewGoals
        let urlComp: NSURLComponents! = NSURLComponents(string: stringURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "goalcode", value: goalCode))
        urlComp.queryItems = items
        
        var request: URLRequest = URLRequest(url: urlComp.url!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "DELETE"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func saveReview(_ accessToken: String, goalReviewData: GoalsReview, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kSaveReviewURL)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
                let jsonEncoder = JSONEncoder()
                jsonEncoder.outputFormatting = .prettyPrinted
                let json = try jsonEncoder.encode(goalReviewData)
                request.httpBody = json
        } catch let error {
            failure(error)
        }
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func saveSingleReview(_ accessToken: String, goalReviewData: GoalsReviewElement, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void)
    {
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kSaveSingleGoalURL)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let json = try jsonEncoder.encode(goalReviewData)
            request.httpBody = json
        } catch let error {
            failure(error)
        }
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func fetchSavedUserGoalsCode(_ accessToken: String, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void){
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kFetchSavedGoalsCode)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func getUserGoalStatus(_ accessToken: String, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void){
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kUserGoalStatusURL)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
    
    func updateEditGoalDetails(_ accessToken: String, userGoalStatusServiceResponseElement: UserGoalStatusServiceResponseElement, success: @escaping (_ response: URLResponse, _ data: AnyObject?) -> Void, failure: @escaping (_ error: Error) -> Void){
        var request: URLRequest = URLRequest(url: URL(string: baseURL + FinCartMacros.kUpdateEditGoal)!)
        request.setValue("bearer " + accessToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let json = try jsonEncoder.encode(userGoalStatusServiceResponseElement)
            request.httpBody = json
        } catch let error {
            failure(error)
        }
        let dataTask = intialiseURLSession().dataTask(with: request) { (data, response, error) in
            if error != nil{
                failure(error!)
            }else{
                success(response!, data as AnyObject)
            }
        }
        dataTask.resume()
    }
}
