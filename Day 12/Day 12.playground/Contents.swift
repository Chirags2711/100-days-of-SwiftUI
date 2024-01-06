// 1. Classes

//The things that classes and structs have in common include:
// 1. You can add properties and methods, including property observers and access control.
// 2. You can create custom initializers to configure new instances however you want.

//Classes differ from structs in five key places:

// 1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
// 2. Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
// 3. When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
// 4. When the final(last copy of that initializer) copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// 5. Even if you make a class constant, you can still change its properties as long as they are variables.

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// 2. Inheritance
class Employee {
    let hours: Int

    init(hours: Int) { //Important to provide initializer
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee{
    func work(){
        print("I am writing code for \(hours) hours")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work(){
        print("I am going to meetings for \(hours) hours")
    }
}

let robert = Developer(hours: 20)
let joseph = Manager(hours: 30)

robert.work()
robert.printSummary()
joseph.work()
joseph.printSummary()


//If a child class wants to change a method from a parent class, you must use override in the child class’s version. This does two things:

//1. If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.(override func fun)
//2. If you use override but your method doesn’t actually override something from the parent class(override func someOtherFun), Swift will refuse to build your code because you probably made a mistake.

//Swift is smart about how method overrides work: if your parent class has a work() method that takes no parameters, but the child class has a work() method that accepts a string to designate where the work is being done, that does not require override because you aren’t replacing the parent method. Code won't build if you use override

//No child class can use a final class as its parent.




// 3. Adding Init

//if a child class has any custom initializers, it must always call the parent’s initializer **after**(not before) it has finished setting up its own properties, if it has any.


class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)


// If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.




// 4. How to Copy Classes?

class User { // Use struct instead of class, then data won't be shared among copies
    var username = "Anonymous"
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

//Creating a deep copy(unique copy)
class User2 {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

let user3 = User2()
let user4 = user3.copy()
user4.username = "New user"

print(user3.username)
print(user4.username)

//Structs are value types, which means they hold simple values such as the number 5 or the string “hello”. It doesn’t matter how many properties or methods your struct has, it’s still considered one simple value like a number. On the other hand, classes are reference types, which means they refer to a value somewhere else.
