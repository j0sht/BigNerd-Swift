//: [Chapter 9 - Arrays](@previous)

import Foundation

let montanaCounties = [
    "Beaverhead" : [59724, 59725, 59761, 59762, 59746],
    "Casade": [59443, 59421, 59404, 59405, 59465],
    "Flathead": [59922, 59911, 59920, 59845, 59903]
]

let zipCodes = montanaCounties.values.reduce([], +)
let codes = zipCodes[0..<5]
let printableCodes = codes.map { String($0) }.joined(separator: ", ")
printableCodes

//: [Next](@next)
