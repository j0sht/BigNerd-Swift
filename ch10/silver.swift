import Foundation

// Create a dictionary that represents a state
// The keys should refer to counties (only three)
// Each key should map onto an array holding five zip codes in that county
let montanaCounties = [
  "Beaverhead" : [59724, 59725, 59761, 59762, 59746],
  "Casade": [59443, 59421, 59404, 59405, 59465],
  "Flathead": [59922, 59911, 59920, 59845, 59903]
]
// Log only the dictionary's zip codes
let zipCodes = montanaCounties.values.reduce([], +)
print("Montana has the following zip codes: \(zipCodes)")
