//
//  UserDetailsServiceResponse.swift
//  Fincart
//
//  Created by Kamal on 31/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import Foundation

class UserDetailsServiceResponse: Codable {
    let cafDetails: [String: String?]?
    let totalCart: TotalCart?
    let isgoal: Bool?
    
    enum CodingKeys: String, CodingKey {
        case cafDetails = "CafDetails"
        case totalCart = "TotalCart"
        case isgoal
    }
    
    init(cafDetails: [String: String?]?, totalCart: TotalCart?, isgoal: Bool?) {
        self.cafDetails = cafDetails
        self.totalCart = totalCart
        self.isgoal = isgoal
    }
}

class TotalCart: Codable {
    let totalLumpsum, totalInstaSIP, totalSIP: String?
    
    enum CodingKeys: String, CodingKey {
        case totalLumpsum = "TotalLumpsum"
        case totalInstaSIP = "TotalInstaSip"
        case totalSIP = "TotalSip"
    }
    
    init(totalLumpsum: String?, totalInstaSIP: String?, totalSIP: String?) {
        self.totalLumpsum = totalLumpsum
        self.totalInstaSIP = totalInstaSIP
        self.totalSIP = totalSIP
    }
}

// MARK: Convenience initializers
extension UserDetailsServiceResponse {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(UserDetailsServiceResponse.self, from: data)
        self.init(cafDetails: me.cafDetails, totalCart: me.totalCart, isgoal: me.isgoal)
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

extension TotalCart {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(TotalCart.self, from: data)
        self.init(totalLumpsum: me.totalLumpsum, totalInstaSIP: me.totalInstaSIP, totalSIP: me.totalSIP)
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

