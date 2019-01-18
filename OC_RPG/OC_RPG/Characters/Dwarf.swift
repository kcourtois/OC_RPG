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
        let basicWeapon = WoodenAxe()
        super.init(name: name, className:"Dwarf", maxHp: 50, weapon: basicWeapon, actionDesc:"smashes", commentary:"is seriously injured.")
    }
    
    //When attacking, a dwarf sometimes get himself confused
    override func attack(target: Character) -> AttackReport {
        //15% of chance to get confused when attacking enemy
        let confusionPercentage:Int = 15
        let random:Int = Int.random(in: 0...100)
        if random <= confusionPercentage {
            self.status = .Confused
        }
        return super.attack(target: target)
    }
}
