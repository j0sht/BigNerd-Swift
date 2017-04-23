import Foundation

// Silver challenge:
// Make a new type called Mayor
struct Mayor {
    // Gold challenge:
    // Create a stored instance property on the Mayor type
    // called anxietyLevel of type Int with a default value of 0
    // Mark this property as private
    private var anxietyLevel = 0

    mutating func logStatement() {
        // Gold challenge:
        // Increment anxietylevel every time mayor logs statement
        anxietyLevel += 1
        print("I'm deeply saddened to hear about this", terminator: " ")
        print("latest tragedy. I promise that my office", terminator: " ")
        print("is looking into the nature of this", terminator: " ")
        print("rash of violence.")
    }

    func peekIntoMayorsPsyche() {
        print("I'm freaking out!! anxietyLevel = \(anxietyLevel)")
    }
}
