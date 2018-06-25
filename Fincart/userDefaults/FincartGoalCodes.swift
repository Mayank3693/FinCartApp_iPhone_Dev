//
//  FincartGoalCodes.swift
//  Fincart
//
//  Created by Kamal on 13/04/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class FincartGoalCodes: NSObject {

    static func getCodeForSelectedOption(_ goalCode: String, questionCode: String, answer: String, child: Int) -> String{
        if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_STUDIES) == ComparisonResult.orderedSame{
            return getStudyGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_OWN_WEDDING) == ComparisonResult.orderedSame{
            return getWeddingGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_HOUSE) == ComparisonResult.orderedSame{
            return getHouseGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_CAR) == ComparisonResult.orderedSame{
            return getCarGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_TRAVEL_PLAN) == ComparisonResult.orderedSame{
            return getTravelPlanGoalCodes(questionCode, answer: answer, child: child)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_BIKE) == ComparisonResult.orderedSame{
            return getBikeGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_OWN_BUSINESS) == ComparisonResult.orderedSame{
            return getBusinessGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_OTHER_CODE) == ComparisonResult.orderedSame{
            return getOtherGoalCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_TIME_OFF) == ComparisonResult.orderedSame{
            return getTakeTimeOffCodes(questionCode, answer: answer)
        }else if goalCode.caseInsensitiveCompare(FincartCommon.GOAL_PLANING_KIDS) == ComparisonResult.orderedSame{
            return getPlanningChildsGoalCodes(questionCode, answer: answer)
        }
        return answer
    }
    
    static func getStudyGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ15") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }else if questionCode.caseInsensitiveCompare("FQ16") == ComparisonResult.orderedSame{
            return getStudyLocationCodes(answer)
        }
        return answer
    }
    
    static func getWeddingGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ18") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }else if questionCode.caseInsensitiveCompare("FQ20") == ComparisonResult.orderedSame{
            return getWeddingTypeCodes(answer)
        }
        return answer
    }
    
    static func getHouseGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ21") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }
        return answer
    }
    
    static func getCarGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ23") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }else if questionCode.caseInsensitiveCompare("FQ52") == ComparisonResult.orderedSame{
            return getCarTypeCodes(answer)
        }
        return answer
    }
    
    static func getTravelPlanGoalCodes(_ questionCode: String, answer: String, child: Int) -> String{
        if questionCode.caseInsensitiveCompare("FQ25") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }else if questionCode.caseInsensitiveCompare("FQ26") == ComparisonResult.orderedSame{
            return getTravelWithWhom(answer, child: child)
        }else if questionCode.caseInsensitiveCompare("FQ55") == ComparisonResult.orderedSame{
            return getTravelDestinationCode(answer)
        }else if questionCode.caseInsensitiveCompare("FQ27") == ComparisonResult.orderedSame{
            return getTravelTypeCode(answer)
        }
        return answer
    }
    
    static func getBikeGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ29") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }else if questionCode.caseInsensitiveCompare("FQ31") == ComparisonResult.orderedSame{
            return getBikeTypeCode(answer)
        }
        return answer
    }
    
    static func getBusinessGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ32") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }
        return answer
    }
    
    static func getOtherGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ37") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }
        return answer
    }
    
    static func getTakeTimeOffCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ41") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }
        return answer
    }
    
    static func getPlanningChildsGoalCodes(_ questionCode: String, answer: String) -> String{
        if questionCode.caseInsensitiveCompare("FQ44") == ComparisonResult.orderedSame{
            return (answer.caseInsensitiveCompare("YES") == ComparisonResult.orderedSame) ? "1" : "0"
        }else if questionCode.caseInsensitiveCompare("FQ46") == ComparisonResult.orderedSame{
            return getChildCelebrationCodes(answer)
        }
        return answer
    }
    
    static func getStudyLocationCodes(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("USA OR CANADA") == ComparisonResult.orderedSame{
            return "001"
        }else if answer.caseInsensitiveCompare("EUROPE") == ComparisonResult.orderedSame{
            return "002"
        }else if answer.caseInsensitiveCompare("SOUTH EAST ASIA") == ComparisonResult.orderedSame{
            return "003"
        }else if answer.caseInsensitiveCompare("INDIA") == ComparisonResult.orderedSame{
            return "004"
        }else{
            return "005"
        }
    }
    
    static func getWeddingTypeCodes(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("SIMPLE") == ComparisonResult.orderedSame{
            return "001"
        }else if answer.caseInsensitiveCompare("MODERATE") == ComparisonResult.orderedSame{
            return "002"
        }else{
            return "003"
        }
    }
    
    static func getCarTypeCodes(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("SMALL") == ComparisonResult.orderedSame{
            return "001"
        }else if answer.caseInsensitiveCompare("HATCHBACK") == ComparisonResult.orderedSame{
            return "002"
        }else if answer.caseInsensitiveCompare("SEDAN") == ComparisonResult.orderedSame{
            return "003"
        }else if answer.caseInsensitiveCompare("SUV") == ComparisonResult.orderedSame{
            return "004"
        }else{
            return "005"
        }
    }
    
    static func getTravelWithWhom(_ answer: String, child: Int) -> String{
        if answer.caseInsensitiveCompare("SOLO") == ComparisonResult.orderedSame{
            return "1"
        }else if answer.caseInsensitiveCompare("+1") == ComparisonResult.orderedSame{
            return "2"
        }else{
            if child > 0{
                return "4"
            }else{
                return "2"
            }
        }
    }
    
    static func getTravelDestinationCode(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("USA OR CANADA") == ComparisonResult.orderedSame{
            return "001"
        }else if answer.caseInsensitiveCompare("AUSTRALIA OR NZ") == ComparisonResult.orderedSame{
            return "002"
        }else if answer.caseInsensitiveCompare("EUROPE") == ComparisonResult.orderedSame{
            return "003"
        }else if answer.caseInsensitiveCompare("SOUTH EAST ASIA") == ComparisonResult.orderedSame{
            return "004"
        }else{
            return "005"
        }
    }
    
    static func getTravelTypeCode(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("BUDGET") == ComparisonResult.orderedSame{
            return "001"
        }else if answer.caseInsensitiveCompare("COMFY") == ComparisonResult.orderedSame{
            return "002"
        }else{
            return "003"
        }
    }
    
    static func getBikeTypeCode(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("250 CC") == ComparisonResult.orderedSame{
            return "250"
        }else if answer.caseInsensitiveCompare("500 CC") == ComparisonResult.orderedSame{
            return "500"
        }else if answer.caseInsensitiveCompare("800 CC") == ComparisonResult.orderedSame{
            return "800"
        }else if answer.caseInsensitiveCompare("1000 CC") == ComparisonResult.orderedSame{
            return "1000"
        }else{
            return "1200"
        }
    }
    
    static func getChildCelebrationCodes(_ answer: String) -> String{
        if answer.caseInsensitiveCompare("BUDGET") == ComparisonResult.orderedSame{
            return "001"
        }else if answer.caseInsensitiveCompare("COMFY") == ComparisonResult.orderedSame{
            return "002"
        }else{
            return "003"
        }
    }
}
