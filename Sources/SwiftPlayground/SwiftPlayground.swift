// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print("Hello world!")
        // I don't print anything here but they do work, also didn't have enough time.
    }
}

struct Vehical {
    var brand: String
    var model: String
    var year: Int

    func info() -> String {
        return "Brand: \(brand), Model: \(model), Year: \(year)"
    }
}

struct Student {
    let ID: Int
    let NSN: Int

    var name: String
    var age: Int
    var email: String
}

struct BankAccount {
    var owner: String
    var balace: Double
    
    var description: String {
        return "\(owner) has \(balace) in their bank account, in their bank account!"
    }
}

struct Rectangle {
    var width: Double
    var hight: Double
    
    // I did this both ways, they work the same
    public func get_area() -> Double {
        return width * hight
    }
    
    // This one is cleaner
    var area: Double {return width * hight}
}

enum Difficulty {
    case easy
    case hard
    case difficult
    case imposible
    case hell
    case evil
}

struct Quest {
    let title: String
    var difficulty: Difficulty
    var reward: Double
    
    public func printBadge(){
        print("\(title) - \(difficulty) level quest - reward: \(reward) XP")
    }
}
