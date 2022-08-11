//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Алексей Гуляев on 11.08.2022.
//

import Foundation

struct Tipsy {
    var currentPercentOfTips:Double = 0.0
    var currentPersentFromLabel:String = ""
    var numberOfPerson:Double = 0.0
    var currentBill:Double = 0.0
    var personalBill:Double = 0.0
    
    mutating func getPersonalBill() {
        self.personalBill = (self.currentBill + self.currentBill * self.currentPercentOfTips) / self.numberOfPerson
    }
}
