// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        // Task A
        let mixed = ["cat", "7", "owl", "15", "dog", "3"]
        print("Task A: \(mixed.compactMap({Int($0)}))")

        // Task B
        let archive = [
            [
                [["candle", "dust"], ["mirror", "ash"]],
                [["whisper", "shadow"], ["clock", "veil"]]
            ],
            [
                [["stone", "key"], ["relic", "name"]],
                [["cipher", "bone"], ["ember", "seal"]]
            ]
        ]
        //let first = archive.last?.first
        //let last = archive.last?.last
        //print("Task B: \(first): \(last)")

        // Task C
        let sightings = [
            (name: "moth", score: 3),
            (name: "wolf", score: 9),
            (name: "raven", score: 4),
            (name: "mist", score: 7),
            (name: "wisp", score: 2)
        ]
        let fin = sightings.filter {$0.name.split(separator: "")[0] == "w" || $0.name.split(separator: "")[0] == "m"}.map({$0.score}).reduce(0, {$0 + $1})
        print("Task C: \(fin)")

        // Task D
        print("Task D: \(accept("moonlight", isValid: {$0.count >= 8}))")
    }
}

// Task D
func accept(_ input: String, isValid: (String) -> Bool) -> Bool{
    return isValid(input)
}