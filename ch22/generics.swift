import Foundation

struct Stack<Element> {
    private(set) var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        return items.popLast()
    }
}

var nums = Stack<Int>()
nums.push(1)
nums.push(2)
print(nums.pop())
print(nums.pop())
print(nums.pop())
