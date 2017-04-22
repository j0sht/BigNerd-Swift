var groceryBag = Set(["Apples", "Oranges", "Pineapple"])
var friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])

// Rework the examples in the chapter for union and intersection
// to use methods that modify groceryBag in place

// Union
print(groceryBag)
groceryBag.formUnion(friendsGroceryBag)
print(groceryBag)
// Intersection
groceryBag = Set(["Apples", "Oranges", "Pineapple"])
friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
print(groceryBag)
groceryBag.formIntersection(friendsGroceryBag)
print(groceryBag)
