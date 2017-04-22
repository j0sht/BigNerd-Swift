import Foundation

let montanaCounties = [
  "Beaverhead" : [59724, 59725, 59761, 59762, 59746],
  "Casade": [59443, 59421, 59404, 59405, 59465],
  "Flathead": [59922, 59911, 59920, 59845, 59903]
]
// Repeat the silver challenge but make sure the formatting
// matches that in the book
let start = "Montana has the following zip codes: ["
let spaces = String(repeating: " ", count: start.characters.count)
let zipCodes = montanaCounties.values.reduce([], +)
for i in stride(from: 0, to: zipCodes.count, by: 5) {
    let end = i+5 > zipCodes.count ? zipCodes.count : i+5
    let codes = zipCodes[i..<end]
    let printableCodes = codes.map({ String($0) }).joined(separator: ", ")
    if i == 0 {
        print(start, terminator: "")
        print(printableCodes, terminator: ",\n")
    } else {
        print(spaces, terminator: "")
        let terminator = (end == zipCodes.count) ? "]\n" : ",\n"
        print(printableCodes, terminator: terminator)
    }
}

