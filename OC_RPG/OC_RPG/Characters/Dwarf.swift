//
//  Dwarf.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Dwarf: Character {
    init(name:String) {
        let basicWeapon = Weapon(name: "Steel Axe", power: 20)
        let arch = Archetype(archName: .Dwarf, archRole: .Damage)
        super.init(name: name, archetype: arch, life: 50, weapon: basicWeapon)
    }
}
