//Swift uses structs for storing most of its data types, including String, Int, Double, and Array
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}


let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//struct Employee {
//    let name: String
//    var vacationRemaining: Int
//
//    func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days // 'self' is immutable(error)
//            print("I'm going on vacation!")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There aren't enough days remaining.")
//        }
//    }
//}


//It’s possible to modify the properties of a struct, but only if that struct is created as a variable. Of course, inside your struct there’s no way of telling whether you’ll be working with a variable struct or a constant struct, so Swift has a simple solution: any time a struct’s method tries to change any properties, you must mark it as mutating.
//You don’t need to do anything else other than mark the method as mutating, but doing that gives Swift enough information to stop that method from being used with constant struct instances.
//There are two important details you’ll find useful:
//Marking methods as mutating will stop the method from being called on constant structs, even if the method itself doesn’t actually change any properties. If you say it changes stuff, Swift believes you!
//A method that is not marked as mutating cannot call a mutating function – you must mark them both as mutating.
struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) { //Now our code will build just fine, but Swift will stop us from calling takeVacation() from constant structs.
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}



var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let archer3 = Employee(name: "Sterling Archer", vacationRemaining: 14)
//archer3.takeVacation(days: 5) //Cannot call this
print(archer3.vacationRemaining)


//Swift silently creates a special function inside the struct called init(), using all the properties of the struct as its parameters. It then automatically treats these two pieces of code as being the same:
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)


//We actually relied on this behavior previously. Way back when I introduced Double for the first time, I explained that you can’t add an Int and a Double and instead need to write code like this:

let a = 1
let b = 2.0
let c = Double(a) + b
//Now you can see what’s really happening here: Swift’s own Double type is implemented as a struct, and has an initializer function that accepts an integer.



//Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties. If our struct had these two properties
struct Employee2{
    let name: String
    var vacationRemaining = 14
}

//Then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, making both of these valid:

let kane = Employee2(name: "Lana Kane")
let poovey = Employee2(name: "Pam Poovey", vacationRemaining: 35)
//Tip: If you assign a default value to a constant property, that will be removed from the initializer entirely. To assign a default but leave open the possibility of overriding it when needed, use a variable property.

