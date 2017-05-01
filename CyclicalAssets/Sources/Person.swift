import Foundation

class Person: CustomStringConvertible {
    let name: String
    private(set) var assets = [Asset]()
    // CustomStringConvertible
    var description: String {
        return "Person(\(name))"
    }
    init(name: String) {
        self.name = name
    }
    func addAsset(_ asset: Asset) {
        asset.owner = self
        assets.append(asset)
    }
    deinit {
        print("\(self) is being deallocated")
    }
}
