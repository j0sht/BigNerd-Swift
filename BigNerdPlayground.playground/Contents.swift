//: Playground - noun: a place where people can play
import Foundation

let result1 = (0...100).reduce("") { (acc, i) in
    switch (i % 3, i % 5) {
    case (0, 0): return acc + "FizzBuzz, "
    case (0, _): return acc + "Fizz, "
    case (_, 0): return acc + "Buzz, "
    default: return acc + String(i) + ", "
    }
}.trimmingCharacters(in: CharacterSet(charactersIn: ", "))

let result2 = (0...100).map { (i) -> String in
    switch (i % 3, i % 5) {
    case (0, 0): return "FizzBuzz"
    case (0, _): return "Fizz"
    case (_, 0): return "Buzz"
    default: return String(i)
    }
}.joined(separator: ", ")

result1 == result2
