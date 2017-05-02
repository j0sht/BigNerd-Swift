import Foundation

struct Point {
    let x: Int
    let y: Int
}
extension Point: Comparable {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    // Platinum challenge
    // Return true for a < b when a is closer to origin than b
    static func <(lhs: Point, rhs: Point) -> Bool {
        func sqr(_ x: Int) -> Int { return x * x }
        let a = sqrt(Double(sqr(0 - lhs.x) + sqr(0 - lhs.y)))
        let b = sqrt(Double(sqr(0 - rhs.x) + sqr(0 - rhs.y)))
        return a < b
    }
}
extension Point: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}
// Bronze challenge
// Make it possible to add two points together
extension Point {
    static func+(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
let a = Point(x: 1, y: 1)
let b = Point(x: 2, y: 2)
print("\(a) + \(b) = \(a + b)")
// Platinum challenge output
let c = Point(x: 3, y: 4)
let d = Point(x: 2, y: 5)
print("\(c) > \(d) = \(c > d)")
print("\(c) < \(d) = \(c < d)")
print("\(c) == \(d) = \(c == d)")
