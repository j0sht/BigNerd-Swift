let myCities = Set(["Atlanta", "Chicago", "Jacksonville",
                    "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])

// Find a Set method that indicates whether myCities
// contains all the cities in yourCities
print(myCities.isSuperset(of: yourCities))
