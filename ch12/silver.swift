import Foundation

// Write a function called siftBeans(fromGroceryList:) that takes
// a grocery list (as [String]) and "sifts out" the beans from other groceries
// The function should take one argument with parameter name 'list'
// return a named tuple of type (beans: [String], other: [String])

func siftBeans(_ list: [String]) -> (beans: [String], other: [String]) {
    let beans = list.filter { $0.hasSuffix("beans") }
    let other = list.filter { !$0.hasSuffix("beans") }
    return (beans, other)
}

let list = ["green beans", "milk", "black beans", "pinto beans", "apples"]
let result = siftBeans(list)
print("Beans: \(result.beans)")
print("Others: \(result.other)")
print(result.beans == ["green beans", "black beans", "pinto beans"])
print(result.other == ["milk", "apples"])
