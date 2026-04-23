import Foundation
import GRDB

// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Planing
/// Task: Super car rental
/// Information to store:
/// Renter: Name, dob, bank card number, bank card scurity code,  bank card expirery date
/// Vehical: Display Name, licence plate number, insurance cost, vehical cost, vehical age, model, engine specifications, current fuel level

let ui: Interface = Interface()

@main
struct SwiftPlayground {
    static func main() {
        var rentals: [Rental] = []
        var pick = ui.printWelcome()
        if pick == "a" {
            ui.addVehical()
        }
    }
}

struct Vehical {
    // All of the things needed for renting a car
    public var displayName: String
    public var disctription: String
    public let model: String
    public let licencePlateNumber: String
    public var insuranceCost: Double
    public let vehicalCost: Double
    public let vehicalPerchaseDate: Date
    var currentFuelLevel: Double // Leters
    
}

struct Customer {
    public let name: String
    public let dob: Date
    private let bankCardNumber: Int
    private let csc: Int
    private let cardExpirery: Data
    
}

struct Rental {
    public let customer: Customer
    public let vehicle: Vehical
    public var returnDate: Date
    public let pickupDate: Date
    
}
