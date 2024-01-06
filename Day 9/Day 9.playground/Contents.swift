//Closures
func greetUser() {
    print("Hi there")
}
greetUser()

var greetCopy = greetUser //not greetUser(), that is calling
greetCopy()

//We can also directly assign the functionality to a constant or a variable
let sayHello = { //closure expression
    print("Hello")
}

sayHello()

let sayHello2 = { (name: String) -> String in //in is used to mark the end of the parameters and return type – everything after that is the body of the closure itself
    "Hello \(name)"
}

print(sayHello2("Chirag")) //name not used

let myClosure1 = {(num: Int) in
    
}

myClosure1(2)

//let myClosure2 = { -> String in //Invalid
//    "Hello"
//}
let myClosure2 = {() -> String in
    var s = "Hello"
    return s
}

print(myClosure2())

//Function types
var greetCopy2: () -> Void = greetUser
//the names of the data it receives are not part of the function’s type


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

//or
let data2: (_ id: Int) -> String = getUserData
//Function types cannot have argument labels; use '_' before 'id'


//var cutGrass = { (length currentLength: Double) in //Wrong as Closures cannot use external parameter labels.
//    switch currentLength {
//    case 0...1:
//        print("That's too short")
//    case 1...3:
//        print("It's already the right length")
//    default:
//        print("That's perfect.")
//    }
//}




let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

//Well, sorted() actually allows us to pass in a custom sorting function to control exactly that. This function must accept two strings, and return true if the first string should be sorted before the second, or false if the first string should be sorted after the second.

func captainNameFirst(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    }else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

let captainNameFirstSortedTeam = team.sorted(by: captainNameFirst)
//team.sorted(by: T##(String, String) throws -> Bool)
print(captainNameFirstSortedTeam)


let captainFirstTeam = team.sorted(by: {
    (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    }else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})
//sorted function will pass the two strings to the closure


print(captainFirstTeam)


