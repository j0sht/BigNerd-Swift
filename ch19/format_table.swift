import Foundation

func printTable(_ data: [[String]],
                withColumnLabels columnLabels: String...) {
    let columnWidths = columnLabels.map { $0.characters.count }
    let headers = columnLabels.reduce("|") { $0 + " \($1) |" }
    print(headers)
    for row in data {
        let out = row.enumerated().reduce("|") { (acc, tup) in
            let (i, item) = tup
            let paddingNeeded = columnWidths[i] - item.characters.count
            let padding = String(repeating: " ", count: paddingNeeded)
            return acc + " \(padding)\(item) |"
        }
        print(out)
    }
}

let data = [
  ["Joe", "30", "6"],
  ["Karen", "40", "18"],
  ["Fred", "50", "20"],
]

printTable(data,
           withColumnLabels: "Employee Name", "Age", "Years of Experience")
