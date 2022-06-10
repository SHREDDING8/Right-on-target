//
//  Round.swift
//  Right on target
//
//  Created by SHREDDING on 09.06.2022.
//

import Foundation
protocol RoundProtocol{
    var score:Int{get}
    var currentValue:Int{get}
    func calculateScore(value:Int)
}

class Round:RoundProtocol{
    var score: Int
    
    var currentValue: Int
    var currentSecretValue:Int
    
    init(score:Int,currentValue:Int,currentSecretValue:Int) {
        self.score = score
        self.currentValue = currentValue
        self.currentSecretValue = currentSecretValue
    }
    
    func calculateScore(value: Int){
        if value == self.currentSecretValue{
            score+=50
        }else if value > currentSecretValue{
            score+=50+currentSecretValue-value
        }else{
            score+=50+value-currentSecretValue
        }
    }
}
