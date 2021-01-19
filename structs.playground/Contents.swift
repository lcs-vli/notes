import Cocoa

//Creating your own structs ================================
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"

//Computed properties ================================
struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//Property observers ================================
//struct Progress {
//    var task: String
//    var amount: Int
//}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

struct Progress {
    var task: String
    var amount: Int {
        //didSet will run some code every time "amount" changes:
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

//Methods  ================================
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

//Mutating methods  ================================
struct Person {
    var name: String
    
    //When you want to change a property inside a method, you need to mark it using the mutating keyword
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
print(person.name)

//Properties and methods of strings  ================================
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

//Properties and methods of arrays ================================
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
