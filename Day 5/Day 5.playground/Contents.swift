enum Sizes: Comparable {
    case small, medium
    case large
}

let first = Sizes.small
let second = Sizes.medium
let third = Sizes.large
print(first < second)
print(second < third)


enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path…")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}




enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}
//That works, but it has problems:
//
//We keep having to write forecast, even though we’re checking the same thing each time.
//I accidentally checked .rain twice, even though the second check can never be true because the second check is only performed if the first check failed.
//I didn’t check .snow at all, so we’re missing functionality.

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}
//Can't check a case twice and can't leave a case if default is not there. Unlike other languages, Swift only execute the first true condition.



let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}
//If we put a case after default, it will give error, as Swift checks from top to bottom, making lower case useless.


let day = 5
print("My true love gave to me…")

//switch day {
//case 5:
//    print("5 golden rings")
//case 4:
//    print("4 calling birds")
//case 3:
//    print("3 French hens")
//case 2:
//    print("2 turtle doves")
//default:
//    print("A partridge in a pear tree")
//}


switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough //Uncomment to stop here
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


let age = 18
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)

//let hour = 23
//print(hour < 12 ? "It's before noon" : "It's after noon")


//You can see roughly what the problem is with our code to check hours:

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")
//If we wanted to write that out using if and else we’d either need to write this invalid code:
//print(        //INVALID
//    if hour < 12 {
//        "It's before noon"
//    } else {
//        "It's after noon"
//    }
//)


//Or run print() twice, like this:

if hour < 12 {
    print("It's before noon")
} else {
    print("It's after noon")
}
//That second one works fine here, but it becomes almost impossible in SwiftUI

