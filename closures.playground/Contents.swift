import Cocoa

//Accepting parameters in a closure
//To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting.
let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
}
driving1("London")


//Returning values from a closure
//We want a closure that returns a string rather than printing the message directly, so we need to use -> String before in, then use return just like a normal function
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)


//Closures as parameters
let driving = {
    print("I'm driving in my car")
}
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)


//Trailing closure syntax
func travels(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travels() {
    print("I'm driving in my car")
}
print("====")

//Using closures as parameters when they accept parameters

// This is where the travel function is defined
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

// Call site – this is where the "travel" is called

// This is trailing closure syntax
travel { (place: String) in
    print("I'm going to \(place) in my car")
}
print("====")

// Alterate approach – don't use trailing closure syntax
travel(action: { (somewhere: String) in
    print("We went to \(somewhere) on our bicycle.")
})

//======

func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

//===Using closures as parameters when they return values
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
//possibilities
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
travel { place -> String in
    return "I'm going to \(place) in my car"
}
travel { place in
    return "I'm going to \(place) in my car"
}
travel { place in
    "I'm going to \(place) in my car"
}
travel {
    "I'm going to \($0) in my car"
}
//example
func playSong(_ name: String, notes: () -> String) {
    print("I'm going to play \(name).")
    let playedNotes = notes()
    print(playedNotes)
}
playSong("Mary Had a Little Lamb") {
    return "EDCDEEEDDDEGG"
}


//===
//multiple parameters
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel {
    "I'm going to \($0) at \($1) miles per hour."
}


//Returning closures from functions
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result = travel()
result("London")


//Capturing values
func travels() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
        
    }
   
}
result("London")
result("London")
result("London")
