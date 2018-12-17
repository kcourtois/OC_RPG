//
//  Game.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//This class will hold all the datas of a game.

class Game {
    let player1:Player
    let player2:Player
    let nbOfTurns:Int = 0
    
    init(player1:Player, player2:Player) {
        self.player1 = player1
        self.player2 = player2
    }
}
