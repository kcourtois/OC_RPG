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
    //Team will be the characters created by the player.
    var team:[Character]
    //Defines how many characters the player can create
    var maxCharInTeam:Int
    
    init(name:String) {
        self.name = name
        self.team = []
        self.maxCharInTeam = 3
    }
    
    //Returns a formated string with all the characters of the team, with their class and name.
    func printTeam() -> String {
        var output:String = ""
        for (index, char) in team.enumerated() {
            if char.isAlive {
                output += "\(index+1). \(char.printChar())\n"
            }
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
        //If there is a character alive in the team, returns true
        return nbCharAlive > 0
    }
    
    //Returns the character that matches the number given, if exists
    func getCharacter(number:Int) -> Character? {
        if number-1 >= 0 && number-1 < team.count {
            return team[number-1]
        }
        else {
            return nil
        }
    }
    
    //Returns a random character alive in the team
    func getRandomCharacter() -> Character {
        if let char = getCharacter(number: Int.random(in: 0..<team.count)) {
            if char.isAlive {
                return char
            }
            else {
                return getRandomCharacter()
            }
        }
        else {
            return getRandomCharacter()
        }
    }
}
