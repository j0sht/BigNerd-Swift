import Foundation

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
// Use simpler method to sort collection in ascending order
let sorted = volunteerCounts.sorted()
print("Sorted: \(sorted)")
// Apply this method to solution to previous bronze challenge
print("Before: \(volunteerCounts)")
volunteerCounts.sort()
print("After:  \(volunteerCounts)")
