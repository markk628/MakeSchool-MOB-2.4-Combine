//: [Previous](@previous)

import Foundation
import Combine

let strings = ["hey", "meh", "8","0.88", "80"].publisher

strings
    .compactMap { Int($0) }
    .sink(receiveValue: {
        print($0)
    })
//: [Next](@next)
