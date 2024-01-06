// How to accept functions as parameters

func makeArrays(size: Int, using generator: ()->Int ) -> [Int]{
    var numbers = /*[Int]()*/ Array<Int>() //Both correct
    
    for _ in 0 ..< size{
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArrays(size: 50 )/*, using: */{
    /*()-> Int in*/
    Int.random(in: 1...20)
}/*)*/

print(rolls)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork { //first: cannot come here, Others must come
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

//the first trailing closure is identical to what we’ve used already, but the second and third are formatted differently: you end the brace from the previous closure, then write the external parameter name and a colon, then start another brace.





let driveSafely = { //can avoid writing return type here
    return "I'm being a considerate driver"
}
print(driveSafely())

//
//func fun(){
//    return "I'm being a considerate driver" //cannot be done here
//}
