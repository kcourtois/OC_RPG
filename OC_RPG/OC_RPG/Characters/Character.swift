//
//  Character.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Character {
    //Enum of possible states for the character
    enum States {
        case Normal, Poisoned, Paralyzed, Confused
    }
    //StateTurns is an int that determins how many turns are left with an altered state
    private var stateTurns:Int {
        didSet {
            //If stateTurns goes to 0, status alteration is over. status goes back to normal
            if stateTurns <= 0 {
                status = .Normal
            }
            //Get hit by poison when state updates
            if status == .Poisoned {
                currentHp -= Int.random(in: 3...8)
            }
        }
    }
    //Character's current state
    var status:States {
        didSet {
            if status != .Normal {
                stateTurns = 3
            }
        }
    }
    //Character's name
    let name:String
    //Character's maximum hp
    let maxHp:Int
    //Current hp of the character. didSet will keep it into the range from 0 to maxHp.
    private(set) var currentHp:Int {
        didSet {
            if currentHp > maxHp {
                currentHp = maxHp
            }
            else if currentHp < 0 {
                currentHp = 0
            }
        }
    }
    //Weapon can be read but not set by an external class
    private(set) var weapon:Weapon
    //ClassName is used for prints
    let className:String
    //Returns true if character is still alive
    var isAlive:Bool {
        return currentHp > 0
    }
    //Action description, used for the attack report
    let actionDesc:String
    //Commentary, used for the attack report
    let commentary:String
    
    init(name:String, className:String, maxHp:Int, weapon:Weapon, actionDesc:String, commentary:String) {
        self.name = name
        self.maxHp = maxHp
        self.currentHp = maxHp
        self.weapon = weapon
        self.className = className
        self.status = .Normal
        self.stateTurns = 0
        self.actionDesc = actionDesc
        self.commentary = commentary
    }
    
    //Returns a string to resume all the datas of the character
    func printChar() -> String {
        return "\(name), \(className). Atk: \(weapon.power), HP: \(currentHp)/\(maxHp), Status: \(status)."
    }
    
    //updates status by decreasing stateTurns
    func updateStatus() {
        if status != .Normal {
            stateTurns -= 1
        }
    }
    
    //Opens the chest given in parameters and equip the new weapon found inside it
    func openChest(chest:Chest) {
        weapon = chest.loot(char: self)
    }
    
    //Attack function that inflicts weapon power dmg to target
    func attack(target:Character) -> AttackReport {
        //Stores hp of the target before atk
        let previousHp:Int = target.currentHp
        //Does the attack to the target
        target.currentHp = target.currentHp - weapon.power
        
        return AttackReport(target: target, attacker: self, actionDesc: actionDesc, commentary: commentary, previousHp: previousHp)
    }
}
//"was attacked by"
//"doesn't care."
