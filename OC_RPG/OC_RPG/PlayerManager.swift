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
    private var players:[Player]
    //Number of the player that begins the game
    private var beginNumber:Int
    //number that will be increased to get next player
    private var nbNext:Int
    
    init() {
        players = [Player]()
        beginNumber = 0
        nbNext = 0
    }
    
    //playerNumber will be used to get the player index in the players array
    var playerNumber:Int {
        return (beginNumber + nbNext) % players.count
    }
    
    //adds a player in the players array
    func addPlayer(name:String) {
        players.append(Player(name: name))
    }
    
    //returns the number of players in the game
    func getNumberOfPlayers() -> Int {
        return players.count
    }
    
    //returns current player
    func getCurrentPlayer() -> Player {
        return players[playerNumber]
    }
    
    //increase nbNext to select the next player
    func nextPlayer() {
        nbNext += 1
    }
    
    //returns a string formated that containes players names and team compositions
    func recapPlayersTeam() -> String {
        var output:String = ""
        for player in players {
            output += player.name + ", you have : \n" + player.printTeam() + "\n"
        }
        return output
    }
    
    //sets the beginNumber after all players were added
    func pickFirstPlayer() {
        beginNumber = Int.random(in: 0..<players.count)
        nbNext = 0
    }
}
