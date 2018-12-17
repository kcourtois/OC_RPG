//
//  Mage.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Mage: Character {
    let name:String
    let archetype:Archetype
    let life:Int
    let weapon:Weapon
    
    required init(name:String) {
        self.name = name
        self.archetype = Archetype(archName: .Mage, archRole: .Heal)
        self.life = 100
        self.weapon = Weapon(name: "Wooden Staff", power: 10)
    }
}
