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
