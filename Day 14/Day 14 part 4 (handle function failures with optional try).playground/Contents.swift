//we can use an optional try to have the function return an optional value. If the function succeeds, its return value will be an optional containing whatever you would normally have received back, and if it fails the return value will be an optional set to nil.

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}else{
    print("Nah")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)




//There are advantages and disadvantages to using optional try, but it mostly centers around how important the error is to you. If you want to run a function and care only that it succeeds or fails – you don’t need to distinguish between the various reasons why it might fail – then using optional try is a great fit, because you can boil the whole thing down to “did it work?”

//So, rather than writing this:

//do {
//    let result = try runRiskyFunction()
//    print(result)
//} catch {
//    // it failed!
//}
//You can instead write this:

//if let result = try? runRiskyFunction() {
//    print(result)
//}
//If that’s what you wanted to do then you could just make runRiskyFunction() return an optional rather than throwing an error, but throwing and using optional try does give us the flexibility to change our mind later. That is, if we write a function that throws errors then at the call site we can either use try/catch or use optional try based on what we need at that point.
