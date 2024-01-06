let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"
print(new)
let new2 = captains["Serenity", default: "N/A"]
//does the same thing
//Difference: Nil Coalescing works with any optional



let tvShows: [String] = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite)



struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil) //Important to provide parameter, even if it is nil
let author = book.author ?? "Anonymous"
print(author)


let input = "dskv fdjkvned"
let number = Int(input) ?? 0
print(number)


//Chained nil coalescing

//let savedData = first() ?? second() ?? ""
//That will attempt to run first(), and if that returns nil attempt to run second(), and if that returns nil then it will use an empty string.
