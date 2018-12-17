//
//  Colossus.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Colossus: Character {
    init(name:String) {
        let basicWeapon = Weapon(name: "Wooden Mace", power: 5)
        let arch = Archetype(archName: .Colossus, archRole: .Damage)
        super.init(name: name, archetype: arch, life: 200, weapon: basicWeapon)
    }
}
