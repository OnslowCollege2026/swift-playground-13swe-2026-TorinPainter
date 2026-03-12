import Foundation
import GRDB

// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let path = "/Users/wolf/Documents/CODE/swift/swift-playground-13swe-2026-TorinPainter/Sources/SwiftPlayground/cafe.db"
        do {
            let queue = try DatabaseQueue(path: path)
            try queue.read { database in
                try database.dumpSchema()
            }
        } catch {
            print(error)
        }
    }
}

/// Example
struct Movie: Identifiable, Codable, FetchableRecord, PersistableRecord {
    var id: Int
    var title: String
    var releaseYear: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "MovieID"
        case title = "Title"
        case releaseYear = "ReleaseYear"
    }
}

struct Item: Identifiable, Codable, FetchableRecord, PersistableRecord {
    var id: Int
    var name: String
    var Price: Double
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case Price
    }
}

/// Do this later
struct Order: Identifiable, Codable, FetchableRecord, PersistableRecord {
    var id: Int
    
}

/// Perchaser
struct Perchaser: Identifiable, Codable, FetchableRecord, PersistableRecord {
    var id: Int
    var name: String
    var count: Int
    var reservedTable: String
    
    enum CodingKeys: String, CodingKey {
        case id = "PercheserId"
        case name = "Name"
        case count = "Count"
        case reservedTable = "ReservedTable"
    }
}
