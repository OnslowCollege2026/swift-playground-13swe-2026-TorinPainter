// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let lunches: [Float] = [6.50, 8.00, 5.75, 9.20, 7.10]

        lunches.enumerated().forEach {idx, lunchcost in 
            print("Day \(idx + 1): $\(lunchcost)")
        }
    }
}

func isOverBudget(total: Double, budget: Double) -> Bool {
    return total > budget
}