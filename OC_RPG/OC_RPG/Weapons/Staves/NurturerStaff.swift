//
//  Staff.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 24/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//Staves are healing weapon so damage are negative
class NurturerStaff: Weapon {
    init() {
        super.init(name: "Nurturer Staff", power: -22)
    }
}
