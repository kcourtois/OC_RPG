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
        super.init(name: name, className: "Mage", maxHp: 100, weapon: basicWeapon)
    }
    
    //Custom mage attack report
    override func attack(target: Character) -> AttackReport {
        //Stores hp of the target before atk
        let previousHp:Int = target.currentHp
        //Call super but ignore return value
        _ = super.attack(target: target)
        
        return AttackReport(target: target, attacker: self, actionDesc:"heals", commentary:"feels better now.", previousHp: previousHp)
    }
}
