//
//  KidDataArrayList.swift
//  Fincart
//
//  Created by Kamal on 31/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class KidDataArrayList: NSObject {
    var childCountForStudy: Int? = 0
    var childCountForWeddingPlan: Int? = 0
    var kidDataArrayList: [KidData]?
    
    func getObjectAtIndex(_ index: Int) -> KidData
    {
        return kidDataArrayList![index]
    }
    
    func removeObjectAtIndex(_ index: Int)
    {
        kidDataArrayList?.remove(at: index)
    }
    
    func updateObjectAtIndex(_ index: Int, kidDataObject: KidData) -> KidData
    {
        kidDataArrayList?.remove(at: index)
        kidDataArrayList?.insert(kidDataObject, at: index)
        return kidDataArrayList![index]
    }
    
    func addObject(kidDataObject: KidData)
    {
        kidDataArrayList?.append(kidDataObject)
    }
}

class KidData: NSObject{
    var childName: String?
    var age: String?
    var gender: String?
    var educationLocation: String? = "USA OR CANADA"
    var weddingType: String? = "SIMPLE"
    var forEducation: Bool? = false
    var forWedding: Bool? = false
}

