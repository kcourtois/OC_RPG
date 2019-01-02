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
    func nameCheck(name:String) -> String? {
        //Format name parameters to match the string array
        let userName = formatName(name: name)

        //Check name size
        if checkNameSize(name: userName) && !names.contains(userName) {
            names.append(userName)
            return userName
        }
        else {
            return nil
        }
    }
    
    //Check if name is not too short or too big
    private func checkNameSize(name:String) -> Bool {
        //If name size is in the range from 3 to 30 letters, returns true. else, returns false
        return formatName(name: name).count <= 30 && formatName(name: name).count >= 3
    }
    
    //Releases a name that will not be used
    func nameNotPicked(name:String){
        if let index = names.index(of: formatName(name: name)) {
            names.remove(at: index)
        }
    }
    
    //Returns the name given in the right format
    func formatName(name:String) -> String {
        return name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).capitalized
    }
}
