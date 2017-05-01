import Foundation

func findAll<T: Collection>(_ ts: T, _ t: T.Iterator.Element) -> [T.Index]
  where T.Iterator.Element: Equatable {
    var found = Array<T.Index>()
    var index = ts.startIndex
    for x in ts {
        if x == t {
            found.append(index)
        }
        index = ts.index(after: index)
    }
    return found
}
let r = findAll([5,3,7,3,9], 3)
print(r)
let result = findAll([5,3,7,3,9], 3) == [1, 3]
print("findAll([5,3,7,3,9], 3) == [1,3]: \(result)")
let s = Set<String>(["hello","world","hello","moon"])
print(findAll(s, "hello"))
// Below doesn't compile, error:
// cannot convert value of type 'Character' to expected
// argument type '_.Iterator.Element'
// let x = findAll("hello", Character("l"))
// print(x)
// let x = findAll(["a": 1, "b": 2, "c": 3], ("b", 2))
// print(x)
