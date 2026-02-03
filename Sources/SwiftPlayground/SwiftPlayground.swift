// The Swift Programming Language
// https://docs.swift.org/swift-book

let lunch = [6.50, 8.00, 5.75, 9.20, 7.10]
let GRAVITY: Float = 0.3
let HEIGHT: Float = 30
let WIDTH: Float = 70
let BOUNCE: Float = 0.7

@main
struct SwiftPlayground {
    static func main() {
        for day in 1...5{
            print("Day \(day): \(lunch[day-1])")
        }
    }
}

class particle{
    // The position of the particle
    var x: Float
    var y: Float

    // The velocity of the particle
    var vx: Float
    var vy: Float

    // Initialise
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
        self.vx = 0
        self.vy = 0
    }

    // Update physics
    func update(){
        self.vy += GRAVITY

        self.x += self.vx
        self.y += self.vy

        if self.y >= HEIGHT - 1{
            self.y = HEIGHT - 1
            self.vy = -self.vy * BOUNCE
        }
        if self.x <= 0 || self.x > WIDTH - 1 {
            self.vx = -self.vx * BOUNCE
        }
    }
}

func render(particles: [particle]) {

    var frame: [[String]] = []
    for _ in 0..<Int(HEIGHT) {
        let row = [String](repeating: " ", count: Int(WIDTH))
        frame.append(row)
    }

    for x in 0...Int(WIDTH){
        frame[Int(HEIGHT) - 1][x] = "_"
    }

    for p in particles{
        if 0 <= Int(p.y) - Int(HEIGHT) && 0 <= Int(p.x) - Int(WIDTH) {
            frame[Int(p.y)][Int(p.x)] = "💀"
        }
    }

    print("\u{001b}c")
}