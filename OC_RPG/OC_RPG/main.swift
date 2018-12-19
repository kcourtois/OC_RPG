//
//  main.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

let game:Game = Game()
//game.Start()

game.player1 = Player(name: "Kevin")
game.player2 = Player(name: "Xavier")

game.player1.team.append(Mage(name: "Gandalf"))
game.player1.team.append(Dwarf(name: "Gimli"))
game.player1.team.append(Fighter(name: "Aragorn"))

game.player2.team.append(Fighter(name: "Nihal"))
game.player2.team.append(Mage(name: "Sennar"))
game.player2.team.append(Fighter(name: "Fen"))
