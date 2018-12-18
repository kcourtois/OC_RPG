//
//  main.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

let game:Game = Game()

print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely ! \n\n")

game.player1 = Player(name:View.askName(askPhrase: "So, what's your name Player 1 ?", game: game, whoFor: .Player))

print("Now, for an epic battle, you need a great opponent.\n")

game.player2 = Player(name: View.askName(askPhrase: "How should I call you, Player 2 ?", game: game, whoFor: .Player))

print("\nAwesome ! Now that you are both here, why don't you take some time to build a team ? \n")
print("You have to select 3 characters. I will ask you what class you want to pick and what is your character's name. When we're done with you \(game.player1.name), it will be \(game.player2.name)'s turn. Let's start ! \n")

//PLAYER 1 TEAM SELECTION
game.player1.team.append(View.createCharacter(game: game))
print("\nNow it's time to pick your second character.\n")
game.player1.team.append(View.createCharacter(game: game))
print("\nLet's go for the last one !\n")
game.player1.team.append(View.createCharacter(game: game))

//PLAYER 2 TEAM SELECTION
print("\nPerfect, now it's your turn \(game.player2.name).\n")
game.player2.team.append(View.createCharacter(game: game))
print("\nNow it's time to pick your second character.\n")
game.player2.team.append(View.createCharacter(game: game))
print("\nLet's go for the last one !\n")
game.player2.team.append(View.createCharacter(game: game))

