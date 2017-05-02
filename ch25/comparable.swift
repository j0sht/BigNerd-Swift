import Foundation

struct Point {
    let x: Int
    let y: Int
}
extension Point: Comparable {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    static func <(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x < rhs.x) && (lhs.y < rhs.y)
    }
}
extension Point: CustomStringConvertible {
    var description: String {
        return "Point(x: \(x), y: \(y))"
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
