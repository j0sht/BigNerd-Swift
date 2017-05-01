import Foundation

func findAll<T: Equatable>(_ ts: [T], _ t: T) -> [Int] {
    var found = [Int]()
    for (i,x) in ts.enumerated() where x == t {
        found.append(i)
    }
    return found
}
let result = findAll([5,3,7,3,9], 3) == [1, 3]
print("findAll([5,3,7,3,9], 3) == [1,3]: \(result)")
