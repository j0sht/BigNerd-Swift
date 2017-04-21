for i in 0...100 {
    let s: String
    switch (i % 3, i % 5) {
    case (0, 0):
        s = "FizzBuzz"
    case (0, _):
        s = "Fizz"
    case (_, 0):
        s = "Buzz"
    default:
        s = String(i)
    }
    print(s, terminator:", ")
}
print()
