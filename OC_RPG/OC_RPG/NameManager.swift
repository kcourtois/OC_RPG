//
//  NameManager.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 20/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class NameManager {
    //Stores all the names during the game
    private var names = [String]()
    
    //Checks if the name given is not taken and is valid
    func isNameValid(name:String) -> String {
        
        //Bool to check all conditions are ok
        var nameValid:Bool
        
        //Format name parameters to match the string array
        let userName = name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).capitalized

        //Check name size
        if checkNameSize(name: userName) {
            nameValid = true
        }
        else {
            nameValid = false
        }
        
        //Check names array to know if someone took it
        for n in names {
            if userName == n {
                nameValid = false
            }
        }
        
        if nameValid {
            return userName
        }
        else {
            return "wrongName"
        }
    }
    
    //Check if name is not too short or too big
    private func checkNameSize(name:String) -> Bool {
        //If name size is in the range from 3 to 30 letters
        if name.count <= 30 && name.count >= 3 {
            //Then size is ok
            return true
        }
        else {
            //Else it's not
            return false
        }
    }
    
    //Register a name by adding it to name array
    func registerName(name:String) {
        names.append(name)
    }
}
