//
//  GoalsReview.swift
//  Fincart
//
//  Created by Kamal on 26/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

typealias GoalsReview = [GoalsReviewElement]

class GoalsReviewElement: Codable {
    var taggedQuestion: [TaggedQuestion]?
    var childDetails: ChildDetails?
    var userName, userGender, userMaritialStatus, userCurrentAge: String?
    var userChildCount, userLifeExpectency, userMonthlyExpence, userEmiAmount: String?
    var userAnnualIncome, userRetirementAge, sabbaticalStartTime, sabbaticalEndTime: String?
    var travelingPeopleCount, goalCode, goalName, goalImage: String?
    var goaltime, goalText, goalType, locationCode: String?
    var risk, amount, monthlyAmount, productList: String?
    var recommendedFund, investmentType, getAmount, investAmount: String?
    var investAmountMin, investAmountMax: String?
    
    enum CodingKeys: String, CodingKey {
        case taggedQuestion = "TaggedQuestion"
        case childDetails = "ChildDetails"
        case userName = "UserName"
        case userGender = "UserGender"
        case userMaritialStatus = "UserMaritialStatus"
        case userCurrentAge = "UserCurrentAge"
        case userChildCount = "UserChildCount"
        case userLifeExpectency = "UserLifeExpectency"
        case userMonthlyExpence = "UserMonthlyExpence"
        case userEmiAmount = "UserEmiAmount"
        case userAnnualIncome = "UserAnnualIncome"
        case userRetirementAge = "UserRetirementAge"
        case sabbaticalStartTime = "SabbaticalStartTime"
        case sabbaticalEndTime = "SabbaticalEndTime"
        case travelingPeopleCount = "TravelingPeopleCount"
        case goalCode = "GoalCode"
        case goalName = "GoalName"
        case goalImage = "GoalImage"
        case goaltime = "Goaltime"
        case goalText = "GoalText"
        case goalType = "GoalType"
        case locationCode = "LocationCode"
        case risk = "Risk"
        case amount = "Amount"
        case monthlyAmount = "MonthlyAmount"
        case productList = "ProductList"
        case recommendedFund = "RecommendedFund"
        case investmentType = "InvestmentType"
        case getAmount = "GetAmount"
        case investAmount = "InvestAmount"
        case investAmountMin = "InvestAmountMin"
        case investAmountMax = "InvestAmountMax"
    }
    
    init(taggedQuestion: [TaggedQuestion]?, childDetails: ChildDetails?, userName: String?, userGender: String?, userMaritialStatus: String?, userCurrentAge: String?, userChildCount: String?, userLifeExpectency: String?, userMonthlyExpence: String?, userEmiAmount: String?, userAnnualIncome: String?, userRetirementAge: String?, sabbaticalStartTime: String?, sabbaticalEndTime: String?, travelingPeopleCount: String?, goalCode: String?, goalName: String?, goalImage: String?, goaltime: String?, goalText: String?, goalType: String?, locationCode: String?, risk: String?, amount: String?, monthlyAmount: String?, productList: String?, recommendedFund: String?, investmentType: String?, getAmount: String?, investAmount: String?, investAmountMin: String?, investAmountMax: String?) {
        self.taggedQuestion = taggedQuestion
        self.childDetails = childDetails
        self.userName = userName
        self.userGender = userGender
        self.userMaritialStatus = userMaritialStatus
        self.userCurrentAge = userCurrentAge
        self.userChildCount = userChildCount
        self.userLifeExpectency = userLifeExpectency
        self.userMonthlyExpence = userMonthlyExpence
        self.userEmiAmount = userEmiAmount
        self.userAnnualIncome = userAnnualIncome
        self.userRetirementAge = userRetirementAge
        self.sabbaticalStartTime = sabbaticalStartTime
        self.sabbaticalEndTime = sabbaticalEndTime
        self.travelingPeopleCount = travelingPeopleCount
        self.goalCode = goalCode
        self.goalName = goalName
        self.goalImage = goalImage
        self.goaltime = goaltime
        self.goalText = goalText
        self.goalType = goalType
        self.locationCode = locationCode
        self.risk = risk
        self.amount = amount
        self.monthlyAmount = monthlyAmount
        self.productList = productList
        self.recommendedFund = recommendedFund
        self.investmentType = investmentType
        self.getAmount = getAmount
        self.investAmount = investAmount
        self.investAmountMin = investAmountMin
        self.investAmountMax = investAmountMax
    }
}

class ChildDetails: Codable {
    var userid, name, relationID, age: String?
    var gender, status: String?
    
    init(userid: String?, name: String?, relationID: String?, age: String?, gender: String?, status: String?) {
        self.userid = userid
        self.name = name
        self.relationID = relationID
        self.age = age
        self.gender = gender
        self.status = status
    }
}

class TaggedQuestion: Codable {
    var id: Int?
    var code, goalCode, answer: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case code = "Code"
        case goalCode = "GoalCode"
        case answer = "Answer"
    }
    
    init(id: Int?, code: String?, goalCode: String?, answer: String?) {
        self.id = id
        self.code = code
        self.goalCode = goalCode
        self.answer = answer
    }
}

// MARK: Convenience initializers

extension GoalsReviewElement {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(GoalsReviewElement.self, from: data)
        self.init(taggedQuestion: me.taggedQuestion, childDetails: me.childDetails, userName: me.userName, userGender: me.userGender, userMaritialStatus: me.userMaritialStatus, userCurrentAge: me.userCurrentAge, userChildCount: me.userChildCount, userLifeExpectency: me.userLifeExpectency, userMonthlyExpence: me.userMonthlyExpence, userEmiAmount: me.userEmiAmount, userAnnualIncome: me.userAnnualIncome, userRetirementAge: me.userRetirementAge, sabbaticalStartTime: me.sabbaticalStartTime, sabbaticalEndTime: me.sabbaticalEndTime, travelingPeopleCount: me.travelingPeopleCount, goalCode: me.goalCode, goalName: me.goalName, goalImage: me.goalImage, goaltime: me.goaltime, goalText: me.goalText, goalType: me.goalType, locationCode: me.locationCode, risk: me.risk, amount: me.amount, monthlyAmount: me.monthlyAmount, productList: me.productList, recommendedFund: me.recommendedFund, investmentType: me.investmentType, getAmount: me.getAmount, investAmount: me.investAmount, investAmountMin: me.investAmountMin, investAmountMax: me.investAmountMax)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension ChildDetails {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(ChildDetails.self, from: data)
        self.init(userid: me.userid, name: me.name, relationID: me.relationID, age: me.age, gender: me.gender, status: me.status)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension TaggedQuestion {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(TaggedQuestion.self, from: data)
        self.init(id: me.id, code: me.code, goalCode: me.goalCode, answer: me.answer)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == GoalsReview.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(GoalsReview.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

