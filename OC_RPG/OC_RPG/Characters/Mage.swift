//
//  Mage.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Mage: Character {
    init(name:String) {
        let basicWeapon = WoodenStaff()
        super.init(name: name, className: "Mage", maxHp: 100, weapon: basicWeapon, actionDesc:"heals", commentary:"feels better now.")
    }
}
