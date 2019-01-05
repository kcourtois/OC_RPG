//
//  Character.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Character {
    let name:String
    let maxHp:Int
    var currentHp:Int {
        didSet {
            if currentHp > maxHp {
                currentHp = maxHp
            }
            else if currentHp < 0 {
                currentHp = 0
            }
        }
    }
    let weapon:Weapon
    let className:String
    var isAlive:Bool {
        return currentHp > 0
    }
    
    init(name:String, className:String, maxHp:Int, weapon:Weapon) {
        self.name = name
        self.maxHp = maxHp
        self.currentHp = maxHp
        self.weapon = weapon
        self.className = className
    }
    
    //Returns a string to resume all the datas of the character
    func printChar() -> String {
        return "\(name), \(className). Atk: \(weapon.power) HP: \(currentHp)/\(maxHp)"
    }
    
    //Attack function that inflicts weapon power dmg to target
    func attack(target:Character){
        target.currentHp = target.currentHp - weapon.power
    }
}
