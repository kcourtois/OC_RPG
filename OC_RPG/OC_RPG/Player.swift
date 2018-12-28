//
//  Player.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Player {
    //Player's name
    let name:String
    //Team will be the 3 characters created by the player.
    var team:[Character]
    var maxCharInTeam:Int
    
    init(name:String) {
        self.name = name
        self.team = []
        self.maxCharInTeam = 3
    }
    
    //Returns a formated string with all the characters of the team, with their class and name.
    func printTeam() -> String {
        var output:String = ""
        var num:Int = 1
        for char in team {
            output += "\(num). \(char.name), \(char.className). Atk: \(char.weapon.power) HP: \(char.currentHp)/\(char.maxHp)\n"
            num += 1
        }
        return output
    }
    
    //Returns true if there is at least one character alive in the player's team
    func isAlive() -> Bool {
        var nbCharAlive:Int = 0
        for char in team {
            if char.isAlive {
                nbCharAlive += 1
            }
        }
        //If there is a character alive in the team, return true
        if nbCharAlive > 0 {
            return true
        }
        //Else return false
        else {
            return false
        }
    }
}
