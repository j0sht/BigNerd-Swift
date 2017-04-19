import Foundation

let numberOfStoplights = 4
var population: Int
population = 5422
let townName = "Knowhere"
// Add a new variable representing Knowhere's level of unemployment
var unemployed = 420
let rate = String(format: "%.2f", Double(unemployed)/Double(population))
let townDescription = "\(townName) has a population of \(population) with \(numberOfStoplights) stoplights and \(unemployed) unemployed (\(rate)%)"
print(townDescription)
