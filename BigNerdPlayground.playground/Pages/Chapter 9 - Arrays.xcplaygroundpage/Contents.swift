//: [Chapter 6 - Loops](@previous)

import Foundation

// Use a loop to reverse the order of the elements of this array
var toDoList = [
    "Take out garbage", "Pay bills", "Cross off finished items"
]
var reversed: [String] = []
for i in stride(from: toDoList.count - 1, to: -1, by: -1) {
    reversed.append(toDoList[i])
}
toDoList
reversed
// Examine the documentation to see if there is an implementation of reversal
toDoList.reversed() == reversed

// Reversing in place
toDoList = (1...10).map { String($0) }
reversed = toDoList.reversed()
for i in 0..<(toDoList.count / 2) {
    let oppositeIndex = toDoList.count - i - 1
    let currentItem = toDoList[i]
    let oppositeItem = toDoList[oppositeIndex]
    (toDoList[i], toDoList[oppositeIndex]) = (oppositeItem, currentItem)
}
toDoList == reversed

// Reversed with reduce
reversed = toDoList.reduce([]) { [$1] + $0 }
reversed
toDoList.reversed() == reversed
//: [Chapter 10 - Dictionaries](@next)
