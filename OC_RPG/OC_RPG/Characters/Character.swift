//
//  Character.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

protocol Character {
    var name:String { get }
    var archetype:Archetype { get }
    var life:Int { get }
    var weapon:Weapon { get }
    
    init(name:String)
}
