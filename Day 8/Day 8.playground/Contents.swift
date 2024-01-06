func printTimesTables(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 5)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()
characters.removeAll(keepingCapacity: true) //Keeps memory allocated(if we need to re add a lot of items, it won't have to allocate again).
//print(characters.count)



//Error handling

enum PasswordError: Error {
    case short, obvious
}
//That says there are two possible errors with password: short and obvious. It doesn’t define what those mean, only that they exist.
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
//Being marked with throws does not mean the function must throw errors, only that it might.

//do {
//    try someRiskyWork()
//} catch {
//    print("Handle errors here")
//}
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

//There are a few different parts of that code that deserve discussion, but I want to focus on the most important one: try. This must be written before calling all functions that might throw errors, and is a visual signal to developers that regular code execution will be interrupted if an error happens.
//When you use try, you need to be inside a do block, and make sure you have one or more catch blocks able to handle any errors. In some circumstances you can use an alternative written as try! which does not require do and catch, but will crash your code if an error is thrown – you should use this rarely, and only if you’re absolutely sure an error cannot be thrown.

//When it comes to catching errors, you must always have a catch block that is able to handle every kind of error. However, you can also catch specific errors as well, if you want:


do {
    let result = try checkPassword(string) //explicit that only this function can throw errors, not the other lines.
    print("Password rating: \(result)")
} 
catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

//Tip: Most errors thrown by Apple provide a meaningful message that you can present to your user if needed. Swift makes this available using an error value that’s automatically provided inside your catch block, and it’s common to read error.localizedDescription to see exactly what happened.


//Checkpoint 4
enum rootError: Error{
    case outOfBoundError
    case noRoot
}
func root(_ num: Int)throws -> Int{
    if num < 1 || num > 10000 {
        throw rootError.outOfBoundError
    }
    var lo = 1
    var hi = 10000
    while lo <= hi {
        var mid = (lo + hi) / 2
        var sq = mid * mid
        if sq == num{
            return mid
        }
        if sq < num{
            lo = mid + 1
        }else{
            hi = mid - 1
        }
    }
    throw rootError.noRoot
}
//do{
//    print(try root(25))
//    print(try root(1000000))
//    print(try root(0)) // Won't be executed if previous statement caught an error
//    print(try root(3))
//}catch rootError.noRoot{
//    print("No integral root exists")
//}catch rootError.outOfBoundError{
//    print("Out of bound")
//}

do {
    print(try root(0))
} catch let error {
    print(error)
}

do {
    print(try root(1))
} catch let error {
    print(error)
}

do {
    print(try root(4))
} catch let error {
    print(error)
}

do {
    print(try root(6))
} catch let error {
    print(error)
}

do {
    print(try root(10_000))
} catch let error {
    print(error)
}

do {
    print(try root(11_000))
} catch let error {
    print(error)
}
