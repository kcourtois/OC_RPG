//
//  View.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class PlayerSelection {
    
    //Enum for askName. We can ask a player's name or a character's name
    enum NameUsage {
        case Player, Character
    }
    
    //Static function to ask a name.
    //askPhrase is a parameter that helps the function to be less
    //repetitive when asking multiple names in a row.
    static func askName(askPhrase:String, game:Game, whoFor:NameUsage) -> String {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        while !goOn {
            print(askPhrase)
            //Get input from the user
            if let userInput = readLine(){
                //Check that user doesn't write a name too big
                if(userInput.count <= 30) {
                    if(PlayerSelection.isNameAvailable(name: userInput, game: game, whoFor: whoFor)){
                        //Ask confirmation
                        print("\n\(userInput), that's it ? (y/n)")
                        //If user says yes
                        if PlayerSelection.YesNoInput() {
                            //return name picked
                            return userInput
                        }
                    }
                    else{
                        print("\nNope, this name is not available !\n")
                        goOn = false
                    }
                }
                else {
                    print("\nYo, you're trying to write a book or what ?\n")
                    goOn = false
                }
            }
            else {
                print("\nHum... I guess i did not hear you well !\n")
                goOn = false
            }
        }
        return "error"
    }
    
    //Static function to ask a the user to input yes or no. Returns a boolean.
    static func YesNoInput() -> Bool {
        if let yesNo = readLine(){
            //Confirmation switch
            switch yesNo.lowercased() {
            case "y","yes":
                print("\nAlright !\n")
                return true
            case "n","no":
                print("\nHum... I guess i did not hear you well !\n")
                return false
            default:
                print("\nHum... I guess i did not hear you well !\n")
                return false
            }
        }
        else{
            print("\nHum... I guess i did not hear you well !\n")
            return false
        }
    }
    
    //Func for character creation. Ask the user for the class and name of his character and
    //returns a character with this datas.
    static func createCharacter(game:Game) -> Character {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        var className:String = ""
        
        while !goOn {
            print("So what will you pick ?\n")
            print("1 - Fighter: The basic attacker. A good warrior ! 🤺\n")
            print("2 - Mage: His gift ? Heal his fellow partners ! 🧙‍♂️\n")
            print("3 - Colossus: Tough and mighty, but he will not hurt you. 🛡\n")
            print("4 - Dwarf: His axe will hit you hard, but his life bar is as short as his height. 🔪\n")
            //Get input from the user
            if let userInput = readLine(){
                switch userInput {
                    case "1":
                        className = "Fighter"
                        print("\n\(className), that's what you want ? (y/n) \n")
                        //Ask confirmation
                        goOn = PlayerSelection.YesNoInput()
                    case "2":
                        className = "Mage"
                        print("\n\(className), that's what you want ? (y/n) \n")
                        //Ask confirmation
                        goOn = PlayerSelection.YesNoInput()
                    case "3":
                        className = "Colossus"
                        print("\n\(className), that's what you want ? (y/n) \n")
                        //Ask confirmation
                        goOn = PlayerSelection.YesNoInput()
                    case "4":
                        className = "Dwarf"
                        print("\n\(className), that's what you want ? (y/n) \n")
                        //Ask confirmation
                        goOn = PlayerSelection.YesNoInput()
                    default:
                        print("\nNope, can't pick that. Try again ! \n")
                        goOn = false
                }
            }
            else {
                print("\nNope, can't pick that. Try again ! \n")
                goOn = false
            }
        }
        
        //Ask character's name
        let charName:String = PlayerSelection.askName(askPhrase: "What will be your character's name ?", game: game, whoFor: .Character)
        
        //Return the right character
        switch className {
            case "Fighter":
                return Fighter(name: charName)
            case "Mage":
                return Mage(name: charName)
            case "Colossus":
                return Colossus(name: charName)
            case "Dwarf":
                return Dwarf(name: charName)
            default:
                return Fighter(name: charName)
        }
        
    }
    

    //Test if the name given in param is used by a character in the game.
    static func isNameAvailable(name:String, game:Game, whoFor:NameUsage) -> Bool{
        if(whoFor == .Character){
            //Runs through player1 team
            for char in game.player1.team {
                //If the name is taken by a character, return false (not available)
                if (char.name.lowercased() == name.lowercased()) {
                    return false
                }
            }
            //Runs through player2 team
            for char in game.player2.team {
                //If the name is taken by a character, return false (not available)
                if char.name.lowercased() == name.lowercased() {
                    return false
                }
            }
            //If the name wasn't found in any team, return true
            return true
        }
        else {
            //If the name is taken by a player, return false (not available)
            if (game.player1.name.lowercased() == name.lowercased() || game.player2.name.lowercased() == name.lowercased()) {
                return false
            }
            //If the name wasn't found in any team, return true
            return true
        }
    }
}
