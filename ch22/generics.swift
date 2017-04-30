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
