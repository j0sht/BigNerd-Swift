import Foundation

func printTable(_ data: [[String]],
                withColumnLabels columnLabels: String...) {
    let headers = columnLabels.reduce("|") { $0 + " \($1) |" }
    print(headers)
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

printTable(data,
           withColumnLabels: "Employee Name", "Age", "Years of Experience")
