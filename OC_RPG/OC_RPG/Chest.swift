//
//  Chest.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 07/01/2019.
//  Copyright © 2019 Kévin Courtois. All rights reserved.
//

import Foundation

class Chest {
    //Array that contains all the weapons available to rogues
    let rogueWeapons:[Weapon] = [WoodenDagger(), CopperDagger(), SilverDagger(), GoldenDagger()]
    //Array that contains all the weapons available to fighters
    let fighterWeapons:[Weapon] = [WoodenSword(), CopperSword(), SilverSword(), GoldenSword()]
    //Array that contains all the weapons available to colossuses
    let colossusWeapons:[Weapon] = [WoodenMace(), CopperMace(), SilverMace(), GoldenMace()]
    //Array that contains all the weapons available to mages
    let mageWeapons:[Weapon] = [WoodenStaff(), RainStaff(), OwlStaff(), NurturerStaff()]
    //Array that contains all the weapons available to dwarves
    let dwarfWeapons:[Weapon] = [WoodenAxe(), CopperAxe(), SilverAxe(), GoldenAxe()]
    
    //func to return a random weapon matching character class
    func loot(char:Character) -> Weapon {
        switch char {
        case is Colossus:
            return colossusWeapons[Int.random(in: 0..<colossusWeapons.count)]
        case is Fighter:
            return fighterWeapons[Int.random(in: 0..<fighterWeapons.count)]
        case is Dwarf:
            return dwarfWeapons[Int.random(in: 0..<dwarfWeapons.count)]
        case is Rogue:
            return rogueWeapons[Int.random(in: 0..<rogueWeapons.count)]
        case is Mage:
            return mageWeapons[Int.random(in: 0..<mageWeapons.count)]
        default:
            return Weapon(name: "Wooden Stick", power: 1)
        }
    }
}
