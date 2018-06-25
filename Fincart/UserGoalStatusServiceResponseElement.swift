//
//  UserGoalStatusServiceResponseElement.swift
//  Fincart
//
//  Created by Kamal on 03/04/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

typealias UserGoalStatusServiceResponse = [UserGoalStatusServiceResponseElement]

class UserGoalStatusServiceResponseElement: Codable {
    var isRelation: Bool?
    var relationID, relation, relationName, relationAge: String?
    var relationGender, userName, userGender, userMaritialStatus: String?
    var userCurrentAge, userChildCount, userLifeExpectency, userMonthlyExpence: String?
    var userEmiAmount, userAnnualIncome, userRetirementAge, sabbaticalStartTime: String?
    var sabbaticalEndTime, travelingPeopleCount, goalID, goalCode: String?
    var goalName, goalImage, goaltime, goalText: String?
    var goalType, locationCode, place, risk: String?
    var amount, monthlyAmount, productList, recommendedFund: String?
    var investmentType, getAmount, investAmount, investAmountMin: String?
    var investAmountMax, goalAchieved, investedAmount, currentAmount: String?
    var pendingAmount: String?
    
    enum CodingKeys: String, CodingKey {
        case isRelation = "IsRelation"
        case relationID = "RelationID"
        case relation = "Relation"
        case relationName = "RelationName"
        case relationAge = "RelationAge"
        case relationGender = "RelationGender"
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
        case goalID = "GoalID"
        case goalCode = "GoalCode"
        case goalName = "GoalName"
        case goalImage = "GoalImage"
        case goaltime = "Goaltime"
        case goalText = "GoalText"
        case goalType = "GoalType"
        case locationCode = "LocationCode"
        case place = "Place"
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
        case goalAchieved = "GoalAchieved"
        case investedAmount = "InvestedAmount"
        case currentAmount = "CurrentAmount"
        case pendingAmount = "PendingAmount"
    }
    
    init(isRelation: Bool?, relationID: String?, relation: String?, relationName: String?, relationAge: String?, relationGender: String?, userName: String?, userGender: String?, userMaritialStatus: String?, userCurrentAge: String?, userChildCount: String?, userLifeExpectency: String?, userMonthlyExpence: String?, userEmiAmount: String?, userAnnualIncome: String?, userRetirementAge: String?, sabbaticalStartTime: String?, sabbaticalEndTime: String?, travelingPeopleCount: String?, goalID: String?, goalCode: String?, goalName: String?, goalImage: String?, goaltime: String?, goalText: String?, goalType: String?, locationCode: String?, place: String?, risk: String?, amount: String?, monthlyAmount: String?, productList: String?, recommendedFund: String?, investmentType: String?, getAmount: String?, investAmount: String?, investAmountMin: String?, investAmountMax: String?, goalAchieved: String?, investedAmount: String?, currentAmount: String?, pendingAmount: String?) {
        self.isRelation = isRelation
        self.relationID = relationID
        self.relation = relation
        self.relationName = relationName
        self.relationAge = relationAge
        self.relationGender = relationGender
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
        self.goalID = goalID
        self.goalCode = goalCode
        self.goalName = goalName
        self.goalImage = goalImage
        self.goaltime = goaltime
        self.goalText = goalText
        self.goalType = goalType
        self.locationCode = locationCode
        self.place = place
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
        self.goalAchieved = goalAchieved
        self.investedAmount = investedAmount
        self.currentAmount = currentAmount
        self.pendingAmount = pendingAmount
    }
}

// MARK: Convenience initializers

extension UserGoalStatusServiceResponseElement {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(UserGoalStatusServiceResponseElement.self, from: data)
        self.init(isRelation: me.isRelation, relationID: me.relationID, relation: me.relation, relationName: me.relationName, relationAge: me.relationAge, relationGender: me.relationGender, userName: me.userName, userGender: me.userGender, userMaritialStatus: me.userMaritialStatus, userCurrentAge: me.userCurrentAge, userChildCount: me.userChildCount, userLifeExpectency: me.userLifeExpectency, userMonthlyExpence: me.userMonthlyExpence, userEmiAmount: me.userEmiAmount, userAnnualIncome: me.userAnnualIncome, userRetirementAge: me.userRetirementAge, sabbaticalStartTime: me.sabbaticalStartTime, sabbaticalEndTime: me.sabbaticalEndTime, travelingPeopleCount: me.travelingPeopleCount, goalID: me.goalID, goalCode: me.goalCode, goalName: me.goalName, goalImage: me.goalImage, goaltime: me.goaltime, goalText: me.goalText, goalType: me.goalType, locationCode: me.locationCode, place: me.place, risk: me.risk, amount: me.amount, monthlyAmount: me.monthlyAmount, productList: me.productList, recommendedFund: me.recommendedFund, investmentType: me.investmentType, getAmount: me.getAmount, investAmount: me.investAmount, investAmountMin: me.investAmountMin, investAmountMax: me.investAmountMax, goalAchieved: me.goalAchieved, investedAmount: me.investedAmount, currentAmount: me.currentAmount, pendingAmount: me.pendingAmount)
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

extension Array where Element == UserGoalStatusServiceResponse.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(UserGoalStatusServiceResponse.self, from: data)
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
