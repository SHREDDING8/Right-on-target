//
//  GenereteRandomNumber.swift
//  Right on target
//
//  Created by SHREDDING on 09.06.2022.
//

import Foundation
import UIKit

protocol GenerateRandomValueProtocol{
    static func GenerateRandomValueNumber(_ minvalue:Int, _ maxValue:Int)->Int
    static func generateRandomColor()->(UIColor,String)
}


class GenerateRandomValue:GenerateRandomValueProtocol{
    static public func GenerateRandomValueNumber(_ minvalue: Int, _ maxValue: Int)->Int {
        return Int.random(in: minvalue...maxValue)
    }
    
    static func generateRandomColor()->(UIColor,String){
        let red = Float(self.GenerateRandomValueNumber(0, 255))
        let green = Float(self.GenerateRandomValueNumber(0, 255))
        let blue = Float(self.GenerateRandomValueNumber(0, 255))
        let colorResult = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1.0)
        let hexColor = "#" + String(format: "%2X", Int(red)) + String(format: "%2X", Int(green)) + String(format: "%2X", Int(blue))
        return (colorResult,hexColor)
    }
    
    
    
}
