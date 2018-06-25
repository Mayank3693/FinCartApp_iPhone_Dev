//
//  BaseObject.swift
//  Fincart
//
//  Created by Kamal on 25/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
struct BaseObject : Codable{
    var ques : String?
    var anstype : String?
    var noOfoptions : Int?
    var questioncode : String?
    var goalcode : String?
    var defaultOption: String?
    var options : [OptionsArray]?
    var quesArray : [QuestionArrays]?
    
    enum CodingKeys: String, CodingKey {
        
        case ques = "ques"
        case anstype = "anstype"
        case noOfoptions = "noOfoptions"
        case questioncode = "questioncode"
        case goalcode = "goalcode"
        case defaultOption = "defaultOption"
        case options = "Options"
        case quesArray = "QuesArray"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do{
            ques = try values.decodeIfPresent(String.self, forKey: .ques)
            anstype = try values.decodeIfPresent(String.self, forKey: .anstype)
            noOfoptions = try values.decodeIfPresent(Int.self, forKey: .noOfoptions)
            questioncode = try values.decodeIfPresent(String.self, forKey: .questioncode)
            goalcode = try values.decodeIfPresent(String.self, forKey: .goalcode)
            defaultOption = try values.decodeIfPresent(String.self, forKey: .defaultOption)
            options = try values.decodeIfPresent([OptionsArray].self, forKey: .options)
            quesArray = try values.decodeIfPresent([QuestionArrays].self, forKey: .quesArray)
        }
        catch {
            
        }
    }
}
