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

game.players[0] = Player(name: "Kevin")
game.players[1] = Player(name: "Xavier")

game.players[0].team.append(Mage(name: "Gandalf"))
game.players[0].team.append(Dwarf(name: "Gimli"))
game.players[0].team.append(Fighter(name: "Aragorn"))

game.players[1].team.append(Fighter(name: "Nihal"))
game.players[1].team.append(Mage(name: "Sennar"))
game.players[1].team.append(Fighter(name: "Fen"))
