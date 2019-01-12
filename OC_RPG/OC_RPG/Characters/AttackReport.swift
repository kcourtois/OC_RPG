//
//  AttackReport.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 11/01/2019.
//  Copyright © 2019 Kévin Courtois. All rights reserved.
//

import Foundation

//Attackreports is an object that contains all the parameters of an attack of a character.
//It will be returned by attack func, and can be printed with printAttackReport.
class AttackReport {
    private let target:Character
    private let attacker:Character
    private let actionDesc:String
    private let commentary:String
    private let previousHp:Int
    
    init(target:Character, attacker:Character, actionDesc:String, commentary:String, previousHp:Int){
        self.target = target
        self.attacker = attacker
        self.actionDesc = actionDesc
        self.commentary = commentary
        self.previousHp = previousHp
    }
    //Func to return a report of an attack in string format
    func printAttackReport() -> String {
        return "\(target.name) \(actionDesc) \(attacker.name) with his \(attacker.weapon.name). \(target.name) \(commentary) HP: \(previousHp) -> \(target.currentHp)"
    }
}
