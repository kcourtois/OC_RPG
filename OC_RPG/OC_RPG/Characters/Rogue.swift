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
    //When attacking, a rogue can poison his target
    override func attack(target: Character) -> AttackReport {
        //Stores hp of the target before atk
        let previousHp:Int = target.currentHp
        //Call super but ignore return value
        _ = super.attack(target: target)
        //33% of chance to poison when attacking enemy
        let poisonPercentage:Int = 33
        let random:Int = Int.random(in: 0...100)
        if random <= poisonPercentage {
            target.status = .Poisoned
        }
        
        return AttackReport(target: target, attacker: self, actionDesc:"stabs", commentary:"did not see this coming.", previousHp: previousHp)
    }
}
