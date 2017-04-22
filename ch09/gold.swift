let toDoList = [
  "Climb Mt.Kilimanjaro",
  "Fly hot air balloon to Fiji",
  "Toboggan across Alaska",
  "Go on a walkabout in Australia",
  "Scuba dive in the Great Blue Hole",
  "Find a triple rainbow",
]

// Find a method on Array that will locate the index of
// "Fly hot air balloon to Fiji"
if let index = toDoList.index(of: "Fly hot air balloon to Fiji") {
    // Use index to compute the index that is two positions later
    let later = index + 2
    // Use this new index to find the string at that index
    print("At index \(later): \(toDoList[later])")
}
