//
//  GameColor.swift
//  Right on target
//
//  Created by SHREDDING on 10.06.2022.
//

import Foundation
import UIKit

protocol GameColorProtocol{
    //Score
    var score:Int{get}
    var currentRound:Int{get}
    var numberOfRounds:Int{get}
    var secretColor:(UIColor,String){get}
    var gameIsEnded:Bool{get}
    func startRound()
    func restartGame()
    func checkColor(_ value:UIColor )->Bool
    
    func calculateScore(_ value:UIColor)
}

class GameColor:GameColorProtocol{
    
    var score = 0
    
    var currentRound = 1
    
    var numberOfRounds: Int
    
    var secretColor: (UIColor, String)
    
    var colors = [(UIColor, String)]()
    
    
    var gameIsEnded: Bool{
        if currentRound > numberOfRounds{
            return true
        }
        return false
    }
    
    
    init?(numberOfRounds:Int) {
        self.numberOfRounds = numberOfRounds
        secretColor = GenerateRandomValue.generateRandomColor()
        self.generateOtherColors()
        self.currentRound+=1
    }
    
    func startRound() {
        secretColor = GenerateRandomValue.generateRandomColor()
        self.currentRound+=1
        self.generateOtherColors()
    }
    
    func restartGame() {
        self.currentRound = 1
        score = 0
        startRound()
    }
    
    func checkColor(_ value:UIColor ) ->Bool{
        return value == self.secretColor.0
    }
    
    func calculateScore(_ value:UIColor){
        if checkColor(value){
            self.score+=100
        }
    }
    
    func generateOtherColors(){
        let otherFirstColor = GenerateRandomValue.generateRandomColor()
        let otherSecondColor = GenerateRandomValue.generateRandomColor()
        let otherThirdColor = GenerateRandomValue.generateRandomColor()
        
        var otherColors = [otherFirstColor,otherSecondColor,otherThirdColor,self.secretColor]
        
        let randomNumber = Int.random(in: 0...3)
        if randomNumber != 3{
            otherColors[3] = otherColors[randomNumber]
            otherColors[randomNumber] = self.secretColor
        }
        self.colors = otherColors
    }
}
