//
//  NameManager.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 20/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation
//Name Manager handles all the interactions with names during the game.
//It will check if a name is valid and store it so they can be unique
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
        //If name size is in the range from 3 to 30 letters, returns true. else, returns false
        return name.count <= 30 && name.count >= 3
    }
    
    //Releases a name that will not be used
    func nameNotPicked(name:String){
        if let index = names.index(of: name) {
            names.remove(at: index)
        }
    }
}
