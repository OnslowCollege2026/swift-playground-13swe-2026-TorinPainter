import Foundation
//
//  Interface.swift
//  SwiftPlayground
//
//  Created by Torin Painter on 22/04/2026.
//

struct Interface {
    func clear(){
        print("\u{001B}")
    }
    
    /// A basic menu that has some options when the program is run. Returns their pick
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
        print("q - Quit")
        let pick = readLine()
        
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
    
    public func addVehical() {
        var current: String = "name"
        var vals: Dictionary = [
            "name": "",
            "dis": "",
            "model": "",
            "licence": "",
            "insurance": "",
            "cost": "",
            "age": "",
            "fuel": ""
        ]
        
        print(vals)
        for val in vals{
            // Set the current editing value
            current = val.key
            print(current)
            
            clear()
            print("----------------------------------------------------")
            print("                      Welcome")
            print("----------------------------------------------------")
            // This will prints a <--- if it is the current one being edited
            //           |---------------^---------------|
            print("Name \(current == "name" ? "<---" : "") \(vals[val.key] != "" ? "= \(vals[val.key]!)" : "")")
            print("Description \(current == "dis" ? "<---" : "") \(vals[val.key] != "" ? "= \(vals[val.key]!)" : "")")
            print("Vehical Model \(current == "model" ? "<---" : "") \(vals[val.key] != "" ? "= \(vals[val.key]!)" : "")")
            print("Plate Number \(current == "licence" ? "<---" : "") \(vals[val.key] != "" ? "= \(vals[val.key]!)" : "")")
            print("Insurance Cost \(current == "insurance" ? "<---" : "")")
            print("Vehical Cost \(current == "cost" ? "<---" : "")")
            print("Vehical Age \(current == "age" ? "<---" : "")")
            print("Current fuel level \(current == "fuel" ? "<---" : "")")
            let inp = readLine()
            if let input = inp {
                vals[val.key] = input
            }
        }
    }
}
