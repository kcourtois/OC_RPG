//
//  Chest.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 07/01/2019.
//  Copyright © 2019 Kévin Courtois. All rights reserved.
//

import Foundation

class Chest {
    
    let fighterWeapons:[Weapon] = [WoodenStaff(), RainStaff(), OwlStaff(), NurturerStaff()]
    let mageWeapons:[Weapon] = [WoodenSword(), CopperSword(), SilverSword(), GoldenSword()]
    let colossusWeapons:[Weapon] = [WoodenMace(), CopperMace(), SilverMace(), GoldenMace()]
    let dwarfWeapons:[Weapon] = [WoodenAxe(), CopperAxe(), SilverAxe(), GoldenAxe()]
    
    func loot(char:Character) -> Weapon {
        switch char {
        case is Fighter:
            return fighterWeapons[Int.random(in: 0..<fighterWeapons.count)]
        case is Mage:
            return mageWeapons[Int.random(in: 0..<fighterWeapons.count)]
        case is Colossus:
            return colossusWeapons[Int.random(in: 0..<fighterWeapons.count)]
        case is Dwarf:
            return dwarfWeapons[Int.random(in: 0..<fighterWeapons.count)]
        default:
            return Weapon(name: "Wooden Stick", power: 1)
        }
    }
}
