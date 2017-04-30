import Foundation

// Extend the Int type to have a timesFive computed property
// The computed property should return the result of multiplying
// the integer by 5
extension Int {
    var timesFive: Int { return self * 5 }
}
print(5.timesFive == 25)
