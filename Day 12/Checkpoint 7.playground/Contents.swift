class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}


class Dog: Animal {
    func speak() {
        print("Bhauuuuuu")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corguuuuuu")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodluuuuu")
    }
}


class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak() {
        print("Meowwww meowww meowwwwwwww")
        if isTame {
            print("I am tame")
        }else {
            print("Not tame")
        }
    }
}

class Persian: Cat {
    override func speak() {
        print("Mauwww Mauwww")
        if isTame {
            print("I am tame")
        }else {
            print("Not tame")
        }
    }
}

class Lion: Cat {
    override func speak() {
        print("Darrrooo mere seeeeeee")
        if isTame {
            print("I am tame")
        }else {
            print("Not tame")
        }
    }
}

var animal: Animal = Animal(legs: 3)
print(animal.legs)
var dog = Dog(legs: 4)
dog.speak()
var cat = Cat(isTame: true, legs: 4)
cat.speak()
var corgi = Corgi(legs: 4)
corgi.speak()
var poodle = Poodle(legs: 4)
poodle.speak()
var persian = Persian(isTame: true, legs: 4)
persian.speak()
var lion = Lion(isTame: false, legs: 4)
lion.speak()
