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

    static var tempMasteryName = ""
}
