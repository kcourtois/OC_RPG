//
//  main.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

let game:Game = Game()

//print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely ! \n\n")
//
//game.player1 = Player(name:PlayerSelection.askName(askPhrase: "So, what's your name Player 1 ?", game: game, whoFor: .Player))
//
//print("Now, for an epic battle, you need a great opponent.\n")
//
//game.player2 = Player(name: PlayerSelection.askName(askPhrase: "How should I call you, Player 2 ?", game: game, whoFor: .Player))
//
//print("\nAwesome ! Now that you are both here, why don't you take some time to build a team ? \n")
//print("You have to select 3 characters. I will ask you what class you want to pick and what is your character's name. When we're done with you \(game.player1.name), it will be \(game.player2.name)'s turn. Let's start ! \n")
//
////PLAYER 1 TEAM SELECTION
//game.player1.team.append(PlayerSelection.createCharacter(game: game))
//print("\nNow it's time to pick your second character.\n")
//game.player1.team.append(PlayerSelection.createCharacter(game: game))
//print("\nLet's go for the last one !\n")
//game.player1.team.append(PlayerSelection.createCharacter(game: game))
//
////PLAYER 2 TEAM SELECTION
//print("\nPerfect, now it's your turn \(game.player2.name).\n")
//game.player2.team.append(PlayerSelection.createCharacter(game: game))
//print("\nNow it's time to pick your second character.\n")
//game.player2.team.append(PlayerSelection.createCharacter(game: game))
//print("\nLet's go for the last one !\n")
//game.player2.team.append(PlayerSelection.createCharacter(game: game))


game.player1 = Player(name: "Kevin")
game.player2 = Player(name: "Xavier")

game.player1.team.append(Mage(name: "Gandalf"))
game.player1.team.append(Dwarf(name: "Gimli"))
game.player1.team.append(Fighter(name: "Aragorn"))

game.player2.team.append(Fighter(name: "Nihal"))
game.player2.team.append(Mage(name: "Sennar"))
game.player2.team.append(Fighter(name: "Fen"))




print("\nNow it's time for a quick recap. Here's what your team are made of.\n")
print("\(game.player1.name), you have : \n\(game.player1.printTeam())\n")
print("\(game.player2.name), you have : \n\(game.player2.printTeam())\n")

//Sleep for 1 second to let the player read the text.
sleep(1)

print("\nOk. Here's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. Hope you guys are ready, cause here comes the battle !\n")

print("We will do a Heads or Tails to know who should start. If it's heads, \(game.player1.name) starts. If it's tails, \(game.player2.name) will start. Ready ? Here comes the throw... And...\n\n")

//Sleep for 1 second to let the player read the text.
sleep(1)

//Bool.random will do the heads or tails. It returns a random boolean, true represents heads and false represents tails
if(Bool.random()){
    print("Heads ! \(game.player1.name), you can begin the fight !")
}
else {
    print("Tails ! \(game.player2.name), you can begin the fight !")
}
