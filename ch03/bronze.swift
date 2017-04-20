import Foundation

let population: Int
if CommandLine.arguments.count > 1 {
    population = Int(CommandLine.arguments[1]) ?? 5422
} else {
    population = 5422
}

let message: String
let hasPostOffice = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if (10000..<50000).contains(population) {
    message = "\(population) is a medium town!"
} else if (50000..<1000000).contains(population) {
    message = "\(population) is pretty big!"
} else {
    message = "\(population) is yuge!"
}
print(message)
