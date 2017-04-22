import Foundation

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
// Sort volunteerCounts in place, from smallest to largest
print("Before: \(volunteerCounts)")
volunteerCounts.sort(by: <)
print("After:  \(volunteerCounts)")
