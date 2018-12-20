//
//  Fighter.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Fighter: Character {
    init(name:String) {
        let basicWeapon = Weapon(name: "Steel Sword", power: 10)
        super.init(name: name, maxHp: 100, weapon: basicWeapon)
    }
}
