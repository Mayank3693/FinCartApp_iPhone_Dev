//
//  OptionsArray.swift
//  Fincart
//
//  Created by Kamal on 25/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
struct OptionsArray : Codable{
    var key : String?
    var value : String?
    
    enum CodingKeys: String, CodingKey {
        
        case key = "key"
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            key = try values.decodeIfPresent(String.self, forKey: .key)
            value = try values.decodeIfPresent(String.self, forKey: .value)
        }
        catch{}
    }
}
