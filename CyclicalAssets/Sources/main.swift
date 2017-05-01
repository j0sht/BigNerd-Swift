import Foundation

var bob: Person? = Person(name: "Bob")
print("Allocated: \(bob)")
var laptop: Asset? = Asset(name: "Laptop", value: 1_500.0)
var stock: Asset? = Asset(name: "Apple Stock", value: 5_000.0)
var apartment: Asset? = Asset(name: "Apartment", value: 1_000_000)
[laptop, stock, apartment].forEach { print("Allocated: \($0)") }
bob?.useNetWorthChangedHandler { netWorth in
    print("Bob's net worth is now \(netWorth)")
}
[laptop, stock].forEach { if let a = $0 { bob?.addAsset(a) } }
bob?.releaseAsset(apartment!)
bob?.releaseAsset(stock!)
print(bob?.assets)
laptop = nil
stock = nil
apartment = nil
bob = nil
