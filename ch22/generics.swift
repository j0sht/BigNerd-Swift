import Foundation

struct StackIterator<T>: IteratorProtocol {
    var stack: Stack<T>
    mutating func next() -> T? {
        return stack.pop()
    }
}
struct Stack<Element>: Sequence {
    var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pushAll<S: Sequence>(_ s: S)
      where S.Iterator.Element == Element {
        for item in s {
            self.push(item)
        }
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
    // Sequence conformance
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
}
func myMap<T,U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
    var results = [U]()
    for item in items {
        results.append(f(item))
    }
    return results
}
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}
func descriptionsMatch<T: CustomStringConvertible,
                       U: CustomStringConvertible>(_ x: T, _ y: U) -> Bool {
    return x.description == y.description
}
// Output
var myStack = Stack<Int>()
[10, 20, 30].forEach { myStack.push($0) }
var myStackIterator = StackIterator(stack: myStack)
while let val = myStackIterator.next() {
    print("got \(val)")
}
for value in myStack {
    print("for-in loop: got \(value)")
}
var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1,2,3])
myStack.pushAll(myOtherStack)
for value in myStack {
    print("After push items onto stack, got \(value)")
}
