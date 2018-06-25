//
//  FundFinance.swift
//  Fincart
//
//  Created by Kamal on 25/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FundFinance: NSObject
{
    func PV(_ rate: Double, periods: Double, payment: Double, future: Double, type: Double!) -> Double
    {
        let typeValue = type ?? 0.0
        
        if rate.isEqual(to: 0.0) || rate.isEqual(to: 0){
            return ((-payment) * periods) - future
        }else{
            return (((1 - pow(Double(1 - rate), periods)))/rate * payment * (1 + rate * typeValue) - future)/pow(Double(1 - rate), periods)
        }
    }
    
    func FV(_ rate: Double!, nper: Double, payment: Double, pv: Double, type: Double!) -> Double
    {
        let typeValue = type ?? 0.0
        let rateValue = rate ?? 0.0
        if rateValue.isEqual(to: 0.0) || rateValue.isEqual(to: 0){
            return -1 * (pv * payment * nper)
        }else{
            let power = pow(Double(1 + rateValue), nper)
            var result = (payment * (1 + rate * typeValue) * (1 - power)/rateValue)
            result = result - pv * power
            return  result
        }
    }
    
    func PMT(_ rate: Double!, nper: Double, pv: Double, fv: Double!, type: Double!) -> Double
    {
        let typeValue = type ?? 0.0
        let fvValue = fv ?? 0.0
        
        if rate.isEqual(to: 0.0) || rate.isEqual(to: 0)
        {
            return -(pv + fvValue)/nper
        }
        let power = pow(Double(1 + rate), nper)
        var payment = rate/(power - 1) - (pv * power + fvValue)
        if typeValue.isEqual(to: 1.0) || typeValue.isEqual(to: 1){
            payment = payment/(1 + rate)
        }
        return payment
    }
    
    func ROR(_ time: Double, type: String) -> Double
    {
        var ror: Double = 6.0
        if type.caseInsensitiveCompare("M") == ComparisonResult.orderedSame
        {
            if time.isLessThanOrEqualTo(1.0) || time.isLessThanOrEqualTo(1) {
                ror = 0.4868;
            }
            else if time.isLessThanOrEqualTo(3.0) || time.isLessThanOrEqualTo(3) {
                ror = 0.5262;
            }
            else if time.isLessThanOrEqualTo(4.0) || time.isLessThanOrEqualTo(4){
                ror = 0.6821;
            }
            else if time.isLessThanOrEqualTo(7.0) || time.isLessThanOrEqualTo(7){
                ror = 0.7974;
            }
            else {
                ror = 0.9489;
            }
        }else
        {
            if time.isLessThanOrEqualTo(1.0) || time.isLessThanOrEqualTo(1) {
                ror = 6.0;
            }
            else if time.isLessThanOrEqualTo(3.0) || time.isLessThanOrEqualTo(3) {
                ror = 6.5;
            }
            else if time.isLessThanOrEqualTo(4.0) || time.isLessThanOrEqualTo(4) {
                ror = 8.5;
            }
            else if time.isLessThanOrEqualTo(7.0) || time.isLessThanOrEqualTo(7) {
                ror = 10.0;
            }
            else {
                ror = 12.0;
            }
        }
        return ror
    }
}
