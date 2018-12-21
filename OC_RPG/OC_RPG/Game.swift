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

    var players = [Player]()

    func play(){
        print("Hello, Adventurers ! Welcome to OC RPG ! \n OC RPG is a simple battle game were you fight each other to death. Create your own team of heroes and defeat your opponent bravely ! \n\n")
        
        players[0] = Player(name: askName(askPhrase: "So, what's your name Player 1 ?"))
        
        print("Now, for an epic battle, you need a great opponent.\n")
        
        players[1] = Player(name: askName(askPhrase: "How should I call you, Player 2 ?"))
        
        print("\nAwesome ! Now that you are both here, why don't you take some time to build a team ? \n")
        print("You have to select 3 characters. I will ask you what class you want to pick and what is your character's name. When we're done with you \(players[0].name), it will be \(players[1].name)'s turn. Let's start ! \n")
        
        //PLAYER 1 TEAM SELECTION
        players[0].team.append(createCharacter())
        print("\nNow it's time to pick your second character.\n")
        players[0].team.append(createCharacter())
        print("\nLet's go for the last one !\n")
        players[0].team.append(createCharacter())
        
        //PLAYER 2 TEAM SELECTION
        print("\nPerfect, now it's your turn \(players[1].name).\n")
        players[1].team.append(createCharacter())
        print("\nNow it's time to pick your second character.\n")
        players[1].team.append(createCharacter())
        print("\nLet's go for the last one !\n")
        players[1].team.append(createCharacter())
        
        //RECAP
        print("\nNow it's time for a quick recap. Here's what your team are made of.\n")
        print("\(players[0].name), you have : \n\(players[0].printTeam())\n")
        print("\(players[1].name), you have : \n\(players[1].printTeam())\n")
        
        print("\nOk. Here's a quick reminder for the rules. Each of you will use his team to defeat his oppononent. The first player that takes down the whole team of his enemy will be the winner. Hope you guys are ready, cause here comes the battle !\n")
        
        print("We will do a Heads or Tails to know who should start. If it's heads, \(players[0].name) starts. If it's tails, \(players[1].name) will start. Ready ? Here comes the throw... And...\n\n")
        
        //Create a fight object. Methods for the fight will be called from here
        let fight = Fight()
        
        //fight.beginNumber will do the heads or tails. It is a random value, 0 is player1 and 1 is player2.
        if(fight.beginNumber == 0){
            print("Heads ! \(players[0].name), you can begin the fight !")
        }
        else {
            print("Tails ! \(players[1].name), you can begin the fight !")
        }
    }
    
    //function to ask a name.
    //askPhrase is a parameter that helps the function to be less
    //repetitive when asking multiple names in a row.
    func askName(askPhrase:String) -> String {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        while !goOn {
            print(askPhrase)
            //Get input from the user
            if let userInput = readLine(){
                //Check that user doesn't write a name too big
                if(userInput.count <= 30) {
                    if(/*PlayerSelection.isNameAvailable(name: userInput, game: self, whoFor: .whoFor)*/true){
                        //Ask confirmation
                        print("\n\(userInput), that's it ? (y/n)")
                        //If user says yes
                        if yesNoInput() {
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
    
    //function to ask a the user to input yes or no. Returns a boolean.
    func yesNoInput() -> Bool {
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
    func createCharacter() -> Character {
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
}
