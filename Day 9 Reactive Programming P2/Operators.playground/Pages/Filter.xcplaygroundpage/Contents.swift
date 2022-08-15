//: [Previous](@previous)

import Foundation
import Combine

let numbers = (1...100).publisher

numbers
    .filter { $0.isMultiple(of: 5) }
    .sink(receiveValue: { n in
        print("\(n) is a multiple of 5")
    })

//: [Next](@next)
