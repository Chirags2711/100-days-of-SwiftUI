import Cocoa

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 10, end: 20)


func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}
func areLettersIdentical2(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted() //Single line
}
func areLettersIdentical3(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted() //SINGLE EXPRESSION
}
print(areLettersIdentical(string1: "jkdklo", string2: "jklokd"))


func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
print(pythagoras(a: 3, b: 4))


//Expression: Code boils down to a single value.




//func greet(name: String) -> String { //Not allowed, not a single expression
//    if name == "Taylor Swift" {
//        "Oh wow!"
//    } else {
//        "Hello, \(name)"
//    }
//}

func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}



//Returning multiple values
//Arrays and dictionaries are not preferred(indexes, and need to provide default value or optional handling).
//Tuples are preferred. They have fixed size.

//func getUser() -> (String, String) {
//    (firstName: "Taylor", lastName: "Swift") //need to have same name(firstName, lastName
//}
//
//let user = getUser()
//print("Name: \(user.0) \(user.1)")


func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift") //need to have same name(firstName, lastName). Like a function call.
    //OR write no names as Swift already know from return type.
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
let (firstName, lastName) = getUser()
let (fn, _) = getUser()
print("Name: \(firstName) \(lastName)")
print(fn)



//This method of naming parameters for external use is so important to Swift that it actually uses the names when it comes to figuring out which method to call. This is quite unlike many other languages, but this is perfect valid in Swift: //External, internal are not relevant

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
print(isUppercase(string))


func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
//Argument label: External names
//Paremeter names: Internal
