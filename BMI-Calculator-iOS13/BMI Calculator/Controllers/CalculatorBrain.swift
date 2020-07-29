//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Doris Zhou on 2020-07-28.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit
struct CalculatorBrain{
    var bmi : BMI?
    mutating func calculateBMI(height: Float, weight: Float){
        let value = weight/pow(height, 2)
        
        if value < 18.5 {
            bmi = BMI(value: value, advice: "Eat more pies!", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        }
        else if value < 24.9 {
            bmi = BMI(value: value, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        }
        else{
            bmi = BMI(value: value, advice: "Eat fewer pies", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        }
        
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice!"
    }
    func getColor() -> UIColor {
        let defaultColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return bmi?.color ?? defaultColor
    }
    func getBMIValue() -> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
}
