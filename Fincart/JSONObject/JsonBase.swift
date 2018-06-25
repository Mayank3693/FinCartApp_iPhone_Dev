//
//  JsonBase.swift
//  Fincart
//
//  Created by Kamal on 25/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
struct JsonBase : Codable{
    let baseObject : [BaseObject]?
    enum CodingKeys: String, CodingKey {
        case baseObject = "C5"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        baseObject = try values.decodeIfPresent([BaseObject].self, forKey: .baseObject)
    }
}
