//
//  Weapon.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//A character needs a weapon to battle.
//A weapon has a name and a "power score"
class Weapon {
    //Weapon name
    let name:String
    //The power of a weapon is a value that can be damage or heal depending of the character's class.
    let power:Int
    //Minimum power of the weapon
    let minPower:Int
    //Maximum power of the weapon
    let maxPower:Int
    
    init(name:String, minPower:Int, maxPower:Int) {
        self.name = name
        self.minPower = minPower
        self.maxPower = maxPower
        power = Int.random(in: minPower...maxPower)
    }
    
    //Changes weapon power randomly in the range of min and max power
    func generateWeaponPower() -> Int {
        return Int.random(in: minPower...maxPower)
    }
}
