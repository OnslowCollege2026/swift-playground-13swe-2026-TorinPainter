//
//  Interface.swift
//  SwiftPlayground
//
//  Created by Torin Painter on 22/04/2026.
//

struct Interface {
    func clear(){
        print("\u{001B}[2J")
    }
    
    /// Returns their pick
    public func printWelcome() -> String{
        /// Must be able to:
        /// Add new cars
        /// Remove old cars
        /// Create a rent
        /// Cancel a rental
        /// Show a list of automaticaly finnished rentals
        /// Change a rental (eg. end date)
        clear()
        print("----------------------------------------------------")
        print("                      Welcome")
        print("----------------------------------------------------")
        print("Please pick an option to do:")
        print("a - Add a new vehicle to fleet")
        print("r - Remove a old/wrecked vehicle")
        print("c - Create a new rental")
        print("x - Cancel a rental")
        print("e - Change a already going or finished rental")
        var pick = readLine()
        
        // This looks great, I know
        if let theirPick = pick {
            if theirPick != ""{
                return theirPick.lowercased()
            } else {
                return "fail"
            }
        } else {
            return "fail"
        }
    }
}
