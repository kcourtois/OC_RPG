//
//  Weapon.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Weapon {
    let name:String
    //The power of a weapon is a value that can be damage or heal depending of the character's class.
    let power:Int
    
    init(name:String, power:Int) {
        self.name = name
        self.power = power
    }
}
