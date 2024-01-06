//Reducing the clutter :trailing closures and shorthand syntax

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)


//Function must be of this fn type only: (String, String) -> Bool, else Swift will reject our function
//So, we don't need to specify it because return type, parameters must be of this type only
let captainFirstTeam2 = team.sorted(by: { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})



//Further, when one function accepts another as its parameter Swift allows special syntax called trailing closure syntax
let captainFirstTeam3 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}


//There’s one last way Swift can make closures less cluttered: Swift can automatically provide parameter names for us, using shorthand syntax. With this syntax we don’t even write name1, name2 in any more, and instead rely on specially named values that Swift provides for us: $0 and $1, for the first and second strings respectively.
let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}


//More useful here
let reverseTeam = team.sorted { return $0 > $1 }
print(team)
print(reverseTeam)

//use shorthand syntax unless any of the following are true:
//1. The closure’s code is long.
//2. $0 and friends are used more than once each.
//3. You get three or more parameters (e.g. $2, $3, etc).

//the filter() function lets us run some code on every item in the array, and will send back a new array containing every item that returns true for the function.
let tOnly = team.filter{ $0.hasPrefix("T")} //order kept intact
print(tOnly)


// the map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items.
let countTeam = team.map{ $0.count }
print(countTeam)

let upperCasedTeam = team.map{ $0.uppercased() }
print(upperCasedTeam)
//When working with map(), the type you return doesn’t have to be the same as the type you started with – you could convert an array of integers to an array of strings, for example.


//Like I said, you’re going to be using closures a lot with SwiftUI:
//
//1. When you create a list of data on the screen, SwiftUI will ask you to provide a function that accepts one item from the list and converts it something it can display on-screen.
//2. When you create a button, SwiftUI will ask you to provide one function to execute when the button is pressed, and another to generate the contents of the button – a picture, or some text, and so on.
//3. Even just putting stacking pieces of text vertically is done using a closure.




func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

//We can call that function without a trailing closure like this:
animate(duration: 3, animations: {
    print("Fade out the image")
})


//Trailing closures allow us to clean that up, while also removing the animations parameter label. That same function call becomes this:

animate(duration: 3) {
    print("Fade out the image")
}
