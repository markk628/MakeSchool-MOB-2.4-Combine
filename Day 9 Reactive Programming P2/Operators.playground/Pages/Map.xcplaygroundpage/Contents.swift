import UIKit
import Combine

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[8, 16, 20].publisher
    .map {
        formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink(receiveValue: { print($0) })
