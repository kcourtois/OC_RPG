//
//  Fight.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 18/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Fight {
    
    //Stores the number of turns that were played until the end of the battle
    var nbOfTurns:Int
    
    init() {
        //Nb of turns begins at 0.
        nbOfTurns = 0
    }
    
    //Func that will do an attack between current player and next player.
    //Returns a string that describes the action of this turn.
    func duel(atkChar:Character, defChar:Character) -> String {
        var output:String = "\n\n"
        
        switch atkChar {
        case is Mage:
            output += "\(atkChar.name) heals \(defChar.name) with his \(atkChar.weapon.name). \(defChar.name) feels better now. HP: \(defChar.currentHp) -> "
        case is Fighter:
            output += "\(atkChar.name) strikes \(defChar.name) with his \(atkChar.weapon.name). \(defChar.name) couldn't dodge this blade. HP: \(defChar.currentHp) -> "
        case is Colossus:
            output += "\(atkChar.name) slaps \(defChar.name) with his \(atkChar.weapon.name). Ouch, \(defChar.name) will have a headache. HP: \(defChar.currentHp) -> "
        case is Dwarf:
            output += "\(atkChar.name) smashes \(defChar.name) with his \(atkChar.weapon.name). \(defChar.name) is seriously injured. HP: \(defChar.currentHp) -> "
        case is Rogue:
            output += "\(atkChar.name) stabs \(defChar.name) with his \(atkChar.weapon.name). \(defChar.name) did not see this coming. HP: \(defChar.currentHp) -> "
        default:
            output += "\(defChar.name) was attacked by \(atkChar.name). HP: \(defChar.currentHp) -> "
        }
        
        //Do the action of the turn
        atkChar.attack(target: defChar)
        //Adds new hp to the output
        output += "\(defChar.currentHp)."
        //Turn ends, nb of turns increases
        nbOfTurns += 1
        
        return output
    }
}
