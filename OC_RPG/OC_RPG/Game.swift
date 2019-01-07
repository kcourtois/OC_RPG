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
        print("You have to select your characters. I will ask you what class you want to pick and what is your character's name. Let's start ! \n")
        
        //Player team selection
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\n\n\(playerManager.getCurrentPlayer().name), you can build your team.\n")
            //For loop to create all characters of player's team
            for _ in 0..<playerManager.getCurrentPlayer().maxCharInTeam {
                print("\nNow it's time to pick a new character.\n")
                let charName:String = askName(askPhrase: "How do you want to name him/her ?")
                playerManager.getCurrentPlayer().team.append(createCharacter(name:charName))
            }
            playerManager.nextPlayer()
        }
        
        print("\nHere's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. ")
        
        print("Here's the playing order: ")
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
        print(askPhrase)
        //Get input from the user
        if let userInput = readLine(){
            if let userName = nameManager.nameCheck(name: userInput) {
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
                    return askName(askPhrase: askPhrase)
                }
            }
            else{
                print("\nNope, this name is not available !\n")
                return askName(askPhrase: askPhrase)
            }
        }
        else {
            print("\nHum... I guess i did not hear you well !\n")
            return askName(askPhrase: askPhrase)
        }
    }
    
    //function to ask a user to input yes or no. Returns a boolean.
    private func yesNoInput() -> Bool {
        if let yesNo = readLine(){
            //Confirmation switch
            switch yesNo.lowercased() {
            case "y","yes":
                print("\nAlright !\n")
                return true
            default:
                print("\nOk, let's restart from the beginning.\n")
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
    private func createCharacter(name:String) -> Character {
        print("\n\nWhat class will you pick ?\n")
        print("1 - Fighter: The basic attacker. A good warrior ! 🤺\n")
        print("2 - Mage: His gift ? Heal his fellow partners ! 🧙‍♂️\n")
        print("3 - Colossus: Tough and mighty, but he will not hurt you. 🛡\n")
        print("4 - Dwarf: His axe will hit you hard, but his life bar is as short as his height. 🔪\n")
        //Get input from the user
        if let userInput = readLine(){
            switch userInput {
            case "1":
                return Fighter(name: name)
            case "2":
                return Mage(name: name)
            case "3":
                return Colossus(name: name)
            case "4":
                return Dwarf(name: name)
            default:
                print("\nNope, can't pick that. Try again !")
                return createCharacter(name: name)
            }
        }
        else {
            print("\nNope, can't pick that. Try again !")
            return createCharacter(name: name)
        }
    }
    
    //Get player input to select a character to fight. Requires a player as parameter
    func charSelectionInput(player:Player) -> Character {
        //Get user input
        if let userInput = readLine(){
            if let num = Int(userInput) {
                if let charSelected = player.getCharacter(number: num), charSelected.isAlive {
                    //returns character number picked
                    return charSelected
                }
                else {
                    print("\nNope, can't pick that. Try again !")
                    return charSelectionInput(player:player)
                }
            }
            else {
                print("\nNope, can't pick that. Try again !")
                return charSelectionInput(player:player)
            }
        }
        else {
            print("\nNope, can't pick that. Try again !")
            return charSelectionInput(player:player)
        }
    }
    
    //Generate random int to know if character found a chest. If there is a chest, character will find a random weapon and equip it.
    func lookForChest(char:Character) {
        //25‰ chance to find it
        let chanceToFind:Int = 25
        //pick a random number between 0 and 100
        let randNum:Int = Int.random(in: 0...100)
        //If randNum is in chanceToFind percentage
        if randNum <= chanceToFind {
            let oldAtk:Int = char.weapon.power
            var output:String = "\n\n\(char.name) found a new weapon ! "
            //character can open a chest
            char.openChest(chest: Chest())
            output += "It's a \(char.weapon.name). He equips it... ATK: \(oldAtk) -> \(char.weapon.power)"
            print(output)
        }
    }

    func test() {
        //Adds 2 test players
        playerManager.addPlayer(name: "Kevin")
        playerManager.addPlayer(name: "Xavier")
        
        print("\n\nHere's the playing order: ")
        //loop through the players to get their names
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\(playerManager.getCurrentPlayer().name)")
            playerManager.nextPlayer()
        }
        
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
        //Go back to initial player
        playerManager.nextPlayer()
        

        print("\n\nHope you guys are ready, cause here comes the battle !")
        
        let fight = Fight()
        
        //Battle loop
        while playerManager.getNumberOfPlayersAlive() > 1 {
            print("\n\nTEAM RECAP - \(playerManager.getCurrentPlayer().name.uppercased())'S TURN")
            print(playerManager.recapPlayersTeam())
            print("\n\n\(playerManager.getCurrentPlayer().name), who will fight for this turn (type your character's number) ?")
            
            //Select a character in currentPlayer's team
            let atkChar:Character = charSelectionInput(player: playerManager.getCurrentPlayer())
            
            //See if character found a chest
            lookForChest(char: atkChar)
            
            var defChar:Character
            if atkChar is Mage {
                print("\n\nAnd who do you want to heal (type your character's number) ?")
                defChar = charSelectionInput(player: playerManager.getCurrentPlayer())
            }
            else {
                print("\n\nAnd who will be your target for this turn (type enemy's character's number) ?")
                defChar = charSelectionInput(player: playerManager.getNextPlayer())
            }
            
            //Do the duel between attacker and defender
            print(fight.duel(atkChar: atkChar, defChar: defChar))


            //End of the player's turn, we want the next player.
            playerManager.nextPlayer()
        }
        
        if let winner = playerManager.getFirstPlayerAlive() {
            print("\n\n\(winner.name) is the winner of this game. Congratulations !\n\n")
        }
        else {
            print("\n\nEveryone is dead. In war, there are no winners. But all are losers.\n\n")
        }
    }
}
