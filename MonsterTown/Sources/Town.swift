import Foundation

struct Town {
    let region = "South"
    var population = 5_422 {
        didSet {
            print("The population has changed to", terminator: " ")
            print("\(population) from \(oldValue)")
        }
    }
    var numberOfStoplights = 4

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
        print("Population: \(population);", terminator: " ")
        print("number of stoplights: \(numberOfStoplights)")
    }

    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}
