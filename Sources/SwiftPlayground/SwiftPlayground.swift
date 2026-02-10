// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print([1, 2, 5, 1, 3, 2, 4, 5, 2, 1, 1, 1, 5].filter({$0 % 2 == 0})) // Filtered
        print([1, 7, 3, 9].map({$0 * $0})) // Squared
        print([1, 4, 7, 2].reduce(0, {$0 + $1})) // Sum
    }
}