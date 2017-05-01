import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person?
    // CustomStringConvertible
    var description: String {
        if let owner = owner {
            return "Asset(\(name) worth $\(value) owned by \(owner))"
        } else {
            return "Asset(\(name) worth $\(value) not owned by anyone!)"
        }
    }
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    deinit {
        print("\(self) is being deallocated")
    }
}
