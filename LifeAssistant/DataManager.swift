//
//  DataManager.swift
//  LifeAssistant
//
//  Created by Daniel Kim on 1/31/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import Foundation

struct DataManager {
    static var defaults = UserDefaults.standard
    
    static func setMasteryNum(number : Int) {
        DataManager.defaults.set(number, forKey: "masteryNum")
    }
    
    static func getHour(index : Int) -> Int {
        let targetString = self.defaults.object(forKey: "\(index + 1)") as! String
        let interval = self.defaults.double(forKey: targetString)
        let hours = Int(floor(interval / 3600))
        
        return hours
    }
    
    static func getMinute(index: Int) -> Int {
        let targetString = self.defaults.object(forKey: "\(index + 1)") as! String
        let interval = self.defaults.double(forKey: targetString)
        
        let minutes = Int(floor((interval - Double(self.getHour(index: index)) * 3600) / 60))
        
        return minutes
    }
    
    static func getSecond(index : Int) -> Int {
        let targetString = self.defaults.object(forKey: "\(index + 1)") as! String
        let interval = self.defaults.double(forKey: targetString)
        let hours = floor(Double(self.getHour(index: index))) * 3600
        let minutes = floor(Double(self.getMinute(index: index))) * 60
        let seconds = Int(interval - hours - minutes)
        
        return seconds
    }

    static var tempMasteryName = ""
}
