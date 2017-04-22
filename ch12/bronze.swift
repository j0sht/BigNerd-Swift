func greetByMiddleName(fromFullName name: (first: String,
                                           middle: String?,
                                           last: String)) {
    // Add an additional clause to the guard statement
    // This clause should check to see if middle < 4 characters
    // If it is, greet person by their middle name
    // else, use generic greeting
    guard let middle = name.middle, middle.characters.count < 4 else {
        print("Hey there!")
        return
    }
    print("Hey \(middle)")
}

greetByMiddleName(fromFullName: ("Joshua", "Mason", "Tate")) // "Hey there!"
greetByMiddleName(fromFullName: ("Arnold", "Bob", "Booger")) // "Hey Bob"
greetByMiddleName(fromFullName: ("Jessica", nil, "Rabbit"))  // "Hey there!"
