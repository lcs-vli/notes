import Cocoa

//functions intro
func printHelp() {
    let message = """
Welcome to MyApp!
Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    print(message)
}
printHelp()


//Accepting parameters
func square(number: Int) {
    print(number * number)
}
square(number: 8)


//Returning values
func square1(number: Int) -> Int {
    return number * number
}
let result = square1(number: 8)
print(result)


//Parameter labels
func square2(number: Int) -> Int {
    return number * number
}
let result2 = square2(number: 8)


//Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("Taylor")


//Default parameters
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("Taylor")
greet("Taylor", nicely: false)


//Variadic functions
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)


//Writing throwing functions
enum PasswordError1: Error {
    case obvious
}
func checkPassword1(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError1.obvious
    }

    return true
}


//Running throwing functions
do {
    try checkPassword1("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}


//inout parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10
doubleInPlace(number: &myNum)


//Enumerations Example
// Define an enumeration that lists types of password errors
enum PasswordError: Error {
    case obvious
    case needsUppercase
}

// Perform a security check on a given password
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    } else if password == password.lowercased() {
        // If the password was "secret" then it will equal "secret".lowercased()
        // If the password was "sEcREt" then it will not equal "sEcREt".lowercased()
        throw PasswordError.needsUppercase
    }

    return true
}

// Try out a password to see if it is secure
do {
    try checkPassword("password")
    print("That password is good!")
} catch PasswordError.obvious {
    print("You can't use that password because it is too easy to guess.")
} catch PasswordError.needsUppercase {
    print("You can't use that password because it contains no uppercase characters.")
} catch {
    // NOTE: Not a great error message; we try to be specific
    print("You can't use that password.")
}
