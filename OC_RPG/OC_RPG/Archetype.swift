//
//  Archetype.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//The list of available classes
enum ClassName {
    case Fighter, Mage, Colossus, Dwarf
}

//Role determines the use of weapon power.
enum Role {
    case Damage, Heal
}

//Archetype is made to hold a class and a role for a character.
class Archetype {
    let archName:ClassName
    let archRole:Role
    
    init(archName:ClassName, archRole:Role) {
        self.archName = archName
        self.archRole = archRole
    }
}
