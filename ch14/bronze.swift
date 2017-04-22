import Foundation

enum ShapeDimensions {
    case point
    case square(side: Double)
    case rectangle(width: Double, height: Double)

    func area() -> Double {
        switch self {
        case .point:
            return 0.0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }

    // Add a perimeter method
    // This method should compute the perimeter of a shape
    // (the sum of the length of all it's edges)
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0.0
        case let .square(side: s):
            return s * 4
        case let .rectangle(width: w, height: h):
            return (w * 2) + (h * 2)
        }
    }
}

let square = ShapeDimensions.square(side: 4)
let rect = ShapeDimensions.rectangle(width: 2, height: 3)
print("Square with side of 4 has perimeter: \(square.perimeter())")
print("Rectangle with width of 2 and height of 3 has perimeter: \(rect.perimeter())")
