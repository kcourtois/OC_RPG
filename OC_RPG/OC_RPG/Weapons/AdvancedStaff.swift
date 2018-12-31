//
//  Staff.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 24/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//Staff are healing weapon so damage are negative
class AdvancedStaff: Weapon {
    init() {
        super.init(name: "Advanced Staff", minPower: -20, maxPower: -10)
    }
}
