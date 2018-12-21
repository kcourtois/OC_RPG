//
//  Character.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Character {
    let name:String
    let maxHp:Int
    let currentHp:Int
    let weapon:Weapon
    let className:String
    
    init(name:String, className:String, maxHp:Int, weapon:Weapon) {
        self.name = name
        self.maxHp = maxHp
        self.currentHp = maxHp
        self.weapon = weapon
        self.className = className
    }
}
