//
//  View.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class View {
    //Static function to ask a player name.
    //askPhrase is a parameter that helps the function to be less
    //repetitive when asking multiple players name in a row.
    static func askPlayerName(askPhrase:String) -> String {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        while !goOn {
            print(askPhrase)
            if let userInput = readLine(){
                print("\n\(userInput), you said ? (y/n)")
                if let yesNo = readLine(){
                    //Confirmation switch
                    switch yesNo {
                    case "y","yes":
                        print("\nAlright !\n")
                        goOn = true
                        return userInput
                    case "n","no":
                        print("\nHum... I guess i did not hear you well !\n")
                        goOn = false
                    default:
                        print("\nHum... I guess i did not hear you well !\n")
                        goOn = false
                        break
                    }
                }
                else{
                    print("\nHum... I guess i did not hear you well !\n")
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
}
