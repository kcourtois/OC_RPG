//
//  Player.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Player {
    let name:String
    //Team will be the 3 characters created by the player.
    var team:[Character]
    init(name:String) {
        self.name = name
        self.team = []
    }
    
    //func buildPlayerTeam() -> [Character] {
    //    return [Character(name:"dummy", archetype: Archetype(archName:ClassName.Fighter, archRole:Role.Damage), life: 10, weapon: Weapon(name: "test", power: 1))]
    //}
}
