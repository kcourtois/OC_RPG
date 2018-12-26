//
//  PlayerManager.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 20/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class PlayerManager {
    
    //Stores the players of the game
    private var players = [Player]()
    
    //func to add players in the players array
    func addPlayer(name:String) {
        players.append(Player(name: name))
    }
    
    //func to access player1 data
    func getPlayer1() -> Player {
        return players[0]
    }
    
    //func to access player2 data
    func getPlayer2() -> Player {
        return players[1]
    }
}
