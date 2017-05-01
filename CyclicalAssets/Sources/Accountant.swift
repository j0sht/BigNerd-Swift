import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> Void

    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    // completion is an example of a non-escaping closure
    func gained(_ asset: Asset, completion: () -> Void) {
        netWorth += asset.value
        completion()
    }
    func released(_ asset: Asset, completion: () -> Void) {
        netWorth -= asset.value
        completion()
    }
}
