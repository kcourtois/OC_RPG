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
        let basicWeapon = Mace()
        super.init(name: name, className: "Colossus", maxHp: 200, weapon: basicWeapon)
    }
}
