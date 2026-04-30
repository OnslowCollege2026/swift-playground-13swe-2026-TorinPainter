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
        print("v - View rentals")
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
    
    @MainActor public func addVehical() {
        var current: String = "name"
        var vals = [
            ("name", ""),
            ("dis", ""),
            ("model", ""),
            ("licence", ""),
            ("insurance", ""),
            ("cost", ""),
            ("age", ""),
            ("fuel", "")
        ]
        
        for val in vals{
            var valid = false
            clear()
            // Loop untill they get the right value type
            while valid == false {
                // Set the current editing value
                current = val.0
                
                print("-------------")
                print(" Car creator")
                print("-------------")
                // This will prints a <--- if it is the current one being edited
                //           |---------------^---------------|
                print("Name \(current == "name" ? "<---" : "")\(vals[0].1 != "" ? "= \(vals[0].1)" : "")")
                print("Description \(current == "dis" ? "<---" : "")\(vals[1].1 != "" ? "= \(vals[1].1)" : "")")
                print("Vehical Model \(current == "model" ? "<---" : "")\(vals[2].1 != "" ? "= \(vals[2].1)" : "")")
                print("Plate Number \(current == "licence" ? "<---" : "")\(vals[3].1 != "" ? "= \(vals[3].1)" : "")")
                print("Insurance Cost \(current == "insurance" ? "<---" : "")\(vals[4].1 != "" ? "= \(vals[4].1)" : "")")
                print("Vehical Cost \(current == "cost" ? "<---" : "")\(vals[5].1 != "" ? "= \(vals[5].1)" : "")")
                print("Vehical Age \(current == "age" ? "<---" : "")\(vals[6].1 != "" ? "= \(vals[6].1)" : "")")
                print("Current fuel level \(current == "fuel" ? "<---" : "")\(vals[7].1 != "" ? "= \(vals[7].1)" : "")")
                let inp = readLine()
                if let input = inp {
                    if current == "insurance" || current == "cost" || current == "age" || current == "fuel" {
                        let n = Double(input)
                        if let num: Double = n{
                            clear()
                            valid = true
                            vals[vals.firstIndex(where: {$0 == val}) ?? 0].1 = input
                        } else {
                            clear()
                            print("What you entered for \(current) was incorrect type")
                        }
                    } else {
                        clear()
                        valid = true
                        vals[vals.firstIndex(where: {$0 == val}) ?? 0].1 = input
                    }
                }
            }
        }
        clear()
        print("Thank you for entering your vehicals information\nWe will now work on getting it into the database, have fun!")
        vehicles.append(Vehicle(
            id: String(Int.random(in: 100...999)), // A random number for that vehicle
            displayName: vals[0].1,
            disctription: vals[1].1,
            model: vals[2].1,
            licencePlateNumber: vals[3].1,
            insuranceCost: Double(vals[4].1) ?? 404,
            vehicalCost: Double(vals[5].1) ?? 404,
            vehicalAge: Double(vals[6].1) ?? 404,
            currentFuelLevel: Double(vals[7].1) ?? 404))
    }
    
    @MainActor public func removeVehicle() {
        var valid = false
        // Loop untill they get one that can be removed
        while valid == false{
            // Make sure that the screen is clear
            clear()
            // Return if the list is empty
            if (vehicles.isEmpty) {return}
            
            print("What vehicle do you want to remove:")
            // Display a list of vehicles that they can remove
            for vehicle in vehicles {
                print("\((vehicles.firstIndex(where: {$0.displayName == vehicle.displayName}) ?? 0) + 1) -- \(vehicle.displayName)") // Display it like "2 -- Name"
            }
            let pick = readLine()
            if let p: Int = Int(pick ?? "fail") {
                if vehicles.count >= p && p > 0{ // If its in range
                    clear()
                    print("Removed \(vehicles[p - 1].displayName)")
                    vehicles.remove(at: p - 1)
                    valid = true
                } else {
                    valid = false
                }
            } else {
                valid = false
            }
        }
    }
    
    @MainActor public func createRental(){
        var valid1 = false
        var valid2 = false
        var vals = [
            ("vehicle", "")
        ]
        // This is procidure now
        while valid1 == false{
            clear() // This is infront of everything at this point
            
            // This is going to use different code to the vehicle creator because it is picking from options
            print("Please create your rental (you can enter q at any time to quit)\n")
            print("First lets start with the vehicle that is being rented")
            for vehicle in vehicles{
                // This is the same as before for usability
                print("\((vehicles.firstIndex(where: {$0.displayName == vehicle.displayName}) ?? 0) + 1) -- \(vehicle.displayName)")
            }
            let pick = readLine()
            
            if pick?.lowercased() == "q" {return} // Check if they want to cancel
            
            if let p: Int = Int(pick ?? "fail") {
                if vehicles.count >= p && p > 0{ // If its in range
                    clear()
                    // Do a thing
                    vals[0].1 = vehicles[p - 1].id
                    print("Nice, lets now go on to the customer -->")
                    valid1 = true
                } else {
                    valid1 = false
                }
            } else {
                valid1 = false
            }
        }
        
        while valid2 == false {
            print("Please pick a valid customer")
            // TODO: Continue
        }
    }
}
