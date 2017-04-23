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
        let bar = String(repeating: "=", count: 20)
        print(bar)
        print("Mayor's statment:")
        print(String(repeating: "-", count: 20))
        print("I'm deeply saddened to hear about this", terminator: " ")
        print("latest tragedy.")
        print("I promise that my office is looking into", terminator: " ")
        print("the nature of this rash of violence.")
        print(bar)
    }

    func peekIntoMayorsPsyche() {
        print("I'm freaking out!! anxietyLevel = \(anxietyLevel) \u{1F62B}")
    }
}
