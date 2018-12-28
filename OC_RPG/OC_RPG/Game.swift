//
//  Game.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

//This class will hold all the datas of a game.
//Everything that happens in the game will be handled here.
class Game {
    
    private let playerManager:PlayerManager = PlayerManager()
    private let nameManager:NameManager = NameManager()
    //Sets the number of players in the game
    private let maxPlayers:Int = 2

    func play(){
        print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely ! \n\n")
        
        for _ in 0..<maxPlayers {
            playerManager.addPlayer(name: askName(askPhrase: "What's your name Player \(playerManager.getNumberOfPlayers()+1) ?"))
        }
        
        print("\nAwesome ! Now that you are all here, why don't you take some time to build a team ? \n")
        print("You have to select 3 characters. I will ask you what class you want to pick and what is your character's name. Let's start ! \n")
        
        //Player team selection
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\(playerManager.getCurrentPlayer().name), you can build your team.\n")
            //For loop to create all characters of player's team
            for _ in 0..<playerManager.getCurrentPlayer().maxCharInTeam {
                playerManager.getCurrentPlayer().team.append(createCharacter())
            }
            playerManager.nextPlayer()
        }
        
        print("\nHere's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. ")
        
        print("Here's the playing order: ")
        //picks a random player that will start
        playerManager.pickFirstPlayer()
        //loop through the players to get their names
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\(playerManager.getCurrentPlayer().name)")
            playerManager.nextPlayer()
        }
        print("Hope you guys are ready, cause here comes the battle !\n\n")
    }
    
    //function to ask a name.
    //askPhrase is a parameter that helps the function to be less
    //repetitive when asking multiple names in a row.
    private func askName(askPhrase:String) -> String {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        while !goOn {
            print(askPhrase)
            //Get input from the user
            if let userInput = readLine(){
                let userName = nameManager.isNameValid(name: userInput)
                if(userName != "wrongName"){
                    //Ask confirmation
                    print("\n\(userName), that's it ? (y/n)")
                    //If user says yes
                    if yesNoInput() {
                        //name is picked
                        return userName
                    }
                    else {
                        //notify nameManager that name was not picked
                        nameManager.nameNotPicked(name: userName)
                        goOn = false
                    }
                }
                else{
                    print("\nNope, this name is not available !\n")
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
    
    //function to ask a user to input yes or no. Returns a boolean.
    private func yesNoInput() -> Bool {
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
    private func createCharacter() -> Character {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        var className:String = ""
        
        while !goOn {
            print("\nNow it's time to pick a new character.\n")
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
                    goOn = yesNoInput()
                case "2":
                    className = "Mage"
                    print("\n\(className), that's what you want ? (y/n) \n")
                    //Ask confirmation
                    goOn = yesNoInput()
                case "3":
                    className = "Colossus"
                    print("\n\(className), that's what you want ? (y/n) \n")
                    //Ask confirmation
                    goOn = yesNoInput()
                case "4":
                    className = "Dwarf"
                    print("\n\(className), that's what you want ? (y/n) \n")
                    //Ask confirmation
                    goOn = yesNoInput()
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
        let charName:String = askName(askPhrase: "What will be your character's name ?")
        
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
    
    func test() {
        //Adds 2 test players
        playerManager.addPlayer(name: "Kevin")
        playerManager.addPlayer(name: "Xavier")
        //Create p1 team
        playerManager.getCurrentPlayer().team.append(Fighter(name: "Aragorn"))
        playerManager.getCurrentPlayer().team.append(Mage(name: "Gandalf"))
        playerManager.getCurrentPlayer().team.append(Dwarf(name: "Gimli"))
        //Pick next player
        playerManager.nextPlayer()
        //Create p2 team
        playerManager.getCurrentPlayer().team.append(Fighter(name: "Snow"))
        playerManager.getCurrentPlayer().team.append(Mage(name: "Marwyn"))
        playerManager.getCurrentPlayer().team.append(Colossus(name: "Hodor"))
        
        print("Here's the playing order: ")
        //picks a random player that will start
        playerManager.pickFirstPlayer()
        //loop through the players to get their names
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\(playerManager.getCurrentPlayer().name)")
            playerManager.nextPlayer()
        }
        print("Hope you guys are ready, cause here comes the battle !\n\n")
        
        //Battle loop
        while playerManager.getNumberOfPlayersAlive() > 1 {
            print("TEAM RECAP - \(playerManager.getCurrentPlayer().name.uppercased())'S TURN")
            print(playerManager.recapPlayersTeam())
            print("\(playerManager.getCurrentPlayer().name), who will fight for this turn (1 / 2 / 3) ?")
            var goOn:Bool = false
            while !goOn {
                //Get user input
                if let userInput = readLine(){
                    switch userInput {
                    case "1":
                        break
                    case "2":
                        break
                    case "3":
                        break
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
        }
    }
}
