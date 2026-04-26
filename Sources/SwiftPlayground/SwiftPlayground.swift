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

/// Bogus information made with the use of large language model - gemini
@MainActor var rentals: [Rental] = [
    Rental(
        customer: Customer(
            name: "Alex River",
            dob: dateFrom(year: 1992, month: 5, day: 14),
            bankCardNumber: 1234567890123456,
            csc: 123,
            cardExpirery: dateFrom(year: 2027, month: 12, day: 01)
        ),
        vehicle: Vehicle(
            displayName: "Blue Lightning",
            disctription: "A fuel-efficient compact car perfect for city driving.",
            model: "Tesla Model 3",
            licencePlateNumber: "B87-JKL",
            insuranceCost: 15.50,
            vehicalCost: 45000.00,
            vehicalPerchaseDate: dateFrom(year: 2023, month: 1, day: 15),
            currentFuelLevel: 85.0
        ),
        returnDate: dateFrom(year: 2026, month: 5, day: 10),
        pickupDate: dateFrom(year: 2026, month: 5, day: 01)
    ),
    Rental(
        customer: Customer(
            name: "Jordan Smith",
            dob: dateFrom(year: 1985, month: 11, day: 22),
            bankCardNumber: 9876543210987654,
            csc: 456,
            cardExpirery: dateFrom(year: 2028, month: 08, day: 01)
        ),
        vehicle: Vehicle(
            displayName: "The Mountain Mover",
            disctription: "Rugged 4x4 with plenty of room for camping gear.",
            model: "Ford F-150",
            licencePlateNumber: "TRK-990",
            insuranceCost: 25.00,
            vehicalCost: 55000.00,
            vehicalPerchaseDate: dateFrom(year: 2024, month: 6, day: 10),
            currentFuelLevel: 120.0
        ),
        returnDate: dateFrom(year: 2026, month: 4, day: 30),
        pickupDate: dateFrom(year: 2026, month: 4, day: 25)
    ),
    Rental(
        customer: Customer(
            name: "Sam Taylor",
            dob: dateFrom(year: 1998, month: 3, day: 05),
            bankCardNumber: 5544332211009988,
            csc: 789,
            cardExpirery: dateFrom(year: 2026, month: 10, day: 01)
        ),
        vehicle: Vehicle(
            displayName: "Silver Streak",
            disctription: "Luxury sedan with premium leather interior.",
            model: "BMW 5 Series",
            licencePlateNumber: "LUX-001",
            insuranceCost: 40.00,
            vehicalCost: 62000.00,
            vehicalPerchaseDate: dateFrom(year: 2025, month: 2, day: 28),
            currentFuelLevel: 65.5
        ),
        returnDate: dateFrom(year: 2026, month: 5, day: 15),
        pickupDate: dateFrom(year: 2026, month: 5, day: 12)
    )
]

@main
struct SwiftPlayground {
    static func main() {
        var pick = ui.printWelcome()
        if pick == "a" {
            ui.addVehical()
        }
    }
}

func dateFrom(year: Int, month: Int, day: Int) -> Date {
    let calendar = Calendar.current
    return calendar.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

public struct Vehicle {
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

public struct Customer {
    public let name: String
    public let dob: Date
    public let bankCardNumber: Int
    public let csc: Int
    public let cardExpirery: Date
    
}

public struct Rental {
    public let customer: Customer
    public let vehicle: Vehicle
    public var returnDate: Date
    public let pickupDate: Date
    
}
