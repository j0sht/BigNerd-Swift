let population: Int
if CommandLine.arguments.count > 1 {
    population = Int(CommandLine.arguments[1]) ?? 5422
} else {
    population = 5422
}

let message: String
if population < 10000 {
    message = "\(population) is a small town!"
} else if case 10000..<50000 = population {
    message = "\(population) is a medium town!"
} else if case 50000..<1000000 = population {
    message = "\(population) is pretty big!"
} else {
    message = "\(population) is yuge!"
}
print(message)
