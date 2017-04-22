let toDoList = [
  "Take out garbage", "Pay bills", "Cross off finished items"
]

// Use a loop to reverse the order of the elements of this array
var reversed: [String] = []
for i in stride(from: toDoList.count - 1, to: -1, by: -1) {
    reversed.append(toDoList[i])
}
print("Normal order:", toDoList)
print("Reversed:", reversed)
// Examine the documentation to see if there is an implementation of reversal
print("Normal order reversed == reversed?", toDoList.reversed() == reversed)
