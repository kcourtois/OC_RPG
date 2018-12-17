//
//  Colossus.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Colossus: Character {
    let name:String
    let archetype:Archetype
    let life:Int
    let weapon:Weapon
    
    required init(name:String) {
        self.name = name
        self.archetype = Archetype(archName: .Colossus, archRole: .Damage)
        self.life = 200
        self.weapon = Weapon(name: "Wooden Mace", power: 5)
    }
}
