import Foundation

protocol TabularDataSource: CustomStringConvertible {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource) {
    print("Table: \(dataSource.description)")
    let cCount = dataSource.numberOfColumns
    let columnLabels = (0..<cCount).map { dataSource.label(forColumn: $0) }
    let columnWidths = columnLabels.map { $0.characters.count }
    let headers = columnLabels.reduce("|") { $0 + " \($1) |" }
    print(headers)
    for i in 0..<dataSource.numberOfRows {
        let out = (0..<cCount).reduce("|") { (acc, j) in
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidths[j] - item.characters.count
            let padding = String(repeating: " ", count: paddingNeeded)
            return acc + " \(padding)\(item) |"
        }
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource {
    let name: String
    var people = [Person]()
    init(name: String) {
        self.name = name
    }
    mutating func add(_ person: Person) {
        people.append(person)
    }
    // CustomStringConvertible
    var description: String {
        return "Department (\(name))"
    }
    // TabularDatasource
    var numberOfRows: Int {
        return people.count
    }
    var numberOfColumns: Int {
        return 3
    }
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))
printTable(department)
