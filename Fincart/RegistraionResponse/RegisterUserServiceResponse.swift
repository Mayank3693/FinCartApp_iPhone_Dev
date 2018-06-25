//
//  RegisterUserServiceResponse.swift
//  Fincart
//
//  Created by Kamal on 31/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

class RegisterUserServiceResponse: Codable {
    let status, description: String?
    
    init(status: String?, description: String?) {
        self.status = status
        self.description = description
    }
}

// MARK: Convenience initializers
extension RegisterUserServiceResponse {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(RegisterUserServiceResponse.self, from: data)
        self.init(status: me.status, description: me.description)
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
