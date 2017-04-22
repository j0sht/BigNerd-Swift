import Foundation

enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    // Add case for right triangle
    // Keep track of the length of its three sides
    case rightTriangle(a: Double, b: Double, c: Double)
    // Add case to area for .rightTriangle
    func area() -> Double {
        switch self {
        case .point:
            return 0.0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        case let .rightTriangle(a: a, b: b, c: _):
            return (a * b) / 2.0
        }
    }
}

let t = ShapeDimensions.rightTriangle(a: 10, b: 20, c: 30)
print("Area of triangle where a = 10, and b = 20: \(t.area())")
print(t.area() == 100.0)
