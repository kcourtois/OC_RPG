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
        super.init(name: name, className: "Fighter", maxHp: 100, weapon: basicWeapon)
    }
    
    //Custom fighter attack report
    override func attack(target: Character) -> AttackReport {
        //Stores hp of the target before atk
        let previousHp:Int = target.currentHp
        //Call super but ignore return value
        _ = super.attack(target: target)
        
        return AttackReport(target: target, attacker: self, actionDesc:"strikes", commentary:"couldn't dodge this blade.", previousHp: previousHp)
    }
}
