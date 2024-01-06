//Observers
// 1. didSet : run when the property just changed, (not while Struct init). We also have 'oldValue' constant.
// 2. willSet : run before the property changed. We have 'newValue' constant here.


struct Game{
    var score = 0{
        didSet{
            print("Score is now \(score)")
        }
    }
}

var game = Game(score: 1_00)
game.score += 10
game.score -= 3
game.score += 1


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


//You can't attach a property observer to a constant, because it will never change.
