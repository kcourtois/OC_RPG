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
        let basicWeapon = WoodenSword()
        super.init(name: name, className: "Fighter", maxHp: 100, weapon: basicWeapon, actionDesc: "strikes", commentary:"couldn't dodge this blade.")
    }
}
