import Foundation
//Extensions

//Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines) //from foundation API, both function and parameter
print(trimmed)

extension String{
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

//Let’s break that down…

//We start with the extension keyword, which tells Swift we want to add functionality to an existing type.
//Which type? Well, that comes next: we want to add functionality to String.
//Now we open a brace, and all the code until the final closing brace is there to be added to strings.
//We’re adding a new method called trimmed(), which returns a new string.
//Inside there we call the same method as before: trimmingCharacters(in:), sending back its result.
//Notice how we can use self here – that automatically refers to the current string. This is possible because we’re currently in a string extension.

let trimmed2 = quote.trimmed()
print(trimmed2)

// The extension has a number of benefits over the global function, including:

//When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
//Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
//Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.
//Extensions make it easier to modify values in place – i.e., to change a value directly, rather than return a new value.

//eg:

extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quote.trim()
print(quote)

//Notice how the method has slightly different naming now: when we return a new value we used trimmed(), but when we modified the string directly we used trim(). This is intentional, and is part of Swift’s design guidelines: if you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().

//if you create a variable array you can use sort() on it to sort the array in place rather than returning a new copy. sorted() for new copy

//You can also use extensions to add properties to types, but there is one rule: they must only be computed properties, not stored properties. The reason for this is that adding new stored properties would affect the actual size of the data types – if we added a bunch of stored properties to an integer then every integer everywhere would need to take up more space in memory, which would cause all sorts of problems.

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines) //breaks the string up into a string array by splitting it on a boundary of our choosing
    }
}
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)



//f we implement a custom initializer inside an extension, then Swift won’t disable the automatic memberwise initializer. This makes sense if you think about it: if adding a new initializer inside an extension also disabled the default initializer, one small change from us could break all sorts of other Swift code.

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let lotr2 = Book(title: "LOTR", pageCount: 100)
print(lotr)
print(lotr2)


//conformance grouping and purpose grouping.

//Conformance grouping means adding a protocol conformance to a type as an extension, adding all the required methods inside that extension. This makes it easier to understand how much code a developer needs to keep in their head while reading an extension – if the current extension adds support for Printable, they won’t find printing methods mixed in with methods from other, unrelated protocols.
//
//On the other hand, purpose grouping means creating extensions to do specific tasks, which makes it easier to work with large types. For example, you might have an extension specifically to handle loading and saving of that type.
//
//It’s worth adding here that many folks realize they have a large class and try to make it smaller by splitting it into extensions. To be quite clear: the type is exactly the same size it was before, it’s just neatly split up. This does mean it’s likely to be a little easier to understand, but it doesn’t mean the class is any smaller.
