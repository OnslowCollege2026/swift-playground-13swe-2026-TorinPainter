// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let GRAVITY: Float = 0.3
        let HEIGHT: Float = 30
        let WIDTH: Float = 70
        let BOUNCE: Float = 0.7
        let particles = [particle(x: 10, y: 10)]

        while true{
            for p in particles {
                p.update(grav: GRAVITY, higt: HEIGHT, wdth: WIDTH, bonc: BOUNCE)
            }
            render(particles: particles, heit: HEIGHT, widt: WIDTH)
        }
    }
}

public class particle{
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
    func update(grav: Float, higt: Float, wdth: Float, bonc: Float){
        self.vy += grav

        self.x += self.vx
        self.y += self.vy

        if self.y >= higt - 1{
            self.y = higt - 1
            self.vy = -self.vy * bonc
        }
        if self.x <= 0 || self.x > wdth - 1 {
            self.vx = -self.vx * bonc
        }
    }
}

public func render(particles: [particle], heit: Float, widt: Float) {

    var frame: [[String]] = []
    for _ in 0..<Int(heit) {
        let row = [String](repeating: "#", count: Int(widt))
        frame.append(row)
    }

    for x in 0..<Int(widt){
        frame[Int(heit) - 1][x] = "_"
    }

    for p in particles{
        if 0 <= Int(p.y) - Int(heit) && 0 <= Int(p.x) - Int(widt) {
            frame[Int(p.y)][Int(p.x)] = "💀"
        }
    }

    print("\u{001b}c")
}