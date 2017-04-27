import Foundation

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

// Protocol Composition
// Uses the '&' infix operator to combine multiple protocols
// into a single requirement
func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    let cCount = dataSource.numberOfColumns
    let rCount = dataSource.numberOfRows
    let itemsForColumns = (0..<cCount).map { i in
        return (0..<rCount).map { dataSource.itemFor(row: $0, column: i) }
    }
    let columnLabels = (0..<cCount).map { dataSource.label(forColumn: $0) }
    let columnWidths = columnLabels.enumerated().map { tup -> Int in
        let (i, label) = tup
        let items = itemsForColumns[i]
        let greatest = items.reduce(0) {
            $0 > $1.characters.count ? $0 : $1.characters.count
        }
        let count = label.characters.count
        return (greatest > count) ? greatest : count
    }
    let headers = columnLabels.enumerated().reduce("|") { (acc, tup) in
        let (i, label) = tup
        let paddingNeeded = columnWidths[i] - label.characters.count
        let padding = String(repeating: " ", count: paddingNeeded)
        return acc + " \(padding)\(label) |"
    }
    print(headers)
    for i in 0..<rCount {
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

struct Department: TabularDataSource, CustomStringConvertible {
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

// var department = Department(name: "Engineering")
// department.add(Person(name: "Joe", age: 1000, yearsOfExperience: 6))
// department.add(Person(name: "Karen", age: 40, yearsOfExperience: 18))
// department.add(Person(name: "Fred", age: 50, yearsOfExperience: 20))
// printTable(department)

// Gold Challenge:
// Create BookCollection that conforms to TabularDataSource
// Calling printTable on BookCollection should show table of
// books with titles, authors, and average reviews on Amazon
struct Book {
    let title: String
    let author: String
    let rating: Double
}
struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()
    init(name: String) {
        self.name = name
    }
    mutating func addBook(_ book: Book) {
        books.append(book)
    }
    var description: String { return name }
    var numberOfRows: Int { return books.count }
    var numberOfColumns: Int { return 3 }
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Title"
        case 1: return "Author"
        case 2: return "Rating (out of 5)"
        default: fatalError("Invalid column!")
        }
    }
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.title
        case 1: return book.author
        case 2: return String(format: "%.2f", book.rating)
        default: fatalError("Invalid column!")
        }
    }
}
var collection = BookCollection(name: "Computer Science")
collection.addBook(Book(title: "Introduction to Algorithms",
                        author: "Thomas H. Cormen",
                        rating: 4.3))
collection.addBook(Book(title: "SICP",
                        author: "Harold Abelson",
                        rating: 4.5))
collection.addBook(Book(title: "The C Programming Language",
                        author: "Brian W. Kernighan",
                        rating: 4.6))
printTable(collection)
