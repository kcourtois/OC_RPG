//
//  PlayerManager.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 20/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation
//Player manager will hold all the players of the game and will handle the access to them
class PlayerManager {
    
    //Stores the players of the game
    private var players:[Player]
    //Number of the player that begins the game
    private var beginNumber:Int
    //number that will be increased to get next player
    private var nbNext:Int
    //playerNumber will be used to get the player index in the players array
    private var playerNumber:Int {
        return (beginNumber + nbNext) % players.count
    }
    //nextPlayerNumber will be used to get the next player index in the players array
    private var nextPlayerNumber:Int {
        return (beginNumber + nbNext+1) % players.count
    }
    //Bool to know if we picked who plays first
    var firstPlayerPicked:Bool
    
    //Initialization of the vars
    init() {
        firstPlayerPicked = false
        players = [Player]()
        beginNumber = 0
        nbNext = 0
    }
    
    //adds a player in the players array
    func addPlayer(name:String) {
        players.append(Player(name: name))
    }
    
    //returns the number of players in the game
    func getNumberOfPlayers() -> Int {
        return players.count
    }
    
    //Returns number of players alive
    func getNumberOfPlayersAlive() -> Int {
        var nbPlayersAlive:Int = 0
        for player in players {
            if player.isAlive() {
                nbPlayersAlive += 1
            }
        }
        return nbPlayersAlive
    }
    
    //Returns first player found alive, if any
    func getFirstPlayerAlive() -> Player? {
        for player in players {
            if player.isAlive() {
                return player
            }
        }
        return nil
    }
    
    //returns current player
    func getCurrentPlayer() -> Player {
        //If we didn't pick who will play first, we do it now
        if(!firstPlayerPicked){
            pickFirstPlayer()
            firstPlayerPicked = true
        }
        return players[playerNumber]
    }
    
    //returns next player
    func getNextPlayer() -> Player {
        return players[nextPlayerNumber]
    }
    
    //increase nbNext to select the next player
    func nextPlayer() {
        nbNext += 1
    }
    
    //returns a string formated that containes players names and team compositions
    func recapPlayersTeam() -> String {
        var output:String = ""
        for _ in 0..<getNumberOfPlayers() {
            output += getCurrentPlayer().name + "'s team : \n" + getCurrentPlayer().printTeam() + "\n"
            nextPlayer()
        }
        return output
    }
    
    //sets the beginNumber after all players were added
    func pickFirstPlayer() {
        beginNumber = Int.random(in: 0..<players.count)
        nbNext = 0
    }
}
