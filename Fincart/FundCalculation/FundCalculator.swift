//
//  FundCalculator.swift
//  Fincart
//
//  Created by Kamal on 25/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FundCalculator: NSObject
{
    static func emergencyFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpSum: Double, iSip: Double, years: Double, expenses: Double, emi: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpSum
        fundCalculationResult.investmentSip = iSip
        
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = 0.0 / 100
            let fvlnper = years
            let fvlpmt = 0.0
            let fvlpv = -iLumpSum
            let fvltype = 1.0
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12
            let fvspmt = -iSip
            let fvspv = 0.0
            let fvstype = 1.0
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else{
            let corpus_goal_today = (expenses + emi) * 6
            var corpus_goal_start = Double(corpus_goal_today)
            
            if (gLumpsum > 0) {
                corpus_goal_start = gLumpsum
            }
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = 18.0;
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = 0.0 / 100;
            let pvnper = 18.0;
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func termsInsuranceFund(_ annualIncome: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double) -> FundCalculationResult
    {
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let times = 10.0;
        fundCalculationResult.lumpsum = annualIncome * times
        fundCalculationResult.sip = 0.0
        
        fundCalculationResult.investmentLumpsum = 0.0
        fundCalculationResult.investmentSip = 0.0
        return fundCalculationResult
    }
    
    static func healthInsuranceFund(_ annualIncome: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, childCount: Double, martialStatus: String) -> FundCalculationResult
    {
        let fundCalculationResult = FundCalculationResult()
        if (martialStatus == "001") {
            if (annualIncome < 500000) {
                fundCalculationResult.lumpsum = 500000.0
            }
            else if (annualIncome < 1000000) {
                fundCalculationResult.lumpsum = 500000.0
            }
            else if (annualIncome < 2000000) {
               fundCalculationResult.lumpsum = 1000000.0
            }
            else if (annualIncome < 5000000) {
                fundCalculationResult.lumpsum = 1500000.0
            }
            else {
                fundCalculationResult.lumpsum = 2000000.0
            }
        }
        else if (martialStatus == "002") {
            if (annualIncome < 500000) {
                fundCalculationResult.lumpsum = 800000.0
            }
            else if (annualIncome < 1000000) {
                fundCalculationResult.lumpsum = 800000.0
            }
            else if (annualIncome < 2000000) {
                fundCalculationResult.lumpsum = 1500000.0
            }
            else if (annualIncome < 5000000) {
                fundCalculationResult.lumpsum = 2300000.0
            }
            else {
                fundCalculationResult.lumpsum = 3000000.0
            }
        }
        else if (martialStatus == "003") {
            if (childCount == 1) {
                if (annualIncome < 500000) {
                    fundCalculationResult.lumpsum = 900000.0
                }
                else if (annualIncome < 1000000) {
                    fundCalculationResult.lumpsum = 900000.0
                }
                else if (annualIncome < 2000000) {
                    fundCalculationResult.lumpsum = 1800000.0
                }
                else if (annualIncome < 5000000) {
                    fundCalculationResult.lumpsum = 2600000.0
                }
                else {
                    fundCalculationResult.lumpsum = 3500000.0
                }
            }
            else if (childCount == 2) {
                if (annualIncome < 500000) {
                    fundCalculationResult.lumpsum = 1000000.0
                }
                else if (annualIncome < 1000000) {
                    fundCalculationResult.lumpsum = 1000000.0
                }
                else if (annualIncome < 2000000) {
                    fundCalculationResult.lumpsum = 2000000.0
                }
                else if (annualIncome < 5000000) {
                    fundCalculationResult.lumpsum = 3000000.0
                }
                else {
                    fundCalculationResult.lumpsum = 4000000.0
                }
            }
            else if (childCount == 3) {
                if (annualIncome < 500000) {
                    fundCalculationResult.lumpsum = 1000000.0
                }
                else if (annualIncome < 1000000) {
                    fundCalculationResult.lumpsum = 1000000.0
                }
                else if (annualIncome < 2000000) {
                    fundCalculationResult.lumpsum = 2000000.0
                }
                else if (annualIncome < 5000000) {
                    fundCalculationResult.lumpsum = 3000000.0
                }
                else {
                    fundCalculationResult.lumpsum = 4000000.0
                }
            }
        }
        return fundCalculationResult
    }
    
    static func studyFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 10.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func carFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func bikeFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func houseFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let downpaymentRate = 25.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpus_goal_today = gLumpsum/downpaymentRate
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * downpaymentRate
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func wealthFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 0.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpus_goal_today = gLumpsum
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func otherFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func travelFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String, noOfPersons: Double) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult)) * noOfPersons
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount * noOfPersons
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func weddingFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func childStudyFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 10.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func childWeddingFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func familyPlanningFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 10.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            var corpusResult = round(fundFinance.FV(inflation, nper: years, payment: 0.0, pv: -gLumpsum, type: 0.0))
            var corpus_goal_today = Double(abs(corpusResult))
            if (currentAmount > 0) {
                corpus_goal_today = currentAmount
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func businessFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, years: Double, startupCost: Double, monthlyExpense: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 10.0/100.0
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            let monthly_pvrate = 0.6821/100
            let monthly_pvnper = 18.0
            let monthly_pvpmt = monthlyExpense * pow(Double(1 + inflation), years)
            let monthly_pvfv = 0.0
            let pmonthly_vtype = 1.0;
            var monthly_corpus_result = round(fundFinance.FV(monthly_pvrate, nper: monthly_pvnper, payment: monthly_pvpmt, pv: monthly_pvfv, type: pmonthly_vtype))
            let monthly_corpus_goal_today = Double(abs(monthly_corpus_result))
            
            var corpus_goal_today = startupCost + monthly_corpus_goal_today
            if (gLumpsum > 0) {
                corpus_goal_today = gLumpsum
            }
            
            let corpus_goal_start = corpus_goal_today * pow(Double(1 + inflation), years)
            
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func retirementFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, currentAge: Double, retirementAge: Double, lifeExpectency: Double, monthlyExepnse: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        let years:Double = retirementAge - currentAge
        let post_retirement_years = lifeExpectency - retirementAge
        let monthlyExpense_At_Retirement = monthlyExepnse * pow(Double(1 + inflation), years)
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else
        {
            let today_pvrate = 0.116 / 100;
            let today_pvnper = post_retirement_years * 12;
            let today_pvpmt = -monthlyExpense_At_Retirement;
            let today_pvfv = 0.0;
            let today_pvtype = 1.0;
            
            var corpus_goal_start = round(fundFinance.PV(today_pvrate, periods: today_pvnper, payment: today_pvpmt, future: today_pvfv, type: today_pvtype))
            corpus_goal_start = Double(abs(corpus_goal_start))
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
    
    static func sabbaticalFund(_ currentAmount: Double, gLumpsum: Double, gSip: Double, iLumpsum: Double, iSip: Double, startTime: Double, endTime: Double, monthlyExepnse: Double, type:String) -> FundCalculationResult
    {
        let fundFinance = FundFinance()
        let fundCalculationResult = FundCalculationResult()
        
        fundCalculationResult.lumpsum = gLumpsum
        fundCalculationResult.sip = gSip
        fundCalculationResult.investmentLumpsum = iLumpsum
        fundCalculationResult.investmentSip = iSip
        
        let inflation = 6.0/100.0
        let years = startTime
        let monthlyExpense_At_Sabbatical = monthlyExepnse * pow(Double(1 + inflation), years)
        if type.caseInsensitiveCompare("R") == ComparisonResult.orderedSame
        {
            let fvlrate = fundFinance.ROR(years, type: "")/100
            let fvlnper = years;
            let fvlpmt = 0.0;
            let fvlpv = -iLumpsum;
            let fvltype = 1.0;
            
            let fvsrate = fundFinance.ROR(years, type: "M")/100
            let fvsnper = years * 12;
            let fvspmt = -iSip;
            let fvspv = 0.0;
            let fvstype = 1.0;
            
            let lumpSumResult = round(fundFinance.FV(fvlrate, nper: fvlnper, payment: fvlpmt, pv: fvlpv, type: fvltype))
            let sipResult = round(fundFinance.FV(fvsrate, nper: fvsnper, payment: fvspmt, pv: fvspv, type: fvstype))
            fundCalculationResult.lumpsum = Double(exactly: abs(lumpSumResult))!
            fundCalculationResult.sip = Double(exactly: abs(sipResult))!
        }else{
            let today_pvrate = 0.116 / 100;
            let today_pvnper = endTime * 12;
            let today_pvpmt = -monthlyExpense_At_Sabbatical;
            let today_pvfv = 0.0;
            let today_pvtype = 1.0;
            
            var corpus_goal_start = round(fundFinance.PV(today_pvrate, periods: today_pvnper, payment: today_pvpmt, future: today_pvfv, type: today_pvtype))
            corpus_goal_start = Double(abs(corpus_goal_start))
            let pmrate = fundFinance.ROR(years, type: "M")/100;
            let pmnper = years * 12
            let pmpv = 0.0;
            let pmfv = -corpus_goal_start;
            let pmtype = 1.0;
            
            let pvrate = fundFinance.ROR(years, type: "")/100;
            let pvnper = years
            let pvpmt = 0.0;
            let pvfv = -corpus_goal_start;
            let pvtype = 1.0;
            
            let investmentLumpsumResult = round(fundFinance.PV(pvrate, periods: pvnper, payment: pvpmt, future: pvfv, type: pvtype))
            let investmentSipResult = round(fundFinance.PMT(pmrate, nper: pmnper, pv: pmpv, fv: pmfv, type: pmtype))
            fundCalculationResult.investmentLumpsum = Double(exactly: abs(investmentLumpsumResult))!
            fundCalculationResult.investmentSip = Double(exactly: abs(investmentSipResult))!
        }
        return fundCalculationResult
    }
}
