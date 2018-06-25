//
//  SavedUserGoalServiceResponse.swift
//  Fincart
//
//  Created by Kamal on 24/04/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

typealias SavedUserGoalServiceResponse = [SavedUserGoalServiceResponseElement]

class SavedUserGoalServiceResponseElement: Codable {
    let userID, memberID, profileID: String?
    let goalCode: String
    let fundCode, schemeCode, amount, goalName: String?
    let foliono, userGoalImage: String?
    let userGoalID: Int
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case memberID = "memberId"
        case profileID = "profileId"
        case goalCode = "goalCode"
        case fundCode = "fundCod"
        case schemeCode = "schemeCode"
        case amount = "amount"
        case goalName = "goalName"
        case foliono = "foliono"
        case userGoalImage = "UserGoalImage"
        case userGoalID = "userGoalId"
    }
    
    init(userID: String?, memberID: String?, profileID: String?, goalCode: String, fundCode: String?, schemeCode: String?, amount: String?, goalName: String?, foliono: String?, userGoalImage: String?, userGoalID: Int) {
        self.userID = userID
        self.memberID = memberID
        self.profileID = profileID
        self.goalCode = goalCode
        self.fundCode = fundCode
        self.schemeCode = schemeCode
        self.amount = amount
        self.goalName = goalName
        self.foliono = foliono
        self.userGoalImage = userGoalImage
        self.userGoalID = userGoalID
    }
}

// MARK: Convenience initializers

extension SavedUserGoalServiceResponseElement {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(SavedUserGoalServiceResponseElement.self, from: data)
        self.init(userID: me.userID, memberID: me.memberID, profileID: me.profileID, goalCode: me.goalCode, fundCode: me.fundCode, schemeCode: me.schemeCode, amount: me.amount, goalName: me.goalName, foliono: me.foliono, userGoalImage: me.userGoalImage, userGoalID: me.userGoalID)
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

extension Array where Element == SavedUserGoalServiceResponse.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(SavedUserGoalServiceResponse.self, from: data)
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
