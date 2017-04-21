import Foundation // needed for joined method

let s = (0...100).map { (i) -> String in
    switch (i % 3, i % 5) {
    case (0, 0): return "FizzBuzz"
    case (0, _): return "Fizz"
    case (_, 0): return "Buzz"
    default: return String(i)
    }
}.joined(separator: ", ")
print(s)
