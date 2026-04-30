import Foundation
import GRDB

// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Planing
/// Task: Super car rental
/// Information to store:
/// Rentals: Renter, vehicals, total cost, return date
/// Renter: Name, dob, bank card number, bank card scurity code,  bank card expirery date
/// Vehical: Display Name, licence plate number, insurance cost, vehical cost, vehical age, model, engine specifications, current fuel level

let ui: Interface = Interface()
// TODO: Please make a cost for the rental

/// Bogus information made with the use of large language model - gemini
@MainActor var rentals: [Rental] = [
    Rental(
        id: "964",
        customer: Customer(
            id: "123",
            name: "Alex River",
            dob: dateFrom(year: 1992, month: 5, day: 14),
            bankCardNumber: 1234567890123456,
            csc: 123,
            cardExpirery: dateFrom(year: 2027, month: 12, day: 01)
        ),
        vehicle: vehicles[0],
        returnDate: dateFrom(year: 2026, month: 5, day: 10),
        pickupDate: dateFrom(year: 2026, month: 5, day: 01)
    ),
    Rental(
        id: "846",
        customer: Customer(
            id: "575",
            name: "Jordan Smith",
            dob: dateFrom(year: 1985, month: 11, day: 22),
            bankCardNumber: 9876543210987654,
            csc: 456,
            cardExpirery: dateFrom(year: 2028, month: 08, day: 01)
        ),
        vehicle: vehicles[1],
        returnDate: dateFrom(year: 2026, month: 4, day: 30),
        pickupDate: dateFrom(year: 2026, month: 4, day: 25)
    ),
    Rental(
        id: "730",
        customer: Customer(
            id: "464",
            name: "Sam Taylor",
            dob: dateFrom(year: 1998, month: 3, day: 05),
            bankCardNumber: 5544332211009988,
            csc: 789,
            cardExpirery: dateFrom(year: 2026, month: 10, day: 01)
        ),
        vehicle: vehicles[2],
        returnDate: dateFrom(year: 2026, month: 5, day: 15),
        pickupDate: dateFrom(year: 2026, month: 5, day: 12)
    )
]

/// Another thing with bogus information, taken from gemini's list above
@MainActor var vehicles: [Vehicle] = [
    Vehicle(
        id: "374",
        displayName: "Silver Streak",
        disctription: "Luxury sedan with premium leather interior.",
        model: "BMW 5 Series",
        licencePlateNumber: "LUX001",
        insuranceCost: 40.00,
        vehicalCost: 62000.00,
        vehicalAge: 2,
        currentFuelLevel: 65.5
    ),
    Vehicle(
        id: "487",
        displayName: "The Mountain Mover",
        disctription: "A posh but rugged 4x4 with plenty of room for camping gear.",
        model: "Ford F-150",
        licencePlateNumber: "TRK990",
        insuranceCost: 25.00,
        vehicalCost: 55000.00,
        vehicalAge: 3,
        currentFuelLevel: 120.0
    ),
    Vehicle(
        id: "012",
        displayName: "Blue Lightning",
        disctription: "A fuel-efficient compact car perfect for city driving while looking fancy.", // And racist
        model: "Tesla Model 3",
        licencePlateNumber: "B87JKL",
        insuranceCost: 15.50,
        vehicalCost: 45000.00,
        vehicalAge: 4,
        currentFuelLevel: 85.0
    )
]

@main
struct SwiftPlayground {
    static func main() {
        var notdone = true
        while notdone{
            var pick = ui.printWelcome()
            if pick == "a" {
                ui.addVehical()
            } else if pick == "r"{
                ui.removeVehicle()
            }
        }
    }
}

func dateFrom(year: Int, month: Int, day: Int) -> Date {
    let calendar = Calendar.current
    return calendar.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

public struct Vehicle {
    // All of the things needed for renting a car
    public let id: String
    public var displayName: String
    public var disctription: String
    public let model: String
    public let licencePlateNumber: String
    public var insuranceCost: Double
    public let vehicalCost: Double
    public let vehicalAge: Double
    var currentFuelLevel: Double // Leters
    
}

public struct Customer {
    public let id: String
    public let name: String
    public let dob: Date
    public let bankCardNumber: Int
    public let csc: Int
    public let cardExpirery: Date
    
}

public struct Rental {
    public let id: String
    public let customer: Customer
    public let vehicle: Vehicle
    public var returnDate: Date
    public let pickupDate: Date
    
}
