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
    let archetype:Archetype
    let life:Int
    let weapon:Weapon
    
    init(name:String, archetype:Archetype, life:Int, weapon:Weapon) {
        self.name = name
        self.archetype = archetype
        self.life = life
        self.weapon = weapon
    }
}
