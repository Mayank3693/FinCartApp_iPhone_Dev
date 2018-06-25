//
//  FundCalculation.swift
//  Fincart
//
//  Created by Kamal on 27/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FundCalculation: NSObject
{
    static func callMethodForCalculation(_ goalReviewElement : GoalsReviewElement, changeBy: Int) -> FundCalculationResult
    {
        var fundCalculationResult = FundCalculationResult()
        if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_STUDIES) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_PLANING_KIDS) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_OWN_WEDDING) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_TRAVEL_PLAN) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let peopleCount = Double(goalReviewElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "", noOfPersons: peopleCount)
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let peopleCount = Double(goalReviewElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "", noOfPersons: peopleCount)
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let peopleCount = Double(goalReviewElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: 0.0, iSip: value, years: years, type: "R", noOfPersons: peopleCount)
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let peopleCount = Double(goalReviewElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: value, iSip: 0.0, years: years, type: "R", noOfPersons: peopleCount)
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_TIME_OFF) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let startTime = Double(goalReviewElement.sabbaticalStartTime!),
                    let endTime = Double(goalReviewElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let startTime = Double(goalReviewElement.sabbaticalStartTime!),
                    let endTime = Double(goalReviewElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!),
                    let startTime = Double(goalReviewElement.sabbaticalStartTime!),
                    let endTime = Double(goalReviewElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: 0.0, iSip: value, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!),
                    let startTime = Double(goalReviewElement.sabbaticalStartTime!),
                    let endTime = Double(goalReviewElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: value, iSip: 0.0, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_OWN_BUSINESS) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!), let startupCost = Double(goalReviewElement.getAmount!),
                    let monthlyExepnse = Double(goalReviewElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: value, years: years, startupCost: startupCost, monthlyExpense: monthlyExepnse, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!), let startupCost = Double(goalReviewElement.getAmount!),
                    let monthlyExepnse = Double(goalReviewElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: value, years: years, startupCost: startupCost, monthlyExpense: monthlyExepnse, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!), let startupCost = Double(goalReviewElement.getAmount!), let monthlyExepnse = Double(goalReviewElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, startupCost: startupCost, monthlyExpense: monthlyExepnse, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!), let startupCost = Double(goalReviewElement.getAmount!), let monthlyExepense = Double(goalReviewElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, startupCost: startupCost, monthlyExpense: monthlyExepense, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_HOUSE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_CAR) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_BIKE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_BANK_BALANCE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_RETIRE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.userCurrentAge!),
                    let retirementAge = Double(goalReviewElement.userRetirementAge!),
                    let lifeExpectency = Double(goalReviewElement.userLifeExpectency!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, currentAge: years, retirementAge: retirementAge, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.userCurrentAge!),
                    let retirementAge = Double(goalReviewElement.userRetirementAge!),
                    let lifeExpectency = Double(goalReviewElement.userLifeExpectency!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0.0, iSip: 0, currentAge: years, retirementAge: retirementAge, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!),
                    let years = Double(goalReviewElement.userCurrentAge!),
                    let retirementAge = Double(goalReviewElement.userRetirementAge!),
                    let lifeExpectency = Double(goalReviewElement.userLifeExpectency!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, currentAge: years, retirementAge: retirementAge, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!),
                    let years = Double(goalReviewElement.userCurrentAge!),
                    let retirementAge = Double(goalReviewElement.userRetirementAge!),
                    let lifeExpectency = Double(goalReviewElement.userLifeExpectency!),
                    let monthlyExpense = Double(goalReviewElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, currentAge: years, retirementAge: retirementAge, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_OTHER_CODE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0.0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.CHILD_EDU_GOAL) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0.0, iSip: 0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.CHILD_WEDS_GOAL) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0.0, iSip: 0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!), let years = Double(goalReviewElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if goalReviewElement.goalCode?.caseInsensitiveCompare(FincartCommon.EMERGENCY_GOAL) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let monthlyExpenses = Double(goalReviewElement.userMonthlyExpence!),
                    let emiValue = Double(goalReviewElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: value, gSip: 0, iLumpSum: 0, iSip: 0.0, years: years, expenses: monthlyExpenses, emi: emiValue, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(goalReviewElement.getAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let monthlyExpenses = Double(goalReviewElement.userMonthlyExpence!),
                    let emiValue = Double(goalReviewElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: value, gSip: 0, iLumpSum: 0, iSip: 0.0, years: years, expenses: monthlyExpenses, emi: emiValue, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(goalReviewElement.investAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let monthlyExpenses = Double(goalReviewElement.userMonthlyExpence!),
                    let emiValue = Double(goalReviewElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: 0, gSip: 0, iLumpSum: 0, iSip: value, years: years, expenses: monthlyExpenses, emi: emiValue, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(goalReviewElement.investAmount!),
                    let years = Double(goalReviewElement.goaltime!),
                    let monthlyExpenses = Double(goalReviewElement.userMonthlyExpence!),
                    let emiValue = Double(goalReviewElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: 0, gSip: 0, iLumpSum: value, iSip: 0.0, years: years, expenses: monthlyExpenses, emi: emiValue, type: "R")
                }
                break
            default:
                break
            }
        }
        return fundCalculationResult
    }
    
    //MARKS:- EDIT GOAL CALCULATION METHOD
    static func callMethodForCalculation(_ userGoalStatusServiceResponseElement : UserGoalStatusServiceResponseElement, changeBy: Int) -> FundCalculationResult{
        var fundCalculationResult = FundCalculationResult()
        if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_STUDIES) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.studyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_PLANING_KIDS) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.familyPlanningFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_OWN_WEDDING) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "")
                }
                break;
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.weddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_TRAVEL_PLAN) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let peopleCount = Double(userGoalStatusServiceResponseElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "", noOfPersons: peopleCount)
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let peopleCount = Double(userGoalStatusServiceResponseElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, years: years, type: "", noOfPersons: peopleCount)
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let peopleCount = Double(userGoalStatusServiceResponseElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: 0.0, iSip: value, years: years, type: "R", noOfPersons: peopleCount)
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let peopleCount = Double(userGoalStatusServiceResponseElement.travelingPeopleCount!){
                    fundCalculationResult = FundCalculator.travelFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: value, iSip: 0.0, years: years, type: "R", noOfPersons: peopleCount)
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_TIME_OFF) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let startTime = Double(userGoalStatusServiceResponseElement.sabbaticalStartTime!),
                    let endTime = Double(userGoalStatusServiceResponseElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let startTime = Double(userGoalStatusServiceResponseElement.sabbaticalStartTime!),
                    let endTime = Double(userGoalStatusServiceResponseElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: value, gSip: 0.0, iLumpsum: 0.0, iSip: 0.0, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let startTime = Double(userGoalStatusServiceResponseElement.sabbaticalStartTime!),
                    let endTime = Double(userGoalStatusServiceResponseElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: 0.0, iSip: value, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let startTime = Double(userGoalStatusServiceResponseElement.sabbaticalStartTime!),
                    let endTime = Double(userGoalStatusServiceResponseElement.sabbaticalEndTime!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.sabbaticalFund(0.0, gLumpsum: 0.0, gSip: 0.0, iLumpsum: value, iSip: 0.0, startTime: startTime, endTime: endTime, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_OWN_BUSINESS) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!), let startupCost = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let monthlyExepnse = Double(userGoalStatusServiceResponseElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: value, years: years, startupCost: startupCost, monthlyExpense: monthlyExepnse, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!), let startupCost = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let monthlyExepnse = Double(userGoalStatusServiceResponseElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: value, years: years, startupCost: startupCost, monthlyExpense: monthlyExepnse, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!), let startupCost = Double(userGoalStatusServiceResponseElement.getAmount!), let monthlyExepnse = Double(userGoalStatusServiceResponseElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, startupCost: startupCost, monthlyExpense: monthlyExepnse, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!), let startupCost = Double(userGoalStatusServiceResponseElement.getAmount!), let monthlyExepense = Double(userGoalStatusServiceResponseElement.monthlyAmount!){
                    fundCalculationResult = FundCalculator.businessFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, startupCost: startupCost, monthlyExpense: monthlyExepense, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_HOUSE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.houseFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_CAR) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.carFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_BIKE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.bikeFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_BANK_BALANCE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.wealthFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_RETIRE) == ComparisonResult.orderedSame {
            let goalTime = (Double(userGoalStatusServiceResponseElement.userCurrentAge!))! +  (Double(userGoalStatusServiceResponseElement.goaltime!))!
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.userCurrentAge!),
                    let lifeExpectency = Double(userGoalStatusServiceResponseElement.userLifeExpectency!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, currentAge: years, retirementAge: goalTime, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.userCurrentAge!),
                    let lifeExpectency = Double(userGoalStatusServiceResponseElement.userLifeExpectency!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0.0, iSip: 0, currentAge: years, retirementAge: goalTime, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.userCurrentAge!),
                    let lifeExpectency = Double(userGoalStatusServiceResponseElement.userLifeExpectency!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, currentAge: years, retirementAge: goalTime, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.userCurrentAge!),
                    let lifeExpectency = Double(userGoalStatusServiceResponseElement.userLifeExpectency!),
                    let monthlyExpense = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!){
                    fundCalculationResult = FundCalculator.retirementFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, currentAge: years, retirementAge: goalTime, lifeExpectency: lifeExpectency, monthlyExepnse: monthlyExpense, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.GOAL_OTHER_CODE) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.otherFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0.0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.CHILD_EDU_GOAL) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0.0, iSip: 0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childStudyFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.CHILD_WEDS_GOAL) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0, iSip: 0.0, years: years, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: value, gSip: 0, iLumpsum: 0.0, iSip: 0, years: years, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: 0, iSip: value, years: years, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!), let years = Double(userGoalStatusServiceResponseElement.goaltime!){
                    fundCalculationResult = FundCalculator.childWeddingFund(0, gLumpsum: 0, gSip: 0, iLumpsum: value, iSip: 0, years: years, type: "R")
                }
                break
            default:
                break
            }
        }
        else if userGoalStatusServiceResponseElement.goalCode?.caseInsensitiveCompare(FincartCommon.EMERGENCY_GOAL) == ComparisonResult.orderedSame {
            switch (changeBy){
            case FincartCommon.BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let monthlyExpenses = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!),
                    let emiValue = Double(userGoalStatusServiceResponseElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: value, gSip: 0, iLumpSum: 0, iSip: 0.0, years: years, expenses: monthlyExpenses, emi: emiValue, type: "")
                }
                break
            case FincartCommon.BY_ONE_TIME:
                if let value = Double(userGoalStatusServiceResponseElement.getAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let monthlyExpenses = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!),
                    let emiValue = Double(userGoalStatusServiceResponseElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: value, gSip: 0, iLumpSum: 0, iSip: 0.0, years: years, expenses: monthlyExpenses, emi: emiValue, type: "")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_MONTHLY:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let monthlyExpenses = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!),
                    let emiValue = Double(userGoalStatusServiceResponseElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: 0, gSip: 0, iLumpSum: 0, iSip: value, years: years, expenses: monthlyExpenses, emi: emiValue, type: "R")
                }
                break
            case FincartCommon.SLIDER_CHANGE_BY_ONETIME:
                if let value = Double(userGoalStatusServiceResponseElement.investAmount!),
                    let years = Double(userGoalStatusServiceResponseElement.goaltime!),
                    let monthlyExpenses = Double(userGoalStatusServiceResponseElement.userMonthlyExpence!),
                    let emiValue = Double(userGoalStatusServiceResponseElement.userEmiAmount!){
                    fundCalculationResult = FundCalculator.emergencyFund(0, gLumpsum: 0, gSip: 0, iLumpSum: value, iSip: 0.0, years: years, expenses: monthlyExpenses, emi: emiValue, type: "R")
                }
                break
            default:
                break
            }
        }
        return fundCalculationResult
    }
}
