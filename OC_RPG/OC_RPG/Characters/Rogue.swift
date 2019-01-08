//
//  Rogue.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 08/01/2019.
//  Copyright © 2019 Kévin Courtois. All rights reserved.
//

import Foundation

class Rogue: Character {
    init(name:String) {
        let basicWeapon = WoodenDagger()
        super.init(name: name, className: "Rogue", maxHp: 80, weapon: basicWeapon)
    }
}
