import Foundation
//
//  Interface.swift
//  SwiftPlayground
//
//  Created by Torin Painter on 22/04/2026.
//

// TODO: Use map filter and reduce on the finding values function because you need to find the one with a sertain id or name, and that would work there
// TODO: Should also make sure that the date that they enter is after the first one, because you can't return the car before you have taken it out

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
            ("vehicle", ""),
            ("customer", ""),
            ("startDate", ""),
            ("endDate", "")
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
            // This is the same as the first but with customers instead of the vehicles
            for customer in customers {
                print("\((customers.firstIndex(where: {$0.name == customer.name}) ?? 0) + 1) -- \(customer.name)")
            }
            
            let pick = readLine() // Get input
            
            if pick?.lowercased() == "q" {return}
            
            if let p: Int = Int(pick ?? "fail") { // Check that it can be an int
                if customers.count >= p && p > 0{
                    clear()
                    
                    vals[1].1 = customers[p - 1].id
                    print("A-maze-ing")
                    valid2 = true
                } else {
                    valid2 = false
                }
            } else {
                valid2 = false
            }
        }
        
        // Now we get the dates that they want the vehicle for
        var valid3 = false
        check: while valid3 == false {
            clear()
            print("Please enter the date that the rental will start in dd/mm/yyyy format")
            
            let raw = readLine()
            
            // The quit at any time
            if raw?.lowercased() == "q" {return}
            
            let check = checkDate(raw: raw, todo: { out in
                vals[2].1 = "\(out[0]) \(out[1]) \(out[2])"
            })
            
            if check {
                // check worked
                if doesThatLookRight(vals: vals){
                    valid3 = true
                }
            } else {
                continue check
            }
        }
        
        // finaly get the end date same as above
        var valid4 = false
        while valid4 == false {
            clear()
            print("Now please enter the end date of the rental in the same format")
            
            let raw = readLine()
            
            // Same quit
            if raw?.lowercased() == "q" {return}
            
            let check = checkDate(raw: raw) { out in
                vals[3].1 = "\(out[0]) \(out[1]) \(out[2])"
            }
            
            if check {
                if doesThatLookRight(vals: vals){
                    valid4 = true
                }
            } else {
                continue
            }
        }
    }
    
    // To check if the date is correct
    func checkDate(raw: String?, todo: (_ out: [Int]) -> Void) -> Bool{
        // 1. Make the raw into a non-optinal
        if let text = raw {
            // 2. Split it by the slashes
            let split = text.split(separator: "/")
            
            // 3. Prepare the out variable
            var out: [Int] = []
            
            // 4. For each section of the now splitted string
            for spl in 0...split.count - 1 {
                // 5. Make sure that it conforms to an int, and if it doesn't then make sure that it will fail the next checks
                let new = Int(split[spl]) ?? 99999
                // 6. Check if the section we are on is the year
                if spl > 1 {
                    // 6.5 Check that its a max of a 4 digit number and not in the past by too far
                    if new > 9999 && new < 1999{
                        return false
                    }
                } else { // 7. if its a day or month
                    // 7.5 check that its a 2 digit number and not below 0 days/months
                    if new > 99 && new < 0{
                        return false
                    }
                }
                // 8. Append the values to the out array
                out.append(new)
            }
            // 9. Check that the ammount of values are 3 because there should be a day, month and a year and nothing more or less
            if out.count == 3 {
                // If everything is right, continue here
                // 10. call the closure and exit
                todo(out)
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    // Ask the user if what they have so far looks right
    func doesThatLookRight(vals: [(String, String)]) -> Bool{
        clear()
        print("Does the current values look correct? y/n")
        for i in 0...(vals.count - 1) {
            print("[\(vals[i].0)]: \(vals[i].1)")
        }
        let response = readLine()
        if response?.lowercased() == "y" {
            return true
        } else {
            return false
        }
    }
    
    // List the rentals in a pleasing to look at way
    @MainActor public func listRentals(){
        clear()
        print("Listing all rentals (press enter to continue)")
        for i in rentals {
            // A better looking print
            print("---------------------------------")
            print("ID: \(i.id)\n")
            print("Customer:\n\(i.customer.name)\n")
            print("Vehicle:\n\(i.vehicle.displayName)\n\(i.vehicle.model)\nFuel = \(i.vehicle.currentFuelLevel)\n")
            print("Start Date:\n\(i.pickupDate)\n")
            print("End Date:\n\(i.returnDate)\n")
        }
        // Wait till they enter anything to continue
        if readLine() != nil{
            return
        }
    }
    
    @MainActor public func cancelRental(){
        clear()
        print("Which rental would you like to remove?")
        for i in rentals {
            // A better looking print same but more compact
            print("---------------------------------")
            print("ID: \(i.id)")
            print("Customer:\n\(i.customer.name)")
            print("Vehicle:\n\(i.vehicle.displayName)")
            print("Start Date:\n\(i.pickupDate)")
            print("End Date:\n\(i.returnDate)")
        }
        print("Please enter the id of the rental that you wish to remove:")
        let raw = readLine()
        // Check if it can be a int, then check if the int matches any of the ids with find value
        if let text = raw {
            let id = Int(text) ?? 0 // Since no id will be 0 this will fail
            
            // TODO: Continue here
        }
    }
    
    @MainActor func findRental(id: Int) -> Rental{
        // Find things in arrays because that would work and be needed for somethings because everything should be id based
        for i in rentals {
            if Int(i.id) == id {return i}
        }
        // TODO: Add return statment that will fail the other things something like the array index
    }
}
