import Foundation

struct Stack<Element> {
    var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        return items.popLast()
    }
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

var nums = Stack<Int>()
nums.push(1)
nums.push(2)
var doubleStacked = nums.map { 2 * $0 }
print(nums.pop())
print(nums.pop())
print(nums.pop())
print(doubleStacked.pop())
print(doubleStacked.pop())

func myMap<T,U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var results = [U]()
    for item in items {
        results.append(f(item))
    }
    return results
}
let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.characters.count }
print(stringLengths)
print(stringLengths == strings.map { $0.characters.count })

func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}
print(checkIfEqual(1,1))
print(checkIfEqual("hello", "world"))
print(checkIfEqual("hola", "hola"))
func descriptionsMatch<T: CustomStringConvertible,
                       U: CustomStringConvertible>(_ x: T, _ y: U) -> Bool {
    return x.description == y.description
}
print(descriptionsMatch(Int(1), UInt(1)))
print(descriptionsMatch(Float(1), Double(1)))
