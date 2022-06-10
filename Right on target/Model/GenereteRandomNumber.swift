//
//  GenereteRandomNumber.swift
//  Right on target
//
//  Created by SHREDDING on 09.06.2022.
//

import Foundation

protocol GenerateRandomValueProtocol{
    static func GenerateRandomValueNumber(_ minvalue:Int, _ maxValue:Int)->Int
}


class GenerateRandomValue:GenerateRandomValueProtocol{
    static public func GenerateRandomValueNumber(_ minvalue: Int, _ maxValue: Int)->Int {
        return Int.random(in: minvalue...maxValue)
    }
    
    
}
