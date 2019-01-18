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
        let basicWeapon = WoodenMace()
        super.init(name: name, className: "Colossus", maxHp: 200, weapon: basicWeapon, actionDesc:"slaps", commentary:"will have a headache.")
    }
    
    //When attacking, a colossus can paralyze his target
    override func attack(target: Character) -> AttackReport {
        //25% of chance to paralyze when attacking enemy
        let paralyzePercentage:Int = 25
        let random:Int = Int.random(in: 0...100)
        if random <= paralyzePercentage {
            target.status = .Paralyzed
        }
        return super.attack(target: target)
    }
}
