// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let lunches: [Double] = [6.50, 8.00, 5.75, 9.20, 7.10]
        let budget: Double = 35

        lunches.enumerated().forEach {idx, lunchcost in 
            print("Day \(idx + 1): $\(lunchcost)")
        }
        print(averageCost(prices: lunches))
    }
}

func isOverBudget(total: Double, budget: Double) -> Bool {
    return total > budget
}

func averageCost(prices: [Double]) -> Double {
    var total: Double = 0
    for price in prices {
        total += price
    }

    return total / Double(prices.count + 1)
}