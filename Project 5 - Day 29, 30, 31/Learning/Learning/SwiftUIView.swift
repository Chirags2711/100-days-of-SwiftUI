//
//  SwiftUIView.swift
//  Learning
//
//  Created by Chirag Sharma on 02/02/24.
//

import SwiftUI
//When we use Image views, SwiftUI knows to look in your app’s asset catalog to find the artwork, and it even automatically adjusts the artwork so it loads the correct picture for the current screen resolution – that’s the @2x and @3x stuff we looked at earlier.
//For other data, such as text files, we need to do more work. This also applies if you have specific data formats such as XML or JSON – it takes the same work regardless of what file types you’re loading.
struct SwiftUIView: View {
    var body: some View {
        Text("Hello, World!")
        Button("Press Me"){
            testStrings()
        }
    }
    //Loading resources from App Bundle
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            //We found the file in our Bundle
            //What’s inside the URL doesn’t really matter, because iOS uses paths that are impossible to guess – our app lives in its own sandbox, and we shouldn’t try to read outside of it.
            //Once we have a URL, we can load it into a string with a special initializer: String(contentsOf:). We give this a file URL, and it will send back a string containing the contents of that file if it can be loaded. If it can’t be loaded it throws an error, so you you need to call this using try or try? like this:
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string
                
            }
        }
    }
    
    //Working with Strings
    func testStrings() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        print(letters)
        
        let input2 = """
        a
        b
        c
        """
        let letters2 = input2.components(separatedBy: "\n")
        print(letters2)
        let letter = letters.randomElement()
        print(letter!)
//        Another useful string method is trimmingCharacters(in:), which asks Swift to remove certain kinds of characters from the start and end of a string. This uses a new type called CharacterSet, but most of the time we want one particular behavior: removing whitespace and new lines – this refers to spaces, tabs, and line breaks, all at once.
//
//        This behavior is so common it’s built right into the CharacterSet struct, so we can ask Swift to trim all whitespace at the start and end of a string like this:
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

        let trimmed = "  21 423 54325 4     ".trimmingCharacters(in: .whitespacesAndNewlines) //Uses CharacterSet struct
        print(type(of: trimmed)) //String
        
        //This functionality is provided through the class UITextChecker. You might not realize this, but the “UI” part of that name carries two additional meanings with it:
        
//        1. This class comes from UIKit. That doesn’t mean we’re loading all the old user interface framework, though; we actually get it automatically through SwiftUI.
//        2. It’s written using Apple’s older language, Objective-C. We don’t need to write Objective-C to use it, but there is a slightly unwieldy API for Swift users.
        
        
    }
    func checkStrings(){
        //1. Make the word to check and an instance of UITextChecker.
        let word = "swift"
        let checker = UITextChecker()
        
        //2. We need to tell the checker how much of our string we want to check.
        //However, there’s a catch: Swift uses a very clever, very advanced way of working with strings, which allows it to use complex characters such as emoji in exactly the same way that it uses the English alphabet. However, Objective-C does not use this method of storing letters, which means we need to ask Swift to create an Objective-C string range using the entire length of all our characters, like this:
        let range = NSRange(location: 0, length: word.utf16.count)
        //UTF16 is a character encoding
        //UTF-16 is what’s called a character encoding – a way of storing letters in a string. We use it here so that Objective-C can understand how Swift’s strings are stored; it’s a nice bridging format for us to connect the two.
        
        //3. We can ask our text checker to report where it found any misspellings in our word, passing in the range to check, a position to start within the range (so we can do things like “Find Next”), whether it should wrap around once it reaches the end, and what language to use for the dictionary:
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //That sends back another Objective-C string range, telling us where the misspelling was found. Even then, there’s still one complexity here: Objective-C didn’t have any concept of optionals, so instead relied on special values to represent missing data.
        
        //In this instance, if the Objective-C range comes back as empty – i.e., if there was no spelling mistake because the string was spelled correctly – then we get back the special value NSNotFound.
        
        //So, we could check our spelling result to see whether there was a mistake or not like this:
        
        let allGood = misspelledRange.location == NSNotFound
    }
}

#Preview {
    SwiftUIView()
}


//The original code for the Cocoa frameworks came from the NeXTSTEP libraries Foundation and AppKit (those names are still used by Apple's Cocoa frameworks), and the NextStep engineers chose to prefix their symbols with NS.

//Because Objective-C is an extension of C and thus doesn't have namespaces like in C++, symbols must be prefixed with a unique prefix so that they don't collide. This is particularly important for symbols defined in a framework.
