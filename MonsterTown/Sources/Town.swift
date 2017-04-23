import Foundation

struct Town {
    let region: String
    var mayor = Mayor()
    var population: Int {
        didSet {
            if population < oldValue {
                mayor.logStatement()
                mayor.peekIntoMayorsPsyche()
            }
        }
    }
    var numberOfStoplights: Int

    init(region: String, population: Int, stoplights: Int) {
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }

    init(population: Int, stoplights: Int) {
        self.init(region: "N/A",
                  population: population,
                  stoplights: stoplights)
    }

    var townSize: Size {
        switch population {
        case 0...10_000:
            return .small
        case 10_001...100_000:
            return .medium
        default:
            return .large
        }
    }

    enum Size {
        case small, medium, large
    }

    func printDescription() {
        print("Region: \(region);", terminator: " ")
        print("Population: \(population);", terminator: " ")
        print("number of stoplights: \(numberOfStoplights)")
    }

    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
