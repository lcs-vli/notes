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


//https://www.hackingwithswift.com/100/swiftui/9
//Initializers ================================
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username = "twostraws"

//Referring to the current instance  ================================
struct Person1  {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

//Lazy properties   ================================
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
var ed = Person2(name: "Ed")
ed.familyTree

//Static properties and methods ================================
struct Student {
    //You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize)

//Access control ================================
struct Person3 {
    
    //Now only methods inside Person can read the id property
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed2 = Person3(id: "12345")

//summary ================================
//You can create your own types using structures, which can have their own properties and methods.
//You can use stored properties or use computed properties to calculate values on the fly.
//If you want to change a property inside a method, you must mark it as mutating.
//Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
//Use the self constant to refer to the current instance of a struct inside a method.
//The lazy keyword tells Swift to create properties only when they are first used.
//You can share properties and methods across all instances of a struct using the static keyword.
//Access control lets you restrict what code can use properties and methods.
