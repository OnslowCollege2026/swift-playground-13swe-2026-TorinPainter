import Foundation

// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let book1 = Book(title: "Johns large elephant", author: "John", pages: 2)
        let update = Update()
        
        print(book1.summary() + " -------- Thickness: \(book1.get_thickness()) ---- Weight: \(book1.get_weight())")
    }
}

class Update {
    var lastUpdateTime: TimeInterval = 0
    let updateInterval: TimeInterval = 1.0 / 60.0
    var timer: Timer?

    func start() {
        // Initialize the time so the first delta isn't huge
        lastUpdateTime = Date().timeIntervalSince1970
        
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            let currentTime = Date().timeIntervalSince1970
            let delta = currentTime - self.lastUpdateTime
            self.lastUpdateTime = currentTime
            
            self.update(delta: delta)
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }

    func update(delta: TimeInterval) {
        // Your logic here
        print("Update: delta \(delta)")
    }
}

struct Book {
    var title: String
    var author: String
    var pages: Int
    
    func summary() -> String {
        return "\(title) - by \(author), total pages: \(pages)"
    }
    
    // Something fun in mm
    func get_thickness() -> String {
        var thickness_mm = 0.1 * Double(pages)
        var unit: String = "mm"
        if thickness_mm >= 10 {
            thickness_mm /= 10
            unit = "cm"
            if thickness_mm >= 100 {
                thickness_mm /= 100
                unit = "m"
                if thickness_mm >= 1000 {
                    thickness_mm /= 1000
                    unit = "km"
                }
            }
        }
        return "\(thickness_mm) \(unit)"
    }
    
    func get_weight() -> String {
        var weight = 4.5 * Double(pages)
        var unit: String = "grams"
        if weight >= 1000 {
            weight /= 1000
            unit = "kilo grams"
            if weight >= 1000 {
                weight /= 1000
                unit = "tonnes"
                if weight >= 1000 {
                    weight /= 1000
                    unit = "kilotonnes"
                    if weight >= 1000 {
                        weight /= 1000
                        unit = "megatonnes"
                        if weight >= 1000 {
                            weight /= 1000
                            unit = "gigatonnes"
                        }
                    }
                }
            }
        }
        return "\(weight) \(unit)"
    }
}

struct StopWatch {
    var seconds: Double
    var isRunning: Bool
    
    mutating func start() {
        isRunning = true
    }
    
    mutating func tick () {
        if isRunning == true {
            seconds += 1
        }
    }
    
    mutating func reset() {
        isRunning = false
        seconds = 0
    }
}
