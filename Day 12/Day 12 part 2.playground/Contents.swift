//// 5. Deinitializers
////Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.
//
////This comes with a few small provisos:
//
//// 1. Just like initializers, you don’t use func with deinitializers – they are special.
//// 2. Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
//// 3. Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
//// 4. We never call deinitializers directly; they are handled automatically by the system.
//// 5. Structs don’t have deinitializers, because you can’t copy them.
//
//class User{
//    let id: Int
//    
//    init(id: Int) {
//        self.id = id
//        print("User \(id): I'm alive")
//    }
//    
//    deinit {
//        print("User \(id): I'm dead")
//    }
//}
//
////for i in 1...3 {
////    let user = User(id: i)
////    print("User \(user.id): I'm in control!")
////}
//
//var users = [User]()
//
//for i in 1...3 {
//    let user = User(id: i)
//    print("User \(user.id): I'm in control!")
//    users.append(user)
//}
//
//print("Loop is finished!")
//users.removeAll()
//print("Array is clear!")
//
//
//
//
//var user1 = User(id: 1)
//var isTrue = false
//if(isTrue){
//    var user2 = user1;
//    var user3 = user2;
//}else{
//    user1 = User(id: 2)
//}
//


//Behind the scenes Swift performs something called automatic reference counting, or ARC. ARC tracks how many copies of each class instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed Swift subtracts 1 from its reference count. When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.

//So, the simple reason for why structs don’t have deinitializers is because they don’t need them: each struct has its own copy of its data, so nothing special needs to happen when it is destroyed.
//Convention: Put deinit at the end of class. Syntax: Can put anywhere in class.



// 6. Working with variables in class
class User2 {
    var name = "Paul"
}

let user = User2()
user.name = "Taylor"
//user = User2() //invalid
print(user.name)

// user object wasn't changed and can't be changed(let), The data of the class can change, but the instance itself, cannot be.

var user2 = User2()
user2.name = "Taylor"
user2 = User2() //allowed here
print(user2.name)



// 1. Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
// 2. Constant instance, variable property – a signpost that always points to the same user, but their name can change.
// 3. Variable instance, constant property – a signpost that can point to different users, but their names never change.
// 4. Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.


//This is different from structs, because constant structs cannot have their properties changed even if the properties were made variable. Hopefully you can now see why this happens: structs don’t have the whole signpost thing going on, they hold their data directly. This means if you try to change a value inside the struct you’re also implicitly changing the struct itself, which isn’t possible because it’s constant.

//One upside to all this is that classes don’t need to use the mutating keyword with methods that change their data. This keyword is really important for structs because constant structs cannot have their properties changed no matter how they were created, so when Swift sees us calling a mutating method on a constant struct instance it knows that shouldn’t be allowed.


//One of the small but important differences between structs and classes is the way they handle mutability of properties:
//
//Variable classes can have variable properties changed
//Constant classes can have variable properties changed
//Variable structs can have variable properties changed
//Constant structs cannot have variable properties changed
//
//The reason for this lies in the fundamental difference between a class and a struct: one points to some data in memory, whereas the other is one value such as the number 5.
