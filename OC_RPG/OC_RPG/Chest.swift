//
//  Chest.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 07/01/2019.
//  Copyright © 2019 Kévin Courtois. All rights reserved.
//

import Foundation

class Chest {

    //func to return a random weapon matching character class
    func loot(char:Character) -> Weapon {
        switch char {
        case is Colossus:
            return randomColossusWeapon()
        case is Fighter:
            return randomFighterWeapon()
        case is Dwarf:
            return randomDwarfWeapon()
        case is Rogue:
            return randomRogueWeapon()
        case is Mage:
            return randomMageWeapon()
        default:
            return DefaultWeapon()
        }
    }
    
    //Returns a random colossus weapon
    private func randomColossusWeapon() -> Weapon {
        let rand = Int.random(in: 0..<4)
        switch rand {
        case 1:
            return CopperMace()
        case 2:
            return SilverMace()
        case 3:
            return GoldenMace()
        default:
            return WoodenMace()
        }
    }
    
    //Returns a random fighter weapon
    private func randomFighterWeapon() -> Weapon {
        let rand = Int.random(in: 0..<4)
        switch rand {
        case 1:
            return CopperSword()
        case 2:
            return SilverSword()
        case 3:
            return GoldenSword()
        default:
            return WoodenSword()
        }
    }
    
    //Returns a random dwarf weapon
    private func randomDwarfWeapon() -> Weapon {
        let rand = Int.random(in: 0..<4)
        switch rand {
        case 1:
            return CopperAxe()
        case 2:
            return SilverAxe()
        case 3:
            return GoldenAxe()
        default:
            return WoodenAxe()
        }
    }
    
    //Returns a random rogue weapon
    private func randomRogueWeapon() -> Weapon {
        let rand = Int.random(in: 0..<4)
        switch rand {
        case 1:
            return CopperDagger()
        case 2:
            return SilverDagger()
        case 3:
            return GoldenDagger()
        default:
            return WoodenDagger()
        }
    }
    
    //Returns a random mage weapon
    private func randomMageWeapon() -> Weapon {
        let rand = Int.random(in: 0..<4)
        switch rand {
        case 1:
            return RainStaff()
        case 2:
            return OwlStaff()
        case 3:
            return NurturerStaff()
        default:
            return WoodenStaff()
        }
    }
}
