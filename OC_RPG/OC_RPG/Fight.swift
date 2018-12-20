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
    let nbOfTurns:Int
    //Used to know which player begins the battle. Will then be user to know  who plays the next turn.
    let beginNumber:Int
    //playerNumber will always return 0 or 1. It will be used to get the player index in the players array of Game.
    var playerNumber:Int {
        return (beginNumber + nbOfTurns) % 2
    }
    
    init() {
        //Nb of turns begins at 0.
        nbOfTurns = 0
        //beginNumber will contain 0 or 1.
        beginNumber = Int.random(in: 0...1)
    }
    
    //Func that will run the fight between the two players.
    func startBattle(game: Game) {
        
    }
}
