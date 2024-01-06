//Optionals
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

//let peachOpposite:String = opposites["Peach"] //error, it returns String? rather than String
let peachOpposite/*:String?*/ = opposites["Peach"] //Type inference, of type String?
print(peachOpposite)

//IF-LET
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
if let pO = peachOpposite { //Nothing happens if value does not exist
    print("Mario's opposite is \(pO)")
}else {
    print("No value found")
}

//Combines creating a condition (if) with creating a constant (let). Together, it does three things:
//
//It reads the optional value from the dictionary.
//If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
//The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run.
//We can add else block as well

var number: Int? = 2
if let number = number { //Can give same name
    print(number*number)
}
//What’s happening here is that we’re temporarily creating a second constant of the same name, available only inside the condition’s body. This is called shadowing, and it’s mainly used with optional unwraps like you can see above.
//So, inside the condition’s body we have an unwrapped value to work with – a real Int rather than an optional Int? – but outside we still have the optional.

if let number { //Can do like this as well
    print(number*number)
}
//It does exactly the same thing – it creates a shadowed copy of number that is unwrapped only inside that condition’s body, just with a bit less repetition.

//Cannot use if let with non optionals



//GUARD LET
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}
var num: Int? = nil
printSquare(of: num)
printSquare(of: 2)

var myVar: Int? = nil

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

func funUnwrap(){
    guard let unwrapped = myVar else {
        print("Run if myVar doesn't have a value inside")
        return
    }
}
funUnwrap()
//This is sometimes called an early return: we check that all a function’s inputs are valid right as the function starts, and if any aren’t valid we get to run some code then exit straight away. If all our checks pass, our function can run exactly as intended.



//Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use
func myFun(){
    let arr: [Int] = []
    guard arr.isEmpty else { return }
    print("Khali hai")
}
myFun()
