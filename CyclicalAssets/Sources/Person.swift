import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    private(set) var assets = [Asset]()
    // CustomStringConvertible
    var description: String {
        return "Person(\(name))"
    }
    init(name: String) {
        self.name = name
        // [weak self] is a capture list
        // [weak self] tells Swift to capute self weakly
        // instead of the default strong
        // Necessary here to prevent a strong-reference cycle between
        // Person and Accountant via netWorthChangedHandler
        accountant.netWorthChangedHandler = { [weak self] netWorth in
            // Because self is captured weakly, and all weak
            // instances must be optional, self inside the
            // closure is optional
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    deinit {
        print("\(self) is being deallocated")
    }
    func addAsset(_ asset: Asset) {
        asset.owner = self
        assets.append(asset)
        accountant.gained(asset)
    }
    func netWorthDidChange(to netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}
