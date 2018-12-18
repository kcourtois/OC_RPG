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
    
    enum Status {
        case Started, Ended
    }
    
    var player1:Player = Player(name:"p1")
    var player2:Player = Player(name:"p2")
    let nbOfTurns:Int = 0
    
    var status:Status = .Started
}
