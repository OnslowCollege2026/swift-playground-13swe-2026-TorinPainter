// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        let code_letter = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
        let code_number = [789235,8345,87235,34587,89456,9837,9238,938475,64926,86600,483,25,7,678,34,456,4567,13456,6,34567,7876,1000,1235,1564,1356,2344, 999999]
        let ferrari: Vehical = Vehical(brand: "Ferrari", model: "308", year: 1978)
        let porsche: Vehical = Vehical(brand: "Porsche", model: "Tycan", year: 2020)

        print(ferrari.info())
        print(porsche.info())
        let code = encode(string: "You see this is interesting because it does not put spaces in the decoded part and you cant do any punctuation or that will break it stop you have to write this like a fax where you cant use any full stops stop", code_letter: code_letter, code_number: code_number)
        print("Code: \(code)")
        print("Decoded: \(decode(code: code, code_letter: code_letter, code_number: code_number))")
        
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

func encode(string: String, code_letter: [String], code_number: [Int]) -> [Int] {
    var fin: [Int] = []
    for letter in string.lowercased().split(separator: ""){
        if let i: Int = code_letter.firstIndex(of: String(letter)){
            fin.append(code_number[i] * 3)
        }
    }
    return fin
}

func decode(code: [Int], code_letter: [String], code_number: [Int]) -> String {
    var fin: String = ""
    for num in code {
        if let i: Int = code_number.firstIndex(of: Int(num / 3)) {
            fin += code_letter[i]
        }
    }
    return fin
}