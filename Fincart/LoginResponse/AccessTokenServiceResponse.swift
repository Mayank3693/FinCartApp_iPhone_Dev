//
//  AccessTokenServiceResponse.swift
//  Fincart
//
//  Created by Kamal on 31/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import Foundation

class AccessTokenServiceResponse: Codable {
    let accessToken, tokenType: String?
    let expiresIn: Int?
    let refreshToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
    }
    
    init(accessToken: String?, tokenType: String?, expiresIn: Int?, refreshToken: String?) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
    }
}

// MARK: Convenience initializers
extension AccessTokenServiceResponse {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(AccessTokenServiceResponse.self, from: data)
        self.init(accessToken: me.accessToken, tokenType: me.tokenType, expiresIn: me.expiresIn, refreshToken: me.refreshToken)
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
