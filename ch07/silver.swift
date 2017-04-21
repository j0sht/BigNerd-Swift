// Create "Hello" with Unicode scalars
let hello = [72, 101, 108, 108, 111].reduce("") { (acc, i) in
    acc + String(UnicodeScalar(i)!)
}
print(hello + "!")
