for i in 0...100 {
    var s = ""
    if i % 3 == 0 {
        s += "Fizz"
    }
    if i % 5 == 0 {
        s += "Buzz"
    }
    if s == "" {
        s = String(i)
    }
    print(s, terminator:", ")
}
print()
