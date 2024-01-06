//Opaque return types

func getRandomNumber2() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool2() -> Bool {
    Bool.random()
}

//Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality”. The Equatable protocol is what allows us to use ==, like this:
print(getRandomNumber2() == getRandomNumber2())
//print(getRandomBool() == getRandomNumber()) //Not valid

//func getRandomBool() -> Equatable { //won't work
//    Bool.random()
//}

//What Swift’s error means is that returning Equatable doesn’t make sense, and understanding why it doesn’t make sense is the key to understanding opaque return types.

//First up: yes, you can return protocols from functions

//Now think about sending back an Int or a Bool. Yes, both conform to Equatable, but they aren’t interchangeable – we can’t use == to compare an Int and a Bool, because Swift won’t let us regardless of what protocols they conform to.

//it isn’t possible to compare two different Equatable things


//This is where opaque return types(some) come in: they let us hide information in our code, but not from the Swift compiler. This means we reserve the right to make our code flexible internally so that we can return different things in the future, but Swift always understands the actual data type being returned and will check it appropriately.


func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
func getRandomBool() -> some Equatable {
    Bool.random()
}

//And now we can call getRandomNumber() twice and compare the results using ==. From our perspective we still only have some Equatable data, but Swift knows that behind the scenes they are actually two integers.

//But the advantage here is that Swift always knows the real underlying data type. It’s a subtle distinction, but returning Vehicle means "any sort of Vehicle type but we don't know what", whereas returning some Vehicle means "a specific sort of Vehicle type but we don't want to say which one.”

//So, when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.”
