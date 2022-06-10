//
//  Game.swift
//  Right on target
//
//  Created by SHREDDING on 09.06.2022.
//

import Foundation

protocol GameProtocol {
// Количество заработанных очков
var score: Int { get }
// Загаданное значение
var currentSecretValue: Int { get }
// Проверяет, закончена ли игра
var isGameEnded: Bool { get }
// Начинает новую игру и сразу стартует первый раунд
func restartGame()
// Начинает новый раунд (обновляет загаданное число)
func startNewRound()
// Сравнивает переданное значение с загаданным и начисляет очки func calculateScore(with value: Int)
    func calculateScore(with value: Int)
}



class Game:GameProtocol{
    public var score: Int = 0
    
    public var currentSecretValue: Int = 0
    // Минимальное загаданное значение
    private let minSecretValue:Int
    // Максимальное загаданное значение
    private let maxSecretValue:Int
    
    private let lastRound:Int
    private var currentRound = 1
    
    
    var isGameEnded: Bool{
        if currentRound>lastRound{
            return true
        }
        return false
    }
    
    init?(startvalue:Int,endValue:Int,rounds:Int){
        if startvalue>=endValue{
            return nil
        }
        self.lastRound = rounds
        self.minSecretValue = startvalue
        self.maxSecretValue = endValue
        self.currentSecretValue = self.getNewSecretValue()
    }
    
    
    private func getNewSecretValue() ->Int{
         return GenerateRandomValue.GenerateRandomValueNumber(self.minSecretValue, self.maxSecretValue)
    }
    
    public func restartGame() {
        self.score = 0
        self.currentRound = 0
        self.startNewRound()
    }
    
    public func startNewRound() {
        self.currentSecretValue = self.getNewSecretValue()
        currentRound+=1
    }
    public func calculateScore(with value:Int){
        if value == self.currentSecretValue{
            score+=50
        }else if value > currentSecretValue{
            score+=50+currentSecretValue-value
        }else{
            score+=50+value-currentSecretValue
        }
        
    }
    
    
}
