import Foundation

// Create a new Person class with two properties: name and age
class Person {
    let name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
// Create two new instances of the Person class
// Assign thos instances to constants p1 and p2
let p1 = Person(name: "Person 1", age: 1)
let p2 = Person(name: "Person 2", age: 2)
// Also create an array named people to hold these instances
let people = [p1, p2]
// Assign the result of index(of:) to a constant name p1Index
// It's value should be 0
extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
}
if let p1Index = people.index(of: p1) {
    print("p1Index == 0? \(p1Index == 0)")
}
