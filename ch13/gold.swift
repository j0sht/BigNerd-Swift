import Foundation

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map { $0 * 2 }
let bigProjections = precinctPopulations.filter { $0 > 4000 }
// Clean up the implementation of reduce example
// Your solution should be expressed in one line
let totalProjection = projectedPopulations.reduce(0, +)
print(totalProjection)
print(totalProjection == 10844)
