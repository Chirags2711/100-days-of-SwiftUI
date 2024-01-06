let rangeI = 1...12
for i in rangeI {
    print("The \(i) times table:")

    for j in 1...12 {
        print("  \(j) x \(i) is \(j * i)")
    }

    print()
}

print(type(of: rangeI))
print()

let nums = [1,2,3,4,5]
print(nums[0...3])
let x = nums[2...]
print(type(of: x))

//var speeds = (65, 58, 72)
//for speed in speeds { //Oops – that's not correct. You cannot loop over a tuple like this.
//    print("You were driving at \(speed)km/h.")
//}

print()
// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

let amount = 10 * Double.random(in: 0...1) //Double and Int both have random functionality

//Labelled statements
print()
print()
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]
            print("Attemp: \(attempt)")
            
            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


outerloop: for three in 1...3 {
    print("outer", three)
    innerloop: for five in 1...7{
        if five == 4{
            continue outerloop
        }
        print("inner", five)
    }
}



//Checkpoint 3
for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    }else if i.isMultiple(of: 3) {
        print("Fizz")
    }else if i.isMultiple(of: 5) {
        print("Buzz")
    }else{
        print(i)
    }
}
