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
    //playermanager handles the players
    private let playerManager:PlayerManager = PlayerManager()
    //namemanager handles the names
    private let nameManager:NameManager = NameManager()
    //Stores the number of turns that were played until the end of the battle
    private var nbOfTurns:Int = 0

    func play(){
        
        //Prints introduction messages and adds players
        introPlayers()
        
        //Player team selection
        playersTeamSelection()
        
        //prints to recap rules and playing order
        playingOrder()
        
        //Plays the battle
        battle()
        
        //does the prints for the end of the battle. prints nbofturns and winning or losing messages
        battleOver()
    }
    
    //function to ask a name.
    //askPhrase is a parameter that helps the function to be less
    //repetitive when asking multiple names in a row.
    private func askName() -> String {
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
                    print("\nOk, you can pick an other one.\n")
                    //notify nameManager that name was not picked
                    nameManager.nameNotPicked(name: userName)
                    return askName()
                }
            }
            else{
                print("\nNope, this name is not available !\n")
                return askName()
            }
        }
        else {
            print("\nOk, you can pick an other name.\n")
            return askName()
        }
    }
    
    //function to ask a user to input yes or no. Returns a boolean.
    private func yesNoInput() -> Bool {
        if let yesNo = readLine(){
            //Confirmation switch
            switch yesNo.lowercased() {
            case "y","yes":
                return true
            default:
                return false
            }
        }
        else{
            return false
        }
    }
    
    //Prints introduction messages and adds players
    private func introPlayers() {
        print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely !")
        
        for _ in 0..<playerManager.maxPlayers {
            print("\n\nWhat's your name Player \(playerManager.getNumberOfPlayers()+1) ?")
            playerManager.addPlayer(name: askName())
        }
        
        print("\nAwesome ! Now that you are all here, why don't you take some time to build a team ? \n")
        print("You have to select your characters. I will ask you what class you want to pick and what is your character's name. Let's start ! \n")
    }
    
    //func to do the players team selection
    private func playersTeamSelection() {
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\n\n\(playerManager.getCurrentPlayer().name), you can build your team.\n")
            //For loop to create all characters of player's team
            for _ in 0..<playerManager.getCurrentPlayer().maxCharInTeam {
                print("\nNow it's time to pick a new character.\n")
                print("How do you want to name him/her ?")
                let charName:String = askName()
                playerManager.getCurrentPlayer().team.append(createCharacter(name:charName))
            }
            playerManager.nextPlayer()
        }
    }
    
    //Prints to recap rules and playing order
    private func playingOrder() {
        print("\nHere's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. ")
        
        print("\n\nHere's the playing order: ")
        //loop through the players to get their names
        for _ in 0..<playerManager.getNumberOfPlayers() {
            print("\(playerManager.getCurrentPlayer().name)")
            playerManager.nextPlayer()
        }
        print("\n\nHope you guys are ready, cause here comes the battle !")
    }
    
    //Func for character creation. Ask the user for the class and name of his character and
    //returns a character with this datas.
    private func createCharacter(name:String) -> Character {
        print("\n\nWhat class will you pick ?\n")
        print("1 - Fighter: The basic attacker. A good warrior ! 🤺\n")
        print("2 - Mage: His gift ? Heal his fellow partners ! 🧙‍♂️\n")
        print("3 - Colossus: Tough and mighty, but he will not hurt you. Can paralyze the enemy. 🛡\n")
        print("4 - Dwarf: His axe will hit you hard, but his life bar is as short as his height. 🔪\n")
        print("5 - Rogue: He moves stealthily , and might poison you with his sharp daggers. 🗡\n")
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
            case "5":
                return Rogue(name: name)
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
    private func charSelectionInput(player:Player) -> Character {
        //Get user input
        if let userInput = readLine(){
            if let num = Int(userInput) {
                if let charSelected = player.getCharacter(number: num), charSelected.isAlive {
                    //returns character picked
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
    
    //Plays the battle
    private func battle() {
        while playerManager.getNumberOfPlayersAlive() > 1 && playerManager.getNonMageAlives() > 0 {

            //recap all players team and asks to select a char in player's team
            beginTurn()
            
            //Select a character in currentPlayer's team
            let atkChar:Character = charSelectionInput(player: playerManager.getCurrentPlayer())
            
            //See if character found a chest
            lookForChest(char: atkChar)
            
            //Select target character for the action
            let defChar:Character = askDefChar(atkChar: atkChar)

            //Does the attack and handles status alteration
            handleStatus(atkChar: atkChar, defChar: defChar)
            
            //Update player's characters status
            updateStatus(player: playerManager.getCurrentPlayer())
            
            //End of the player's turn, we want the next player.
            playerManager.nextPlayer()
            
            //Turn ends, nb of turns increases
            nbOfTurns += 1
        }
    }
    
    //recap all players team and asks to select a char in player's team
    private func beginTurn() {
        print("\n\nTEAM RECAP - \(playerManager.getCurrentPlayer().name.uppercased())'S TURN")
        print(playerManager.recapPlayersTeam())
        print("\n\n\(playerManager.getCurrentPlayer().name), who will fight for this turn (type your character's number) ?")
    }
    
    //asks player to pick a target char and returns char picked
    private func askDefChar(atkChar:Character) -> Character {
        var defChar:Character
        if atkChar is Mage {
            print("\n\nAnd who do you want to heal (type your character's number) ?")
            defChar = charSelectionInput(player: playerManager.getCurrentPlayer())
        }
        else {
            print("\n\nAnd who will be your target for this turn (type enemy's character's number) ?")
            defChar = charSelectionInput(player: playerManager.getNextPlayer())
        }
        return defChar
    }
    
    //Does the attack and handles status alteration
    private func handleStatus(atkChar:Character, defChar:Character) {
        switch atkChar.status {
        case .Confused:
            print("\n\(atkChar.name) is confused. He lost his target.")
            //Does the attack
            let atkReport:AttackReport = atkChar.attack(target: getRandomChar())
            print(atkReport.printAttackReport())
        case .Paralyzed:
            //Rand O/1 cause there is 50% chance of hitting target when paralyzed
            let rnd = Int.random(in: 0...1)
            if rnd == 0 {
                print("\n\(atkChar.name) is paralyzed. He couldn't do anything.")
            }
            else {
                //Does the attack
                let atkReport:AttackReport = atkChar.attack(target: defChar)
                print(atkReport.printAttackReport())
            }
        default:
            //Does the attack
            let atkReport:AttackReport = atkChar.attack(target: defChar)
            print(atkReport.printAttackReport())
        }
    }
    
    //Generate random int to know if character found a chest. If there is a chest, character will find a random weapon and equip it.
    private func lookForChest(char:Character) {
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
    
    //Returns a random character in currentPlayer's team or nextPlayer's team
    private func getRandomChar() -> Character {
        if Int.random(in: 0...1) == 0 {
            return playerManager.getCurrentPlayer().getRandomCharacter()
        }
        else {
            return playerManager.getNextPlayer().getRandomCharacter()
        }
    }
    
    //Updates status of the player's characters by removing one turn left in stateTurns
    private func updateStatus(player:Player) {
        for char in player.team {
            char.updateStatus()
        }
    }
    
    //does the prints for the end of the battle. prints nbofturns and winning or losing messages
    private func battleOver() {
        print("\n\nBattle is over. It ended in \(nbOfTurns) turn(s).")
        
        if(playerManager.getNonMageAlives() < 1) {
            print("\n\nOnly Mages were left on the battlefield. All the teams agreed to surrender. No winner in this battle.\n\n")
        }
        else {
            if let winner = playerManager.getFirstPlayerAlive() {
                print("\n\n\(winner.name) is the winner of this game. Congratulations !\n\n")
            }
            else {
                print("\n\nEveryone is dead. In war, there are no winners. But all are losers.\n\n")
            }
        }
    }
}
