//
//  SingleGoalList.swift
//  Fincart
//
//  Created by Kamal on 03/04/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class SingleGoalList: NSObject{
    var singleGoalDetailsList: [SingleGoalDetails]?
    
    func getObjectAtIndex(_ index: Int) -> SingleGoalDetails
    {
        return singleGoalDetailsList![index]
    }
    
    func updateObjectAtIndex(_ index: Int, singleGoalDetailsObject: SingleGoalDetails) -> SingleGoalDetails
    {
        singleGoalDetailsList?.remove(at: index)
        singleGoalDetailsList?.insert(singleGoalDetailsObject, at: index)
        return singleGoalDetailsList![index]
    }
    
    func addObject(_ singleGoalDetailsObject: SingleGoalDetails)
    {
        singleGoalDetailsList?.append(singleGoalDetailsObject)
    }
}

class SingleGoalDetails: NSObject{
    var ques : String?
    var anstype : String?
    var noOfoptions : Int?
    var questioncode : String?
    var goalcode : String?
    var defaultOption: String?
    var options : [SingleGoalOptionsArray]?
    
    func addOptionArray(_ singleGoalOptionArray: SingleGoalOptionsArray){
        options?.append(singleGoalOptionArray)
    }
    
    func getOptionAtIndex(_ index: Int) -> SingleGoalOptionsArray
    {
        return options![index]
    }
    
    func updateOptionAtIndex(_ index: Int, singleGoalDetailsObject: SingleGoalOptionsArray) -> SingleGoalOptionsArray
    {
        options?.remove(at: index)
        options?.insert(singleGoalDetailsObject, at: index)
        return options![index]
    }
}

class SingleGoalOptionsArray: NSObject{
    var key : String?
    var value : String?
}
