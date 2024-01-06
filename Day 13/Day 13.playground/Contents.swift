//Protocols
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
//Inside the protocol we list all the methods we require in order for this protocol to work the way we expect.
//These methods do not contain any code inside – there are no function bodies provided here. Instead, we’re specifying the method names, parameters, and return types. You can also mark methods as being throwing or mutating if needed.


//adopting or conforming to the protocol(implementing that bare minimum functionality, extras are optional):
struct Car: Vehicle {
    func estimateTime(for dist: Int) -> Int { //can have different intetrnal parameter name, but different external parameter names are not allowed.
        dist / 50
    }
    
    func travel(distance: Int) {
        print("I am driving \(distance) km.")
    }
    
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

//All the methods we listed in Vehicle must exist exactly in Car. If they have slightly different names, accept different parameters, have different return types, etc, then Swift will say we haven’t conformed to the protocol.


func commute(distance: Int, using vehicle: Car){
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow")
    }else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)
//But why protocols? This works even if we do not conform to Vehicle protocol.
//Swift knows that any type conforming to Vehicle must implement both the estimateTime() and travel() methods, and so it actually lets us use Vehicle as the type of our parameter rather than Car.

func commuteProtocol(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow")
    }else {
        vehicle.travel(distance: distance)
    }
}
//Now, this function can be called using any data type, as long as it conforms to Vehicle protocol

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commuteProtocol(distance: 50, using: bike)










//As well as methods, you can also write protocols to describe properties that must exist on conforming types. To do this, write var, then a property name, then list whether it should be readable and/or writeable.

protocol Vehicle2 {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

//That adds two properties:

// 1. A string called name, which must be readable. That might mean it’s a constant(can be var as well), but it might also be a computed property with a getter.
// 2. An integer called currentPassengers, which must be read-write. That might mean it’s a variable, but it might also be a computed property with a getter and setter.

//Type annotation is required for both of them, because we can’t provide a default value in a protocol, just like how protocols can’t provide implementations for methods.

struct Car2: Vehicle2 {
    var name = "Car"
    var currentPassengers = 1
    func estimateTime(for dist: Int) -> Int { //can have different intetrnal parameter name, but different external parameter names are not allowed.
        dist / 50
    }
    
    func travel(distance: Int) {
        print("I am driving \(distance) km.")
    }
    
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle2: Vehicle2 {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}
func getTravelEstimates(using vehicles: [Vehicle2], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
let car2 = Car2()
let bike2 = Bicycle2()
getTravelEstimates(using: [car2, bike2], distance: 150)



//If you ever need to subclass something and conform to a protocol, you should put the parent class name first, then write your protocols afterwards.

