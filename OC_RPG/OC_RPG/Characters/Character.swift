//
//  Character.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Character {
    enum States {
        case Normal, Poisoned, Paralyzed, Confused
    }
    var status:States
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
    private(set) var weapon:Weapon
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
        self.status = .Normal
    }
    
    //Returns a string to resume all the datas of the character
    func printChar() -> String {
        return "\(name), \(className). Atk: \(weapon.power), HP: \(currentHp)/\(maxHp), Status: \(status)."
    }
    
    //Opens the chest given in parameters and equip the new weapon found inside it
    func openChest(chest:Chest) {
        weapon = chest.loot(char: self)
    }
    
    //Attack function that inflicts weapon power dmg to target
    func attack(target:Character){
        target.currentHp = target.currentHp - weapon.power
    }
}
