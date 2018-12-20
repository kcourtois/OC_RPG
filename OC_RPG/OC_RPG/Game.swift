//
//  Game.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//This class will hold all the datas of a game.
//Everything that happens in the game will be handled here.
class Game {

    var players = [Player]()

    func play(){
        print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely ! \n\n")
        
        players[0] = Player(name:PlayerSelection.askName(askPhrase: "So, what's your name Player 1 ?", game: self, whoFor: .Player))
        
        print("Now, for an epic battle, you need a great opponent.\n")
        
        players[1] = Player(name: PlayerSelection.askName(askPhrase: "How should I call you, Player 2 ?", game: self, whoFor: .Player))
        
        //Sleep for 1 second to let the player read the text.
        sleep(1)
        
        print("\nAwesome ! Now that you are both here, why don't you take some time to build a team ? \n")
        print("You have to select 3 characters. I will ask you what class you want to pick and what is your character's name. When we're done with you \(players[0].name), it will be \(players[1].name)'s turn. Let's start ! \n")
        
        //Sleep for 3 seconds to let the player read the text.
        sleep(3)
        
        //PLAYER 1 TEAM SELECTION
        players[0].team.append(PlayerSelection.createCharacter(game: self))
        print("\nNow it's time to pick your second character.\n")
        players[0].team.append(PlayerSelection.createCharacter(game: self))
        print("\nLet's go for the last one !\n")
        players[0].team.append(PlayerSelection.createCharacter(game: self))
        
        //PLAYER 2 TEAM SELECTION
        print("\nPerfect, now it's your turn \(players[1].name).\n")
        players[1].team.append(PlayerSelection.createCharacter(game: self))
        print("\nNow it's time to pick your second character.\n")
        players[1].team.append(PlayerSelection.createCharacter(game: self))
        print("\nLet's go for the last one !\n")
        players[1].team.append(PlayerSelection.createCharacter(game: self))
        
        //Sleep for 1 second to let the player read the text.
        sleep(1)

        //RECAP
        print("\nNow it's time for a quick recap. Here's what your team are made of.\n")
        print("\(players[0].name), you have : \n\(players[0].printTeam())\n")
        print("\(players[1].name), you have : \n\(players[1].printTeam())\n")
        
        //Sleep for 1 second to let the player read the text.
        sleep(1)
        
        print("\nOk. Here's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. Hope you guys are ready, cause here comes the battle !\n")
        
        print("We will do a Heads or Tails to know who should start. If it's heads, \(players[0].name) starts. If it's tails, \(players[1].name) will start. Ready ? Here comes the throw... And...\n\n")
        
        //Sleep for 3 seconds to let the player read the text.
        sleep(3)
        
        //Create a fight object. Methods for the fight will be called from here
        let fight = Fight()
        
        //fight.beginNumber will do the heads or tails. It is a random value, 0 is player1 and 1 is player2.
        if(fight.beginNumber == 0){
            print("Heads ! \(players[0].name), you can begin the fight !")
        }
        else {
            print("Tails ! \(players[1].name), you can begin the fight !")
        }
    }
}
