// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print([1, 2, 3, 4, 5].filter({$0 % 2 == 0})) // Filtered
        print([1, 2, 3, 4, 5].map({$0 * $0})) // Squared
        print([1, 2, 3, 4, 5].reduce(0, {$0 + $1})) // Sum
        print([1, 2, 3, 4, 5].map({$0 * $0}).reduce(0, {$0 + $1})) // Squared then summed
    }
}