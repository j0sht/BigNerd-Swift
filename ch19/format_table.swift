import Foundation

func printTable(_ data: [[String]]) {
    for row in data {
        let out = row.reduce("|") { $0 + " \($1) |" }
        print(out)
    }
}

let data = [
  ["Joe", "30", "6"],
  ["Karen", "40", "18"],
  ["Fred", "50", "20"],
]

printTable(data)
