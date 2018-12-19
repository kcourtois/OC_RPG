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

    var player1:Player = Player(name:"p1")
    var player2:Player = Player(name:"p2")

    func Play(){
        print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely ! \n\n")
        
        player1 = Player(name:PlayerSelection.askName(askPhrase: "So, what's your name Player 1 ?", game: self, whoFor: .Player))
        
        print("Now, for an epic battle, you need a great opponent.\n")
        
        player2 = Player(name: PlayerSelection.askName(askPhrase: "How should I call you, Player 2 ?", game: self, whoFor: .Player))
        
        print("\nAwesome ! Now that you are both here, why don't you take some time to build a team ? \n")
        print("You have to select 3 characters. I will ask you what class you want to pick and what is your character's name. When we're done with you \(player1.name), it will be \(player2.name)'s turn. Let's start ! \n")
        
        //PLAYER 1 TEAM SELECTION
        player1.team.append(PlayerSelection.createCharacter(game: self))
        print("\nNow it's time to pick your second character.\n")
        player1.team.append(PlayerSelection.createCharacter(game: self))
        print("\nLet's go for the last one !\n")
        player1.team.append(PlayerSelection.createCharacter(game: self))
        
        //PLAYER 2 TEAM SELECTION
        print("\nPerfect, now it's your turn \(player2.name).\n")
        player2.team.append(PlayerSelection.createCharacter(game: self))
        print("\nNow it's time to pick your second character.\n")
        player2.team.append(PlayerSelection.createCharacter(game: self))
        print("\nLet's go for the last one !\n")
        player2.team.append(PlayerSelection.createCharacter(game: self))

        //RECAP
        print("\nNow it's time for a quick recap. Here's what your team are made of.\n")
        print("\(player1.name), you have : \n\(player1.printTeam())\n")
        print("\(player2.name), you have : \n\(player2.printTeam())\n")
        
        //Sleep for 1 second to let the player read the text.
        sleep(1)
        
        print("\nOk. Here's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. Hope you guys are ready, cause here comes the battle !\n")
        
        print("We will do a Heads or Tails to know who should start. If it's heads, \(player1.name) starts. If it's tails, \(player2.name) will start. Ready ? Here comes the throw... And...\n\n")
        
        //Sleep for 1 second to let the player read the text.
        sleep(1)
        
        //Bool.random will do the heads or tails. It returns a random boolean, true represents heads and false represents tails
        if(Bool.random()){
            print("Heads ! \(player1.name), you can begin the fight !")
        }
        else {
            print("Tails ! \(player2.name), you can begin the fight !")
        }
    }
}
