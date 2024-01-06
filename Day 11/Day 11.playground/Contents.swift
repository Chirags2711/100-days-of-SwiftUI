//Access control
struct BankAccount {
    private var funds: Int = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()//BankAccount' initializer is inaccessible due to 'private' protection level,(Missing argument for parameter 'funds' in call), if funds is not init to 0 already
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
//account.funds = 0 //'funds' is inaccessible due to 'private' protection level


// 1. Use private for “don’t let anything outside the struct use this.”
//      If you use private access control for one or more properties, chances are you’ll need to create your own initializer.
// 2. Use fileprivate for “don’t let anything outside the current file use this.”
// 3. Use public for “let anyone, anywhere use this.”
// 4. private(set). This means “let anyone read this property, but only let my methods write it.” If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.


//Static properties and methods
struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
    func printCount(){
        print(Self.studentCount) //Self or School necessary. (not self)
    }
}
School.add(student: "Taylor Swift")
print(School.studentCount)
//we’re able to modify the studentCount property without marking the method as mutating – that’s only needed with regular struct functions for times when an instance of struct was created as a constant, and there is no instance when static method.
//Static member cannot be used on instance

//Mixing of static and non static:
// 1. static properties and methods can’t refer to non-static properties and methods

// 2. To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.
//Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

